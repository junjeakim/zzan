<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.example.zzan.dao.MemberDAO"/>

<%
String mId = (String) session.getAttribute("userId");
String mName = dao.getMemberName(mId);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글쓰기</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_BBS.css">
<script src="/script/jquery-3.7.1.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/script_BBS.js"></script>
</head>
<body>
    <div id="wrap">
        <jsp:include page="/WEB-INF/views/ind/header.jsp"/> <!-- 헤더 include 경로 수정 -->
            <main id="main" class="dFlex">
                <div id="contents" class="bbsWrite">
                    <h2>글쓰기</h2>
                    <form name="writeFrm" method="post" id="writeFrm">
                        <table>
                            <tbody>
                                <tr>
                                    <td class="req">성명</td>
                                    <td><%=mName %> 
                                        <input type="hidden" name="id" value="<%=mId%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="req">제목</td>
                                    <!-- td.req 필수입력 -->
                                    <td><input type="text" name="title" maxlength="50"
                                        id="subject"></td>
                                </tr>
                                <tr>
                                    <td class="contentTD">내용</td>
                                    <td>
                                        <textarea name="content" id="content" cols="60" wrap="hard" rows="20"></textarea>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2"><hr></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <button type="button" id="regBtn">등록</button>
                                        <button type="reset">다시쓰기</button>
                                        <button type="button" id="listBtn">리스트</button>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                        <input type="hidden" name="ip"
                            value="<%=request.getRemoteAddr()%>"> 
                    </form>
                </div>
            </main>
        <jsp:include page="/WEB-INF/views/ind/footer.jsp"/> <!-- 푸터 include 경로 수정 -->
    </div>
</body>
</html>
