<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기술 가이드 및 리소스 추천</title>
<link rel="stylesheet" href="assets/회고록.css">
<!-- 외부 CSS 파일 링크 -->
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

	<!-- 사이드바 열기 버튼 -->

	<div id="sidebar-toggle">
		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;</span>
	</div>
	<div class="container">
		<!-- 사이드바 -->
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="KanbanSelect">칸반보드</a> <a href="서브캘린더.jsp">캘린더</a> <a
				href="회고록.jsp">보고서</a><a href="memoirService2">게시판</a> <a href="도움말.jsp">도움말</a> <a href="서브룰렛.jsp">룰렛</a>
			<a href="내프로젝트조회Service">프로젝트 선택</a>
		</div>
</body>


<div class="container">
	<h1>보고서 작성</h1>

	<!-- 보고서 생성 입력 폼 -->
	<form id="memoirService" method="post" action="memoirService">
		<label for="projectName">프로젝트 이름:</label> 
		<input type="text" id="projectName" name="memoir_name" placeholder="프로젝트 이름을 입력하세요"
			required> 
		<label for="completedTasks">진행된 작업:</label>
		<textarea id="completedTasks" rows="18" name="memoir_info"placeholder="진행된 작업을 입력하세요"></textarea>

		<label for="issues">이슈 및 해결 방안:</label>
		<textarea id="issues" rows="3" name="memoir_info1"	placeholder="이슈를 입력하고 해결 방안을 적으세요"></textarea>

		<label for="nextPlans">다음 주 계획:</label>
		
		<textarea id="nextPlans" rows="3" name="memoir_info2" placeholder="다음 주 계획을 입력하세요"></textarea>

		<button type="submit">완료</button>
	</form>
	<!-- 결과 출력 -->
	<div id="result" class="result" style="display: none;"></div>





	<script src="assets/회고록.js"></script>
	<script src="assets/메인.js"></script>
</html>

