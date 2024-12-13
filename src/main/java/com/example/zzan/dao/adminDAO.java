package com.example.zzan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class adminDAO {
	private Connection conn =null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	public boolean selectAdmin(String id, String pw) {
		boolean chk = false;
		int chkNum = 0;
		try {
			conn = DBCP.DBconnection();
			String sql = "select count(*) from admin where id = ? and pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) chkNum = rs.getInt(1);
			if(chkNum == 1) chk = true;
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			daoClose();
		}
		
		return chk;
	}
	
	public void daoClose() {
		try {
			if(conn != null) conn.close();
			if(stmt != null) stmt.close();
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
		}catch(Exception e) {}
	}
}
	
	
