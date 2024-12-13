<%@ page import="com.example.zzan.pack.ex.FUO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.example.zzan.pack.DBUtill" %> <!-- 정확한 경로 -->
<%@ page import="javax.servlet.http.HttpServletRequest" %> <!-- 추가된 부분 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>파일 업로드 결과창</title>
    <link rel="stylesheet" href="/showcase/style/style_showcase.css?v=<%= System.currentTimeMillis() %>">
</head>
<body>
    <div id="wrap">
        <h1>파일 처리 페이지</h1>
        <br>
        <hr>
        <br>
        <%
        String fileStorage = application.getRealPath("/") + "images/";
        int maxSize = 10 * 1024 * 1024; // 최대 파일 크기 10MB
        String encType = "UTF-8";
        MultipartRequest multiReq = null;

        try {
            multiReq = new MultipartRequest((HttpServletRequest) request, fileStorage, maxSize, encType, new DefaultFileRenamePolicy());

            String productName = multiReq.getParameter("productName");
            String price = multiReq.getParameter("price");
            String description = multiReq.getParameter("description");
            String upFileName = multiReq.getFilesystemName("image");
            String oriFileName = multiReq.getOriginalFileName("image");
            File objFile = multiReq.getFile("image");
            long fileSize = (objFile != null) ? objFile.length() : 0;

            // DB에 저장
            Connection conn = null;
            PreparedStatement pstmt = null;
            boolean isSaved = false;

            try {
                conn = DBUtill.getConnection();
                String sql = "INSERT INTO products (productName, price, description, imagePath) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, productName);
                pstmt.setString(2, price);
                pstmt.setString(3, description);
                pstmt.setString(4, "images/" + upFileName);
                pstmt.executeUpdate();
                isSaved = true;
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
            }

            if (isSaved) {
                out.println("<p><strong>상품명:</strong> " + productName + "</p>");
                out.println("<p><strong>가격:</strong> " + price + "</p>");
                out.println("<p><strong>설명:</strong> " + description + "</p>");
                out.println("<p><strong>원본 파일명:</strong> " + oriFileName + "</p>");
                out.println("<p><strong>서버 저장 파일명:</strong> " + upFileName + "</p>");
                out.println("<p><strong>파일 크기:</strong> " + fileSize + " Byte(s)</p>");
                out.println("<p>파일 업로드 및 데이터 저장 성공!</p>");
                
                // 다운로드, 파일 삭제, 입력하기 버튼 추가
                out.println("<br><hr><br><button id='downloadBtn' type='button'>다운로드</button>");
                out.println("<button type='button' onclick='deleteFile(\"" + upFileName + "\")'>파일 삭제</button>");
                out.println("<button type='button' onclick='location.href=\"register.jsp\"'>입력하기</button>");
                // 다운로드에 필요한 파일 이름 필드 추가
                out.println("<input type='hidden' id='upFileName' value='" + upFileName + "'>");
            } else {
                out.println("<p>파일 업로드는 성공했지만, 데이터베이스에 저장 중 오류가 발생했습니다.</p>");
            }

        } catch (Exception e) {
            out.println("<p>파일 업로드 중 오류 발생: " + e.getMessage() + "</p>");
            e.printStackTrace();  // 콘솔에 전체 스택 추적 출력
        }
        %>
        <br>
    </div>
    	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/script.js"></script>
    <script>
        function deleteFile(fileName) {
            if (confirm("파일을 정말 삭제하시겠습니까?")) {
                location.href = '../showcase/deleteFile.jsp?fileName=' + encodeURIComponent(fileName);
            }
        }

        $(function() {
            $("#downloadBtn").click(function() {
                let fName = $("#upFileName").val();
                location.href = "../images/" + fName; // 경로 수정
            });
        });
    </script>
</body>
</html>
