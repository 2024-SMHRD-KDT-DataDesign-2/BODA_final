<%@page import="com.smhrd.model.projectDTO"%>
<%@page import="com.smhrd.model.projectDAO"%>
<%@page import="com.smhrd.model.KanbanDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page
	import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset='utf-8' />
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- FullCalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>

<!-- FullCalendar 언어 지원 -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- 외부 CSS -->
<link rel="stylesheet" href="assets/메인.css">
<link rel="stylesheet" href="assets/메인칸반.css">
<link rel="stylesheet" href="assets/승인.css">
<style>
/* 기본적인 스타일들 */
#chat-container {
	position: absolute;
	bottom: 10px;
	margin-left: 1530px;
	width: 380px;
	height: 840px;
	border: 1px solid #ddd;
	background-color: #f9f9f9;
	border-radius: 8px;
	overflow: hidden;
	display: flex;
	flex-direction: column;
}

#chatbox {
	flex-grow: 1;
	padding: 10px;
	overflow-y: auto;
	background-color: white;
}

#controls {
	display: flex;
	padding: 5px;
	border-top: 1px solid #ddd;
}

#nickname-container {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	display: flex;
}

#nickname {
	flex: 1;
	padding: 5px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

#set-nickname {
	margin-left: 5px;
	padding: 5px 10px;
}

#message {
	flex: 1;
	padding: 5px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

#send {
	margin-left: 5px;
	padding: 5px 10px;
}
</style>

</head>

<body>
	<%
	projectDTO selectAll = (projectDTO) session.getAttribute("projData");

	System.out.println("메인" + selectAll.getTeam_idx());

	List<KanbanDTO> tasks = (List<KanbanDTO>)session.getAttribute("tasks");

	System.out.println("메인1" + tasks);
	
	%>

	<%
	// Initialize empty user list
	String users = "[]";

	// OracleDB connection details
	String jdbcUrl = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe"; // Replace with your DB details
	String dbUser = "cgi_24k_dd26_p2_3";
	String dbPassword = "smhrd3";

	try {
		// Load Oracle JDBC Driver
		Class.forName("oracle.jdbc.driver.OracleDriver");

		// Create a connection to the database
		Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

		// Create a statement object to execute the query
		Statement statement = connection.createStatement();

		// Execute the query to fetch user data
		String query = "SELECT mem_id FROM team_approve where team_idx = " + selectAll.getTeam_idx(); // Adjust query to match your table/column
		ResultSet resultSet = statement.executeQuery(query);

		// Start building a JavaScript array as a string
		StringBuilder userArray = new StringBuilder("[");
		while (resultSet.next()) {
			userArray.append("\"").append(resultSet.getString("mem_id")).append("\",");
		}

		// Remove trailing comma and close the array
		if (userArray.length() > 1) {
			userArray.setLength(userArray.length() - 1);
		}
		userArray.append("]");

		// Store the result as a string in the `users` variable
		users = userArray.toString();

		// Close the resultSet, statement, and connection
		resultSet.close();
		statement.close();
		connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

	<header>
		<a href="프로젝트입장Service2" style="text-decoration: none"><div class="logo">BODA</div></a>
		<div class="header-buttons">
			<button class="login-btn" onclick="openApprovalModal()">승인</button>
			<form action="LogoutService" method="post">
				<button class="signup-btn" type="submit">로그아웃</button>
			</form>
		</div>

	</header>

	<!-- 승인 모달 -->
	<div id="approvalModal" class="modal">
		<div class="modal-content">
			<span class="close-btn" onclick="closeApprovalModal()">&times;</span>
			<h2>승인 요청</h2>
			<p>아래 승인 요청 내용을 확인하고 승인 또는 거절 여부를 결정해 주세요.</p>
			<form id="approvalForm">
				<div id="userList"></div>
				<button type="button" class="submit-approve-btn"
					onclick="processApproval(true)">승인</button>
				<button type="button" class="submit-reject-btn"
					onclick="processApproval(false)">거절</button>
			</form>
		</div>
	</div>



	<div class="container">
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="KanbanSelect">칸반보드</a> <a href="서브캘린더.jsp">캘린더</a> <a
				href="회고록.jsp">보고서</a><a href="memoirService2">게시판</a> <a
				href="도움말.jsp">도움말</a> <a href="서브룰렛.jsp">룰렛</a> <a
				href="내프로젝트조회Service">프로젝트 선택</a>
		</div>

		<div id="main">
			<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;</span>
		</div>

		<main class="content">
			<div id="wow">
				<div class="panel" id="panel-todo">
					<h2>할일</h2>
					<div id="content-1">
						<%
						for (KanbanDTO task : tasks) {
							if (task.getTeam_idx() == selectAll.getTeam_idx()) {
								if (task.getTask_progress().equals("todo")) {
						%>
						<div class="card" id="<%=task.getKanban_idx()%>"
							onclick="openCard(<%=task.getKanban_idx()%>)">
							<div class="card-text"><%=task.getTask_name()%></div>
						</div>
						<%
						}
						}
						}
						%>
					</div>
				</div>
				<div class="panel" id="panel-inprogress">
					<h2>진행중</h2>
					<div id="content-2">
						<%
						for (KanbanDTO task : tasks) {
							if (task.getTeam_idx() == selectAll.getTeam_idx()) {
								if (task.getTask_progress().equals("inprogress")) {
						%>
						<div class="card" id="<%=task.getKanban_idx()%>"
							onclick="openCard(<%=task.getKanban_idx()%>)">
							<div class="card-text"><%=task.getTask_name()%></div>
						</div>
						<%
						}
						}
						}
						%>
					</div>
				</div>
				<div class="panel" id="panel-done">
					<h2>종료</h2>
					<div id="content-3">
						<%
						for (KanbanDTO task : tasks) {
							if (task.getTeam_idx() == selectAll.getTeam_idx()) {
								if (task.getTask_progress().equals("done")) {
						%>
						<div class="card" id="<%=task.getKanban_idx()%>"
							onclick="openCard(<%=task.getKanban_idx()%>)">
							<div class="card-text"><%=task.getTask_name()%></div>
						</div>
						<%
						}
						}
						}
						%>
					</div>
				</div>
			</div>
			<div class="fundo-escurecido" onclick="fechaFormulario()"></div>
			<div class="form-adicionar">
				<form id="adicionar-tarefa">
					<label for="titulo">업무 이름</label> <input type="text" id="titulo"
						class="task_name" placeholder="제목적어" required> <label
						for="descricao">업무 내용</label>
					<textarea id="descricao" class="task_info" placeholder="내용적어"></textarea>
					<label for="titulo">진행도</label> <input type="range" class=""
						min="0" max="100" step="10"> <br> <label for="titulo"
						class="task_ed_dt">시작 날짜</label> <input type="date"> <br>
					<label for="titulo" class="task_st_dt">종료 날짜</label> <input
						type="date"> <br> <label for="titulo"
						class="task_st_dt">첨부 파일</label> <input type="file"> <br>
					<label>진행 상태</label>
					<p>
						<input type="radio" name="status" id="afazer" value="afazer"
							checked> <label for="afazer" class="labelradio">할일</label>
						<input type="radio" name="status" id="fazendo" value="fazendo">
						<label for="fazendo" class="labelradio">진행중 </label> <input
							type="radio" name="status" id="feito" value="feito"> <label
							for="feito" class="labelradio">마감</label>
					</p>
					<p id="tipo-formulario"></p>
				</form>
			</div>

			<main class="content">
				<div id="dday"></div>
				<!-- 캘린더 -->
				<div id="calendar-container">
					<div id="calendar"></div>
				</div>
			</main>
		</main>

		<div id="chat-container">
			<div id="nickname-container">
				<input type="text" id="nickname" placeholder="닉네임을 입력하세요">
				<button id="set-nickname">닉네임 설정</button>
			</div>
			<div id="chatbox"></div>
			<div id="controls">
				<input type="text" id="message" placeholder="메시지를 입력하세요" disabled>
				<button id="send" disabled>전송</button>
			</div>
		</div>
	</div>

	<script src="assets/채팅.js"></script>
	<script src="assets/메인.js"></script>
	<script src="assets/캘린더.js"></script>
	<script src="/chat-app/public/client.js"></script>
	<script type="text/javascript">
    // Get users list from JSP as a JavaScript array
    let users = <%=users%>;
    console.log("start: "+ users);

    // Function to open the approval modal
    function openApprovalModal() {
       console.log(users); // 성공 
        const userListDiv = document.getElementById('userList');
        userListDiv.innerHTML = ''; // 기존 목록 초기화

        // 아이디 목록을 모달에 추가
        users.forEach(user => {
            const userDiv = document.createElement('div');
            userDiv.classList.add('user-item');
            userDiv.id = `user-${user}`; // 각 사용자에게 고유 ID 부여
         console.log("아이디목록 모달에 추가 : " + user); // 성공
                  
            // 아이디 텍스트
            const userNameSpan = document.createElement('span');
            // userNameSpan.textContent = '승인할 사용자 ID:' + user ;
            userNameSpan.textContent = `승인할 사용자 ID: ${"${user}"}`;  // 성공! 
            // console.log("${users} : " + ${user});
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
                alert(`${'${user}'} 승인되었습니다.`);
            } else {
                alert(`${'${user}'} 거절되었습니다.`);
            }

            // 실제로는 여기에 서버로 승인 또는 거절 데이터를 전송하는 로직이 추가되어야 합니다.
            users = users.filter(u => u !== user); // 사용자 목록에서 제거
        });
        
        //-------------------------------------------------------------------

        // Collect the approved/rejected users
        const approvedUsers = [];
        checkboxes.forEach(checkbox => {
            const user = checkbox.value;
            approvedUsers.push(user);
        });
        
        
        
        // Send the approved/rejected user data to the server
        const approvalData = {
            users: approvedUsers,
            action: approve ? 'approve' : 'reject'
        };

        fetch("AdmitService", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(approvalData)
        })
        .then(response => response.json())
        .then(data => {
            console.log('Response from the server:', data);
            // Handle server response (if needed)
        })
        .catch(error => {
            console.error('Error sending approval data:', error);
        });

        //-------------------------------------------------------------------
        // 목록에서 모든 사용자가 제거되면 모달 자동 닫기
        if (users.length === 0) {
            closeApprovalModal();
        }
    }

    // 승인 모달 닫기
    function closeApprovalModal() {
        document.getElementById('approvalModal').style.display = 'none';
    }
</script>


</body>

</html>