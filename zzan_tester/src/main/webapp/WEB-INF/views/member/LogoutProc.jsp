<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
%>
	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/script.js"></script>

<script>
	alert("로그아웃 되었습니다.");
	location.href = "/index.jsp";
</script>