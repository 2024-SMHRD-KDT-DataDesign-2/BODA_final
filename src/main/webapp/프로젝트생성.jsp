<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/join.css">
<style>
@font-face {
	font-family: 'LINESeedKR-Bd';
	src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}
</style>
</head>
<body>
	<div id="login">
		<table>
			<tr>
				<td><h2>프로젝트 생성</h2></td>
			</tr>
			<form action="프로젝트생성Service" method="post">
				<tr>
					<td>팀이름</td>
				</tr>
				<tr>
					<td><input type="text" name="team_name" class="text"></td>
				</tr>
				<tr>
					<td>프로젝트명</td>
				</tr>
				<tr>
					<td><input type="text" name="proj_name" class="text"></td>
				</tr>
				<tr>
					<td>프로젝트 시작 날짜</td>
				</tr>
				<tr>
					<td><input type="date" name="proj_st_dt" class="text"></td>
				</tr>
				<tr>
					<td>프로젝트 종료 날짜</td>
				</tr>
				<tr>
					<td><input type="date" name="proj_ed_dt" class="text"></td>
				</tr>
				<tr>
					<td>프로젝트 상태</td>
				</tr>
				<tr>
					<td><input type="text" name="proj_status" class="text"></td>
				</tr>
				<tr>
					<td>프로젝트 소개</td>
				</tr>
				<tr>
					<td><textarea name="proj_des" class="text" rows="6" cols="50"
							style="resize: none;" placeholder="프로젝트 내용을 소개해주세요"></textarea></td>
				</tr>

				<tr>
					<td><input type="submit" value="제출" class="btn"></td>
				</tr>

			</form>
		</table>
	</div>
</body>
</html>