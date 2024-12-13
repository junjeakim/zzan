<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="memberDto" class="com.example.zzan.dto.MemberDTO"/>
<jsp:useBean id="dao" class="com.example.zzan.dao.MemberDAO"/>
<%
String id = request.getParameter("mId");
String pw = request.getParameter("mPw");
String name = request.getParameter("mName");
String email = request.getParameter("mEmail") + "@" + request.getParameter("mEmail2");
String birthday = request.getParameter("mBirthday");
String phone = request.getParameter("mPhone");
String addr = request.getParameter("mAddr");

// 멤버 DTO 설정
memberDto.setmId(id);
memberDto.setmPw(pw);
memberDto.setmName(name);
memberDto.setmEmail(email);
memberDto.setmBirthday(birthday);
memberDto.setmPhone(phone);
memberDto.setmAddr(addr);

// DAO를 통한 멤버 삽입
boolean reChk = dao.insertMember(memberDto);
%>
	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/script.js"></script>

<script>
if (<%=reChk%>) {
    alert("가입되었습니다.");
    location.href = "/member/Login";
} else {
    alert("실패");
    history.back();
}
</script>
