<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.example.zzan.dao.bbsDAO"/>

<%
request.setCharacterEncoding("UTF-8");
String uId_Session = (String) session.getAttribute("userId");
String idx = request.getParameter("idx");
String title = request.getParameter("title");
String content = request.getParameter("content");

boolean reChk = dao.updateContent(idx, title, content);
%>
<script>
 if(<%=reChk%>){
    alert("수정되었습니다.");
    location.href="/bbs/bbs.jsp?pageType=bbs";
}else{
    alert("수정 실패");
    history.back();
}
</script>
