<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.example.zzan.dao.bbsDAO"/>

<%
String uId_Session = (String) session.getAttribute("userId");
int idx = Integer.parseInt(request.getParameter("idx"));

boolean reChk = dao.deleteBBS(idx);
%>
	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/script.js"></script>
<script>
if(<%= reChk %>){
    alert("삭제되었습니다.");
    location.href = "/bbs/bbs.jsp?pageType=bbs";
}else{
    alert("삭제 실패");
    history.back();
}
</script>

