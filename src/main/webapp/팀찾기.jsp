<%@page import="com.smhrd.model.projectDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("assets/팀찾기.css");

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
	<div>
		<img src="assets/image/BODA로고2.png" alt="로고" id="BODA">
	</div>

	<div id="login">

		<span class="green_window">
			<form action="프로젝트검색Service" method="post">
				<input type="text" class="input_text" name="search_value"
					placeholder="검색어 입력" onkeydown="enterSearch()"> <input
					type="button" value="검색" class="sch_smit"
					onclick="abreFormulario()">
			</form>
		</span>
		<table>
			<tr height="40px">
				<th>팀명</th>
				<th>프로젝트명</th>
				<th>개설자</th>
				<th>신청</th>
			</tr>

				<c:forEach items="${requestScope.search_resultList}" var="sresult">
			<form action="팀원신청Service" method="post">
					<tr height="40px">
						<td><input type="hidden" name="team_name"
							value="${sresult.team_name}" /> ${sresult.team_name}</td>
						<td><input type="hidden" name="proj_name"
							value="${sresult.proj_name}" /> ${sresult.proj_name}</td>
						<td><input type="hidden" name="team_idx"
							value="${sresult.team_idx}" /> ${sresult.mem_id}</td>
						<td width="60px"><button type="submit" id="apply" onclick="alert('신청 완료');">신청</button></td>
					</tr>
			</form>
				</c:forEach>


		</table>

	</div>
</body>
</html>