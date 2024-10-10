// 예시 아이디 목록 (실제로는 서버에서 데이터를 받아와야 함)
let users = ['user123', 'user456', 'user789', 'userABC'];

// 승인 모달 열기
function openApprovalModal() {
    const userListDiv = document.getElementById('userList');
    userListDiv.innerHTML = ''; // 기존 목록 초기화

    // 아이디 목록을 모달에 추가
    users.forEach(user => {
        const userDiv = document.createElement('div');
        userDiv.classList.add('user-item');
        userDiv.id = `user-${user}`; // 각 사용자에게 고유 ID 부여

        // 아이디 텍스트
        const userNameSpan = document.createElement('span');
        userNameSpan.textContent = `승인할 사용자 ID: ${user}`;
        userDiv.appendChild(userNameSpan);

        // 체크박스
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.classList.add('approve-checkbox');
        checkbox.value = user;
        userDiv.appendChild(checkbox);

        // 리스트에 추가
        userListDiv.appendChild(userDiv);
    });

    // 모달을 화면에 표시
    document.getElementById('approvalModal').style.display = 'block';

    // 만약 목록이 비어 있으면 모달 자동 닫기
    if (users.length === 0) {
        closeApprovalModal();
    }
}

// 승인 또는 거절 처리 (approve: true일 경우 승인, false일 경우 거절)
function processApproval(approve) {
    const checkboxes = document.querySelectorAll('.approve-checkbox:checked');
    if (checkboxes.length === 0) {
        alert('최소 한 명 이상의 사용자를 선택해야 합니다.');
        return;
    }

    checkboxes.forEach(checkbox => {
        const user = checkbox.value;
        const userDiv = document.getElementById(`user-${user}`);
        userDiv.remove(); // 목록에서 제거

        if (approve) {
            alert(`${user} 승인되었습니다.`);
        } else {
            alert(`${user} 거절되었습니다.`);
        }

        // 실제로는 여기에 서버로 승인 또는 거절 데이터를 전송하는 로직이 추가되어야 합니다.
        users = users.filter(u => u !== user); // 사용자 목록에서 제거
    });

    // 목록에서 모든 사용자가 제거되면 모달 자동 닫기
    if (users.length === 0) {
        closeApprovalModal();
    }
}

// 승인 모달 닫기
function closeApprovalModal() {
    document.getElementById('approvalModal').style.display = 'none';
}