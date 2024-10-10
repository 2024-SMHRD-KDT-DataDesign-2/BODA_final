<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색창만들기</title>
<style>
@import url("assets/팀찾기.css");
</style>
<style>
@import url("assets/login.css");

@font-face {
	font-family: 'LINESeedKR-Bd';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}
</style>
</head>

<body>
	<div id="img">
		<img src="assets/image/BODA로고2.png" alt="로고" id="BODA">
	</div>
	<div id="login">
		<table >
			<caption>
				<h2>Progress Project</h2>
			</caption>
			<tr height="40px">
				<th>팀명</th>
				<th>프로젝트명</th>
				<th>프로젝트설명</th>
				<th>프로젝트진행상태</th>
				<th>개설자아이디</th>
			</tr>
			<!-- 2.모든 회원의 이메일(email),전화번호(tel),주소(address)를 출력하시오. -->
			<!-- item : request에 저장한 name, var : 변수로 쓸 값 이름 지정 -->

			<!-- scriptlet 대신 앞으로 jstl을 쓰겟습니다 ㅇㅇ -->
			<%
			System.out.println("내프로젝트목록창.jsp : " + request.getAttribute("resultList2"));
			%>	
			<c:forEach items="${requestScope.resultList2}" var="pdto">
				<tr height="40px">
					<td
						onclick="location.href='프로젝트입장Service?proj_name=${pdto.proj_name}'">${pdto.team_name}</td>
					<td
						onclick="location.href='프로젝트입장Service?proj_name=${pdto.proj_name}'">${pdto.proj_name}</td>
					<td
						onclick="location.href='프로젝트입장Service?proj_name=${pdto.proj_name}'">${pdto.proj_des}</td>
					<td
						onclick="location.href='프로젝트입장Service?proj_name=${pdto.proj_name}'">${pdto.proj_status}</td>
					<td
						onclick="location.href='프로젝트입장Service?proj_name=${pdto.proj_name}'">${pdto.mem_id}</td>
				</tr>
			</c:forEach>


		</table>
	</div>
	<script>
                 let location.href="location.href='프로젝트입장Service?proj_name="+$('#projName').val();                 
                 </script>
</body>

</html>