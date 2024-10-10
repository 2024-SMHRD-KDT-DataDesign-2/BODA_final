<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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

<style>
/* 전체 기본 스타일 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

/* 헤더 스타일 */
header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px;
	background-color: #282828;
}

.header-buttons {
	display: flex;
	gap: 10px;
}

header .logo {
	font-size: 2em;
	font-weight: bold;
	color: #34d4e6;
}

.login-btn, .signup-btn {
	background-color: #34d4e6;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	font-size: 14px;
}

/* 사이드바 */
.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #282828;
	overflow-x: hidden;
	margin-top: 78px;
}

.sidenav a {
	padding: 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: white;
	display: block;
}

.sidenav a:hover {
	color: #A9CFE2;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}


#main {
	transition: margin-left 0.5s;
	padding: 16px;
}

/* 반응형 사이드바 */
@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

/* 캘린더 헤더 스타일 */
.fc-header-toolbar {
	padding: 1em;
}

/* 캘린더 위치 및 크기 조정 */
#calendar {
	position: absolute;
	left: 400px;
	top: 150px;
	width: 1200px;
	height: 800px;
}
#abcd{
	position: absolute;
	right: 200px;
	top : 160px;	 
}
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

	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="KanbanSelect">칸반보드</a> <a href="서브캘린더.jsp">캘린더</a> <a
			href="회고록.jsp">보고서</a><a href="memoirService2">게시판</a> <a
			href="도움말.jsp">도움말</a> <a href="서브룰렛.jsp">룰렛</a> <a
			href="내프로젝트조회Service">프로젝트 선택</a>
	</div>

	<div id="main">

		<div id="main">
			<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;</span>
		</div>

		<main class="content">
			<div id="dday"></div>
			<!-- 캘린더 -->
			<div id="calendar-container">
				<div id="calendar"></div>
			</div>
		</main>

	</div>
	<span id="abcd">
		<table>
			<tr>
				<td>할일</td>
				<td>  </td>
				<td width="40px" bgcolor="blue"></td>
			</tr>
			<tr>
				<td>진행중</td>
				<td>  </td>
				<td width="40px" bgcolor="green"></td>
			</tr>
			<tr>
				<td>마감</td>
				<td>  </td>
				<td width="40px" bgcolor="red"></td>
			</tr>
		</table>
	</span>
	

	<!-- 외부 JavaScript 파일 -->
	<script src="assets/캘린더.js"></script>
	<script src="assets/메인.js"></script>
	</body>
</html>