<%@page import="com.smhrd.controller.memoirService"%>
<%@page import="com.smhrd.model.projectDTO"%>
<%@page import="com.smhrd.model.memoirDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>게시판</title>

<link rel="stylesheet" href="assets/게시판.css">
<link rel="stylesheet" href="assets/게시판모달.css">
<link rel="stylesheet" href="assets/메인.css">

</head>

<body>
	<%
	projectDTO selectAll = (projectDTO) session.getAttribute("projData");
	List<memoirDTO> list = (List<memoirDTO>) session.getAttribute("getMemoirList");
	%>
	<header>
		<a href="프로젝트입장Service2" style="text-decoration: none"><div class="logo">BODA</div></a>
		<div class="header-buttons">
			<form action="LogoutService" method="post">
				<button class="signup-btn" type="submit">로그아웃</button>
			</form>
		</div>
	</header>
</head>
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

   <div id="memoir_table">
      <div id="board">
         <h1>게시판</h1>
      </div>
       <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>제목</th>
                <th>날짜</th>
                <th>수정</th>
            </tr>
        </thead>
        <tbody>
            <!-- 서버에서 가져온 데이터를 JSP에서 출력 -->
            <c:forEach var="memoirs" items="${getMemoirList}">
                <tr>
                    <td>${memoirs.mem_id}</td>
                    <td>${memoirs.memoir_name}</td>
                    <td>${memoirs.memoir_date}</td>
                    <td><button onclick="openModal('${memoirs.memoir_idx}', '${memoirs.memoir_name}', '${memoirs.memoir_info}', '${memoirs.memoir_info1}', '${memoirs.memoir_info2}', '${memoirs.memoir_date}')")">수정</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
   </div>
  <div id="modal" class="modal" style="display: none;">
  <div class="modal-content">
    <span class="close-btn" onclick="closeModal()">&times;</span>
    <h2>보고서 수정</h2>
    <form action="memoirService3" method="post">
      <label for="memoirName">프로젝트 이름:</label>
      <input type="hidden" id="memoirIdx" name="memoir_idx">
      <input type="text" id="memoirName" name="memoir_name" placeholder="프로젝트 제목을 입력하세요" >

      <label for="memoirInfo">진행된 작업:</label>
      <textarea id="memoirInfo" name="memoir_info" placeholder="내용을 입력하세요"></textarea>

      <label for="memoirInfo1">이슈 및 해결 방안:</label>
      <textarea id="memoirInfo1" name="memoir_info1" placeholder="내용을 입력하세요"></textarea>

      <label for="memoirInfo2">다음 주 계획:</label>
      <textarea id="memoirInfo2" name="memoir_info2" placeholder="내용을 입력하세요"></textarea>

      <button type="submit" onclick="alert('수정 완료');">수정</button>
    </form>
  </div>
</div>

   <script src="assets/게시판.js"></script>
   <script src="assets/게시판모달.js"></script>

</body>

</html>
 