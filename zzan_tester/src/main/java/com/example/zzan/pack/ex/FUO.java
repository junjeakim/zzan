package com.example.zzan.pack.ex;

import java.sql.Connection;

import com.example.zzan.pack.jdbc.FileUploadDAO; // 수정된 경로
import java.sql.DriverManager;
import java.sql.SQLException;

public class FUO {
    private String subject;
    private String originalFileName;
    private String storedFileName;
    private long fileSize;
    private String content;
    private String price;
    private String category;

    // 생성자
    public FUO(String subject, String originalFileName, String storedFileName, long fileSize, String content, String price, String category) {
        this.subject = subject;
        this.originalFileName = originalFileName;
        this.storedFileName = storedFileName;
        this.fileSize = fileSize;
        this.content = content;
        this.price = price;
        this.category = category;
    }

    // 데이터베이스에 저장하는 메서드
    public boolean saveToDatabase() {
        Connection conn = null;

        try {
            // JDBC 드라이버 로드 및 연결
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/zzan?characterEncoding=UTF-8";
            conn = DriverManager.getConnection(url, "root", "1234");

            // FileUploadDAO를 사용하여 데이터 저장
            FileUploadDAO dao = new FileUploadDAO(conn);
            dao.saveFileData(subject, originalFileName, storedFileName, fileSize, content, price, category); // price와 category 추가
            return true;

        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버를 찾을 수 없습니다: " + e.getMessage());
            e.printStackTrace();
            return false;

        } catch (SQLException e) {
            System.out.println("SQL 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return false;

        } finally {
            // 자원 해제
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
