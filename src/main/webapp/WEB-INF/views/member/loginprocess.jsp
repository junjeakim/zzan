<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");

    String Url = "jdbc:mysql://localhost:3306/zzan";
    String uId = "root";
    String uPw = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    boolean loginSuccess = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(Url, uId, uPw);
        
        String sql = "SELECT * FROM member WHERE mId = ? AND mPw = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            loginSuccess = true;
            session.setAttribute("userId", userId);
%>
<script>
    location.href = "/index.jsp";
</script>
<%            
        } else {
            out.println("<script>alert('아이디 또는 비밀번호가 잘못되었습니다.'); history.back();</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
