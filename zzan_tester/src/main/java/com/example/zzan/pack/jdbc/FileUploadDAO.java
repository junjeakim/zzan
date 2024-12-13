package com.example.zzan.pack.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FileUploadDAO {
    private Connection conn;

    public FileUploadDAO(Connection conn) {
        this.conn = conn;
    }

    public void saveFileData(String subject, String oriFileName, String upFileName, long fileSize, String content, String price, String category) throws SQLException {
        String sql = "INSERT INTO product (subject, original_filename, stored_filename, file_size, content, price, category) VALUES (?, ?, ?, ?, ?, ?, ?)"; // 테이블명을 product로 변경
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, subject);
            pstmt.setString(2, oriFileName);
            pstmt.setString(3, upFileName);
            pstmt.setLong(4, fileSize);
            pstmt.setString(5, content);
            pstmt.setString(6, price);
            pstmt.setString(7, category);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL 오류 발생: " + e.getMessage());
            throw e; // 예외를 다시 던져서 호출한 메서드에서 처리하도록 함
        }
    }
}
