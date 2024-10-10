<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BODA</title>
<link rel="stylesheet" href="/z메인페이지/메인2 copy.css">

<style>
@import url("assets/서브룰렛.css");
</style>
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


			<div id="menu">
				<span id="lll">
					<canvas width="550" height='550'></canvas>
				</span>
				<button class="menubutton" onclick="rotate()">돌려돌려 돌림판</button>
				<div id="addDiv">
					<input type="text" id="menuAdd">
					<button class="menubutton" onclick="add()">인원 추가</button>
				</div>
			</div>

			<script src="assets/서브룰렛.js"></script>
</body>

</html>