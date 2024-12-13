<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link rel="stylesheet" href="/style/admin_style.css">
</head>
<body>
	<div id="wrap" class="adminLogin">
		<h1>Login</h1>
		<hr>
		<div id="adminFormArea">
			<form action="/admin/ad_LoginProc.jsp" method="post">
				<label>
					<input type="text" name="id" placeholder="ID를 입력하세요."autofocus>
				</label>
				<label>
					<input type="password" name="pw" placeholder="비밀번호를 입력하세요."autofocus>
				</label>
				<div id="btnArea">
					<button type="submit">로그인</button>
					<button type="button" class="home-btn" onclick="location.href='/'" style="cursor: pointer;">돌아가기</button>

				</div>
			</form>
		</div>
	</div>
</body>
</html>