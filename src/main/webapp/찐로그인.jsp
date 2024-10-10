<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BODA</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
@import url("assets/login.css");

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
	<div class="container">
		<div class="welcome">

			<!-- Pink Box containing sign up and sign in forms -->
			<div class="pinkbox">
				<div id="text1">
					<!-- Sign up form (Initially hidden with the class "nodisplay") -->
					<div class="signup nodisplay">
						<h1>회원가입</h1>

						<form autocomplete="off" action="JoinService" method="post">

							<input type="text" placeholder="아이디" name="mem_id" class="text">

							<input type="password" placeholder="비밀번호" name="mem_pw"
								class="text"> <input type="password"
								placeholder="비밀번호 확인" class="text"> <input type="text"
								placeholder="이름" name="mem_name" class="text"> <input
								type="text" placeholder="닉네임" name="mem_nick" class="text">

							<div class="form">
								<input type="text" name="mem_email" placeholder="이메일"
									class="required" caption="이메일" value=""> <span
									class="input w2 mailAddress"> <input type="text"
									name="mem_email" class="required1" caption="이메일" maxlength="50"
									value="" style='color: #f6f6f6'></span> <span
									class="select w1"> <select name="sel_email">
										<option value="etc">직접입력</option>
										<option value="@naver.com">naver.com</option>
										<option value="@hanmail.net">hanmail.net</option>
										<option value="@gmail.com">gmail.com</option>
										<option value="@nate.com">nate.com</option>
								</select>
								</span>
							</div>

							<input type="date" name="mem_birthdate" class="text"
								style='color: #f6f6f6'>

							<button type="submit" class="button submit"
								onclick="alert('가입 성공!')">계정 만들기</button>
						</form>
					</div>
				</div>

				<!-- Sign in form (Initially displayed) -->
				<div id="text2">
					<div class="signin">
						<h1>로그인</h1>
						<form action="LoginService" class="more-padding"
							autocomplete="off" method="post">
							<input name="mem_id" type="text" placeholder="Username">
							<input name="mem_pw" type="password" placeholder="Password">
							<button type="submit" class="button submit">Login</button>
						</form>
					</div>
				</div>

			</div>
	
			<!-- Left Box: Display when user wants to sign in -->
			<div class="leftbox">
				<h2 class="title">
					<img class="aa1" src="assets/image/BODA로고2.png" alt="Flower image"
						width="240px" height="240px">
				</h2>
				<p class="account">회원이신가요?</p>
				<button class="button" id="signin">Login</button>
			</div>

			<!-- Right Box: Display when user wants to sign up -->
			<div class="rightbox">
				<h2 class="title">
					<img class="aa1" src="assets/image/BODA로고2.png" alt="Flower image"
						width="240px" height="240px">
				</h2>
				<p class="account">회원이 아니신가요?</p>
				<button class="button" id="signup">회원가입</button>
			</div>

		</div>
	</div>
	<script src="assets/login.js"></script>
	<script>
		$("select[name=sel_email]").on(
				"change",
				function() {
					var $addr = $(this).closest(".form").find(
							"input[class=required1]");
					if ($(this).val() == "etc") {
						$addr.val('');
						$addr.prop("readonly", false);

					} else {
						$addr.val($(this).val());
						$addr.prop("readonly", true);
					}
				});
	</script>

</body>

</html>