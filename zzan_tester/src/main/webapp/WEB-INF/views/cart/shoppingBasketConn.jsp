<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String userId = (String) session.getAttribute("userId");

    if (userId == null) {
        // Handle user not logged in case.
        response.sendRedirect("login.jsp");
        return;
    }

    String url = "jdbc:mysql://localhost:3306/zzan";
    String uid = "root";
    String upw = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    boolean hasItems = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, uid, upw);

        // Fetch cart items for the logged-in user
        String sql = "SELECT p.subject AS pName, cp.cpQuantity, p.price, (p.price * cp.cpQuantity) AS subtotal, (p.price * cp.cpQuantity * 0.05) AS points, cp.cpPrCode " +
                     "FROM Cart c " +
                     "JOIN CartProduct cp ON c.cartCode = cp.cartCode " +
                     "JOIN Product p ON cp.cpPrCode = p.pCode " +
                     "WHERE c.cMemid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            hasItems = true;
%>
            <table>
                <tr>
                    <th>상품명</th>
                    <th>총수량</th>
                    <th>판매가</th>
                    <th>소계</th>
                    <th>적립금</th>
                    <th>삭제</th>
                </tr>
            <%
                do {
                    String productName = rs.getString("pName");
                    int quantity = rs.getInt("cpQuantity");
                    double price = rs.getDouble("price");
                    double subtotal = rs.getDouble("subtotal");
                    int points = rs.getInt("points");
                    String productCode = rs.getString("cpPrCode");
            %>
                <tr>
                    <td><%= productName %></td>
                    <td><%= quantity %></td>
                    <td><%= String.format("%,.2f", price) %>원</td>
                    <td><%= String.format("%,.2f", subtotal) %>원</td>
                    <td><%= points %>점</td>
                    <td><a href="???.jsp?productId=<%= productCode %>">삭제</a></td>
                </tr>
            <%
                } while (rs.next());
            %>
            </table>

            <div style="margin-top: 20px; text-align: center;">
                <form action="???.jsp" method="post" style="display: inline;">
                    <button type="submit" 
                            style="width:160px; 
                                   height:50px; 
                                   background:#fff; 
                                   color:#004986; 
                                   font-size:16px; 
                                   font-weight:700; 
                                   border:1px solid #004986; 
                                   text-align:center; 
                                   line-height:48px;">
                        바로 구매
                    </button>
                </form>
                <a href="index.jsp" style="display: inline;">
                    <div style="width:160px; height:50px; background:#fff; color:#004986; 
                                font-size:16px; font-weight:700; border:1px solid #004986; 
                                text-align:center; line-height:48px; display:inline-block;">
                        계속쇼핑하기
                    </div>
                </a>
            </div>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<% if (!hasItems) { %>
    <table>
        <tr>
            <td colspan="6" style="text-align:center; line-height:200px">장바구니가 비어있습니다.</td>
        </tr>
    </table>
<% } %>

<script src="/script/jquery-3.7.1.min.js"></script>
<script src="/script/script.js"></script>
