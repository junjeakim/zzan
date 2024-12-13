<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="com.example.zzan.dto.bbsBean"/>
<jsp:useBean id="dao" class="com.example.zzan.dao.bbsDAO"/>
<jsp:useBean id="memDao" class="com.example.zzan.dao.MemberDAO"/>
<%
String uId_Session =(String) session.getAttribute("userId");
String idx = request.getParameter("idx");
dto = dao.selectContent(idx);
String title = dto.getTitle();
String content = dto.getContent();
String id = dto.getId();
String name = memDao.getMemberName(id);
Timestamp date = dto.getRegTM();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글내용 보기</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_BBS.css?">
<script src="/script/jquery-3.7.1.min.js"></script>
<script src="/script/script.js"></script>
</head>
<body>
    <div id="wrap">
        <!--  헤더템플릿 시작 -->
        <jsp:include page="/WEB-INF/views/ind/header.jsp"/> <!-- 헤더 include 경로 수정 -->
        <!--  헤더템플릿 끝 -->
        <main id="main" class="dFlex">
            
            <!-- 실제 작업 영역 시작 -->
            <div id="contents" class="bbsRead">
                <!--  게시글 상세보기 페이지 내용 출력 시작 -->
                <h2>글 수정하기</h2>
                <form action="/bbs/updateProc.jsp" method="post">
                <table id="readTbl">
                    <tbody id="readTblBody">
                        <tr>
                            <td>
                                글제목
                            </td>
                            <td>
                            <input type="hidden" name="idx" value="<%=idx%>">
                            <input style="font-size: 18px; border: none; padding: 4px 0;" type="text" name="title" value="<%=title%>" autofocus>
                            </td>
                        </tr>
                        <tr>
                            <td>작성자</td>
                            <td><%=name%></td>
                            <td>등록일</td>
                            <td><%=date%></td>
                        </tr>
                        
                        <tr>
                            <td colspan="4" id="readContentTd">
                            <textarea cols="110" wrap="hard" rows="20" name="content"><%=content%></textarea>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot id="readTblFoot">
                        <tr>
                            <td colspan="4" id="footTopSpace"></td>
                        </tr>
                        <tr>
                            <td colspan="4" id="hrTd"><hr></td>
                        </tr>
                        <tr>
                            
                            <td colspan="4" id="btnAreaTd" class="read">
                                <button type="submit" id="modBtn">수 정</button>
                                <button type="button" id="delBtn">삭 제</button> 
                            </td>
                        </tr>
                    </tfoot>
                </table>
                </form>
                
            </div>
            <!-- 실제 작업 영역 끝 -->

        </main>
        <!--  main#main  -->

        <!-- 푸터템플릿 시작 -->
        <jsp:include page="/WEB-INF/views/ind/footer.jsp"/> <!-- 푸터 include 경로 수정 -->
        <!-- 푸터템플릿 끝 -->

    </div>
    <!-- div#wrap -->
    
<script>
document.querySelector("#delBtn").addEventListener("click", function(){
    let deletChk = confirm("삭제하시겠습니까?");
    if (deletChk) {     
        location.href = "/bbs/deleteBBS.jsp?idx=" + "<%=idx%>";
    }
});
</script>
</body>
</html>
