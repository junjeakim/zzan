<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String userId = (String) session.getAttribute("userId");
    String productId = request.getParameter("productId");

    if (userId == null || productId == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    String url = "jdbc:mysql://localhost:3306/zzan";
    String uid = "root";
    String upw = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, uid, upw);

        // 카트에서 제품 삭제
        String sql = "DELETE FROM CartProduct WHERE cpPrCode = ? AND cartCode IN (SELECT cartCode FROM Cart WHERE cMemid = ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productId);
        pstmt.setString(2, userId);
        int row = pstmt.executeUpdate();

        if (row > 0) {
            response.sendRedirect("shoppingBasketConn.jsp");
        } else {
            out.println("삭제 오류가 발생했습니다.");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
<script src="/script/jquery-3.7.1.min.js"></script>
<script src="/script/script.js"></script>
