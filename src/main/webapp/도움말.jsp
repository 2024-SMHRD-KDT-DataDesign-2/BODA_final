<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기술 가이드 및 리소스 추천</title>
<link rel="stylesheet" href="assets/도움말.css">
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

		<main class="content">
			<h1>기술 가이드 및 리소스 추천</h1>

			<!-- 기술 설명 섹션 -->
			<div class="section">
				<h2 class="section-title">기술 설명</h2>
				<p>다음은 초보 개발자들이 자주 사용하는 기술들의 간단한 설명입니다:</p>
				<ul class="resource-list">
					<li><strong>HTML</strong>: 웹 페이지의 구조를 정의하는 마크업 언어입니다. <a
						href="https://ofcourse.kr/html-course/" target="_blank">HTML
							기술 정보</a></li>
					<li><strong>CSS</strong>: 웹 페이지의 레이아웃과 디자인을 스타일링하는 언어입니다. <a
						href="https://ofcourse.kr/css-course/" target="_blank">CSS 기술
							정보</a></li>
					<li><strong>CSS Animation</strong>: 웹 페이지의 애니메이션 효과를 추가하고
						싶으신가요? <a href="https://animista.net/" target="_blank">CSS
							애니메이션 기술 정보</a></li>
					<li><strong>JavaScript</strong>: 웹 페이지의 동적인 기능을 구현하는 스크립팅
						언어입니다. <a href="https://ofcourse.kr/js-course/" target="_blank">JavaScript
							문서 보기</a></li>
					<li><strong>Git</strong>: 소스 코드의 버전을 관리하는 도구로, 분산 버전 관리 시스템 중
						가장 많이 사용됩니다. <a href="https://git-scm.com/doc" target="_blank">Git
							문서 보기</a></li>
				</ul>
			</div>

			<!-- FAQ 섹션 -->
			<div class="section">
				<h2 class="section-title">FAQ 및 문제 해결</h2>
				<p>프로젝트 진행 중 발생할 수 있는 일반적인 문제에 대한 해결 방법을 FAQ 형식으로 제공합니다:</p>
				<ul class="faq-list">
					<li class="faq-item"><strong>Q: Git에서 파일을 잘못 커밋했을 때
							어떻게 되돌리나요?</strong>
						<p class="faq-answer">
							A:
							<code>git reset --soft HEAD~1</code>
							명령어를 사용하여 마지막 커밋을 취소할 수 있습니다.
						</p></li>
					<li class="faq-item"><strong>Q: CSS가 적용되지 않을 때 어떻게
							해결하나요?</strong>
						<p class="faq-answer">A: 캐시 문제일 수 있습니다. 브라우저 캐시를 지우거나 강력
							새로고침(Ctrl + F5)을 시도해보세요.</p></li>
					<li class="faq-item"><strong>Q: JavaScript에서 오류가 발생했을
							때 어떻게 디버깅하나요?</strong>
						<p class="faq-answer">
							A: 브라우저의 개발자 도구를 열고 콘솔 탭에서 오류 메시지를 확인하세요. 디버깅을 위해
							<code>console.log()</code>
							를 사용해보세요.
						</p></li>
				</ul>
			</div>

			<!-- 리소스 추천 섹션 -->
			<div class="section">
				<h2 class="section-title">리소스 추천</h2>
				<p>각 기술에 대한 추가 학습을 위해 다음 리소스를 추천합니다:</p>
				<ul class="resource-list">
					<li><strong>HTML & CSS</strong>: <a
						href="https://www.freecodecamp.org/learn/responsive-web-design/"
						target="_blank">FreeCodeCamp - Responsive Web Design
							Certification</a></li>
					<li><strong>JavaScript</strong>: <a
						href="https://javascript.info/" target="_blank">JavaScript
							Info</a> - JavaScript에 대한 심층 학습 자료</li>
					<li><strong>Git</strong>: <a
						href="https://learngitbranching.js.org/" target="_blank">Learn
							Git Branching</a> - Git 브랜치와 명령어를 시각적으로 학습</li>
					<li><strong>Full Stack Development</strong>: <a
						href="https://www.theodinproject.com/" target="_blank">The
							Odin Project</a> - 풀스택 웹 개발 가이드</li>
				</ul>
			</div>
		</main>
	</div>

		<script src="assets/메인.js"></script>


</body>
</html>