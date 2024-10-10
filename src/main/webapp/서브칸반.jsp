<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.KanbanDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BODA</title>
<link rel="stylesheet" href="assets/메인.css">
<link rel="stylesheet" href="assets/서브칸반.css">
<link rel="stylesheet" href="assets/모달창.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body>

	<header>
		<a href="프로젝트입장Service2" style="text-decoration: none"><div class="logo">BODA</div></a>
		<div class="header-buttons">
			<form action="LogoutService" method="post">
				<button class="signup-btn" type="submit">로그아웃</button>
			</form>
		</div>
	</header>


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

			<div class="panel" id="panel-todo">
				<h2>할일</h2>
				<input type="button" id="add" onclick="openForm('add')" value="+">
				<div id="content-1">
					<%
					List<KanbanDTO> selectAll = (List<KanbanDTO>) request.getAttribute("selectAll");

					for (KanbanDTO task : selectAll) {

						if (task.getTask_progress().equals("todo")) {
					%>
					<div class="card" id="<%=task.getKanban_idx()%>"
						onclick="openCard(<%=task.getKanban_idx()%>)">
						<div class="card-text"><%=task.getTask_name()%></div>
					</div>
					<%
					}

					}
					%>
				</div>
			</div>
			<div class="panel" id="panel-inprogress">
				<h2>진행중</h2>
				<div id="content-2">
					<%
					for (KanbanDTO task : selectAll) {
						if (task.getTask_progress().equals("inprogress")) {
					%>
					<div class="card" id="<%=task.getKanban_idx()%>"
						onclick="openCard(<%=task.getKanban_idx()%>)">
						<div class="card-text"><%=task.getTask_name()%>
						</div>
					</div>
					<%
					}
					}
					%>
				</div>
			</div>
			<div class="panel" id="panel-done">
				<h2>종료</h2>
				<div id="content-3">
					<%
					for (KanbanDTO task : selectAll) {
						if (task.getTask_progress().equals("done")) {
					%>
					<div class="card" id="<%=task.getKanban_idx()%>"
						onclick="openCard(<%=task.getKanban_idx()%>)">
						<div class="card-text"><%=task.getTask_name()%></div>
					</div>
					<%
					}
					}
					%>
				</div>
			</div>
			<div class="dark-background" onclick="closeForm()"></div>
			<div class="add-form">

				<form id="add-task" action="KanbanService" method="post">
					<br> <label for="title">업무 이름</label> <input type="text"
						id="title" name="task_name" placeholder="이름을 적으세요" required>
					<br> <label for="description">업무 내용</label>
					<textarea id="description" name="task_info" placeholder="내용을 적으세요"></textarea>
					<br> <label for="title">진행도</label> <input type="range"
						name="task_importance" min="0" max="100" step="10"> <br>
					<label for="title">시작 날짜</label> <input type="date"
						name="task_st_dt"> <br> <br> <label for="title">종료
						날짜</label> <input type="date" name="task_ed_dt"> <br> <br>
					<label for="title">첨부 파일</label> <input type="file"
						name="task_file1"> <br> <label>진행 상태</label> <br>
					<p>
						<input type="radio" id="todo" name="status" value="todo" checked>
						<label for="todo" class="labelradio">할일</label> <input
							type="radio" id="inprogress" name="status" value="inprogress">
						<label for="inprogress" class="labelradio">진행중</label> <input
							type="radio" id="done" name="status" value="done"> <label
							for="done" class="labelradio">마감</label>
					</p>
					<br> <input type='submit' class='btn' value='확인'> <input
						type='button' class='cancel' value='취소' onclick='closeForm()'>
				</form>
			</div>


			<!-- 모달창 -->

			<form action="KanbanUpdate" method="post">
				<div id="issue-modal" class="modal">
					<div class="modal-content">
						<span class="close">&times;</span>

						<!-- 아이콘과 제목 -->
						<div class="modal-header">
							<h1>
								<input type="text" id="a1" name="task_name"
									style="border: none; font-size: inherit; font-weight: inherit; width: 100%; background: transparent;"
									placeholder="제목을 입력하세요">
							</h1>
						</div>
						<br> <br> <br>

						<!-- 날짜, 수업, 시간 -->
						<div>
							<div>
								<span class="detail-title" id="date">날짜</span> <br> <br>
								<div class="progress-container">
									<div id="date-lable"></div>
								</div>

							</div>
							<div>
								<span class="detail-title" id="label">진행도</span> <br>
								<div class="progress-container">
									<input type="range" id="progress-bar" name="task_importance"
										min="0" max="100" step="10">
								</div>
							</div>
							<div></div>
							<!-- <div class="detail-item"> -->
							<div class="detail-title">내용</div>
							<br>
							<textarea id="content-input" name="task_info" rows="10"
								placeholder="내용을 입력하세요" cols="70"></textarea>
							<br> <br>
							<!-- 상태 선택 -->
							<div class="detail-item">
								<p>
									<input type="radio" id="todo" name="status" value="todo"
										checked> <label for="todo" class="labelradio">할일</label>
									<input type="radio" id="inprogress" name="status"
										value="inprogress"> <label for="inprogress"
										class="labelradio">진행중</label> <input type="radio" id="done"
										name="status" value="done"> <label for="done"
										class="labelradio">마감</label>
								</p>
							</div>
							<div id="button-div">
								<input type="hidden" id="kanban_idx" name="kanban_idx">

								<button class="modal-btn" type="submit"
									onclick="alert('수정 완료');">
									<img src="assets/image/수정.png" width="18px" height="18px">
									<span class="tooltip-text">수정</span>
								</button>
			</form>
			<form action="KanbanDelete" method="post">

				<input type="hidden" id="kanban_idx1" name="kanban_idx">
				<button class="modal-btn" type="submit" onclick="alert('삭제 완료');">
					<img src="assets/image/삭제.png" width="18px" height="18px"> <span
						class="tooltip-text">삭제</span>
				</button>
			</form>
	</div>
	</div>
	</div>
	</div>
	</main>

	<script src="assets/칸반.js"></script>
	<script src="assets/메인.js"></script>
	<script>
		
	        const modal = document.getElementById('issue-modal');
	        const closeBtn = document.getElementsByClassName('close')[0];
	        
	        function openCard(taskId) {
	        	
	            var xhr = new XMLHttpRequest();
	            xhr.open("GET", "getTasks?taskId=" + taskId, true);  // 서버에서 taskId에 해당하는 데이터 가져옴
	            xhr.onload = function () {
	                if (xhr.status === 200) {
	                    // 서버에서 응답을 받아서 JSON 파싱
	                    var tasks = JSON.parse(xhr.responseText);

	                    // 각 task 객체의 속성에 접근하여 모달에 데이터 넣기
	                   tasks.forEach(function(task) {
	                    	if(task.kanban_idx==taskId){
	                    		document.getElementById("a1").value = task.task_name;
	                    		document.getElementById("content-input").value = task.task_info;
	                    		document.getElementById("date-lable").textContent = task.task_st_dt.split(' ')[0] + ' ~ ' + task.task_ed_dt.split(' ')[0];
	                    		document.getElementById("progress-bar").value = task.task_importance;
	                    		/* document.getElementById("file").textContent = task.task_file1; */
	                    		document.getElementById("kanban_idx").value = task.kanban_idx;
	                    		document.getElementById("kanban_idx1").value = task.kanban_idx;
	                    		console.log(task.task_file1);
	                    	}
	                         // task 객체의 title 출력
	                    });
	                    

	               /*      // 여기서 필요한 모달 업데이트 작업 수행
	                    document.getElementById("date-lable").textContent = tasks[0].startDate + " ~ " + tasks[0].endDate;
	                    document.getElementById("content").textContent = tasks[0].content;
	                    document.getElementById("file-lable").textContent = tasks[0].fileName;
 */
	                    // 모달 열기
	                    modal.style.display = 'block';
	                } else {
	                    console.error("데이터를 가져오는 데 실패했습니다.");
	                }
	            };
	            xhr.onerror = function () {
	                console.error("AJAX 요청 중 오류 발생.");
	            };
	            xhr.send(); // 요청 보내기
	        }

			// 모달 닫기
	        closeBtn.onclick = function () {
	            modal.style.display = 'none';
	        };

	        // 모달 바깥을 클릭하면 모달 닫기
	        window.onclick = function (event) {
	            if (event.target == modal) {
	                modal.style.display = 'none';
	            }
	        };

			
		</script>
</body>

</html>