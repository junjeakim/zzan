<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zzan admin Page</title>
<link rel="stylesheet" href="/style/admin_style.css">
</head>
<body>
	<div id="adminWrap" class="dFlex">
		<div id="mainMenus">
			<ul id="mainMenu">
				<li>회원관리</li>
				<li>상품관리
					<ul class="subMenus">
						<li>상품조회</li>
						<li>상품등록</li>
					</ul>
				</li>
				<li>주문관리</li>
				<li>공지사항</li>
			</ul>
		</div>
		<main id="main"></main>
	</div>
	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>