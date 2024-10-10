let socket;
let nickname = null;

// WebSocket 연결 및 이벤트 처리
function connectWebSocket() {
	socket = new WebSocket('ws://192.168.219.142:3000');

	socket.onopen = function() {
		console.log('WebSocket 연결 성공');
	};

	socket.onmessage = function(event) {
		let data = event.data;

		if (data instanceof Blob) {
			const reader = new FileReader();
			reader.onload = function() {
				try {
					const parsedData = JSON.parse(reader.result);
					const message = parsedData.message;
					document.getElementById('chatbox').innerHTML += `<div><strong>${parsedData.nickname}:</strong> ${message}</div>`;
				} catch (err) {
					console.error('Invalid JSON: ', reader.result);
				}
			};
			reader.readAsText(data);
		} else {
			try {
				const parsedData = JSON.parse(data);
				const message = parsedData.message;
				document.getElementById('chatbox').innerHTML += `<div><strong>${parsedData.nickname}:</strong> ${message}</div>`;
			} catch (err) {
				console.error('Invalid JSON: ', data);
			}
		}
	};

	socket.onclose = function() {
		console.log('WebSocket 연결이 종료되었습니다.');
	};
}

// 닉네임 설정 및 메시지 전송 처리
document.getElementById('set-nickname').onclick = function() {
	nickname = document.getElementById('nickname').value.trim();
	if (nickname) {
		document.getElementById('nickname').disabled = true;
		document.getElementById('set-nickname').disabled = true;
		document.getElementById('message').disabled = false;
		document.getElementById('send').disabled = false;

		connectWebSocket();
	} else {
		alert("닉네임을 입력해주세요.");
	}
};

// 전송 버튼 클릭 시 메시지 전송
document.getElementById('send').onclick = function() {
	const message = document.getElementById('message').value;
	if (message && nickname) {
		socket.send(JSON.stringify({ nickname: nickname, message: message }));
		document.getElementById('message').value = '';
	}
};

// Enter 키로도 메시지 전송 가능하게
document.getElementById('message').addEventListener('keypress', function(event) {
	if (event.key === 'Enter') {
		document.getElementById('send').click();
	}
});