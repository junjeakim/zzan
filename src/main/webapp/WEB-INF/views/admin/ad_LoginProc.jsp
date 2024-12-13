<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="admin" class="com.example.zzan.dto.adminBean"/>
<jsp:useBean id="dao" class="com.example.zzan.dao.adminDAO"/>
<script>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
boolean chk = dao.selectAdmin(id, pw);

%>

<%
if(chk){%>
	location.href = "/showcase/productList.jsp?productType=";
<%}else{%>
	alert("비밀번호가 틀렸습니다.");
	history.back();
<%}%>
</script>