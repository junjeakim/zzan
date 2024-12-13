<%@page import="java.sql.Timestamp"%>
<%@page import="com.example.zzan.dto.bbsBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.example.zzan.dao.MemberDAO"/>
<%
String pageType = request.getParameter("pageType");
String mId = (String) session.getAttribute("userId");
List<bbsBean> list = null;
int cnt = 0;
%>
<jsp:useBean id="bbs" class="com.example.zzan.dao.bbsDAO" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의사항 목록</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_BBS.css">
<script src="/script/jquery-3.7.1.min.js"></script>
<script src="/script/script.js"></script>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/ind/header.jsp"%>
        <main id="main" class="dFlex">
            <div id="contents" class="bbsList">
        <% if (pageType.equals("bbs")) {
            list = bbs.selectBBS();
            cnt = bbs.bbsCount();
        %>
                <h1>문의하기</h1>
        <% } else { 
            list = bbs.selectNotice();
            cnt = bbs.noticeCount();
        %>
                <h1>공지사항</h1>
        <% } %>
                <div id="pageInfo" class="dFlex">
                    <span><%= cnt %>개</span> <span>페이지 : </span>
                </div>
                <table id="boardList">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>이름</th>
                            <th>날짜</th>
                            <th>조회수</th>
                        </tr>
                        <tr>
                            <td colspan="5" class="spaceTd"></td>
                        </tr>
                    </thead>
                    <tbody>
<%
for (int i = 0; i < list.size(); i++) {
      bbsBean bean = list.get(i);
      int idx = bean.getIdx();
      String title = bean.getTitle();
      String id = bean.getId();
      String mName = dao.getMemberName(id);
      if (mName.equals("")) mName = dao.getAdminName(id);
      Timestamp regTM = bean.getRegTM();
%>
                        <tr class="prnTr" onclick="read(<%= idx %>)">
                            <td><%= idx %></td>
                            <td class="subjectTd"><%= title %></td>
                            <td><%= mName %></td>
                            <td><%= regTM %></td>
                            <td>0</td>
                        </tr>
<% } %>
                        <tr id="listBtnArea">
                            <td colspan="2">
                            <% if (pageType.equals("bbs")) { %>
                                <button type="button" id="writeBtn" class="listBtnStyle">글쓰기</button>
                            <% } %>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </main>
        <%@ include file="/WEB-INF/views/ind/footer.jsp"%>
    </div>
    <script>
    let writeBtnDom = document.querySelector("#writeBtn");
    const mId = "<%= (String) session.getAttribute("userId") %>";
    writeBtnDom?.addEventListener("click", function() {
        if (!mId || mId === "null") {
            alert("로그인해야 사용하실 수 있습니다.");
        } else {
            location.href = "/bbs/write.jsp";
        }
    });
    </script>
</body>
</html>
