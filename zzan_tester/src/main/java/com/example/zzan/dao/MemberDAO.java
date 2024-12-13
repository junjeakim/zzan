package com.example.zzan.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import com.example.zzan.dto.MemberDTO; // 수정된 경로


public class MemberDAO {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	DBCP dbcp = null;
	
	/* 회원가입정보 입력 */
	public boolean insertMember(MemberDTO memberDto) {
		boolean flag = false;
		try {
			conn = DBCP.DBconnection();
			String sql = "insert into member(";
			sql += "mId, mPw, mName, mBirthday, mAddr, mEmail, mPhone) values (";
			sql += "?, ?, ?, ?, ?, ?, ?";
			sql += ")";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getmId());
			pstmt.setString(2, memberDto.getmPw());
			pstmt.setString(3, memberDto.getmName());
			pstmt.setString(4, memberDto.getmBirthday());
			pstmt.setString(5, memberDto.getmAddr());
			pstmt.setString(6, memberDto.getmEmail());
			pstmt.setString(7, memberDto.getmPhone());
			int rowCnt = pstmt.executeUpdate();
			if (rowCnt == 1) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.print("오류발생 : " + e.getMessage());
		} finally {
			try {
				conn.close();
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
		}
		return flag;
	}

	/* 회원정보 수정 */
	/*
	public MemberBean modifyMember(String id) {
		MemberBean mBean = new MemberBean();

		try {
			conn = DBCP.DBconnection();
			String sql = "select uId, uPw, uName, uEmail,	";
			sql += "gender, uBirthday, uZipcode,";
			sql += "uAddr, uHobby, uJob, joinTM	";
			sql += "from member	where uId =	?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			objRS = pstmt.executeQuery();
			if (objRS.next()) {
				mBean.setuId(objRS.getString("uId"));
				mBean.setuPw(objRS.getString("uPw"));
				mBean.setuName(objRS.getString("uName"));
				mBean.setuEmail(objRS.getString("uEmail"));
				mBean.setGender(objRS.getString("gender"));
				mBean.setuBirthday(objRS.getString("uBirthday"));
				mBean.setuZipcode(objRS.getString("uZipcode"));
				mBean.setuAddr(objRS.getString("uAddr"));
				String[] hobbyAry = new String[5];
				String hobby = objRS.getString("uHobby");

				hobbyAry = hobby.split("");

				mBean.setuHobby(hobbyAry);
				mBean.setuJob(objRS.getString("uJob"));
			}
		} catch (Exception e) {
			System.out.print("오류발생 : " + e.getMessage());
		} finally {
			try {
				conn.close();
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
		}
		return mBean;
	}
	*/
	public String getMemberName(String id) {
		String mName = "";
		
		try {
			conn = DBCP.DBconnection();
			String sql = "select mName from member where mId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) mName = rs.getString(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			daoClose();
		}
		
		return mName;
	}
	
	public String getAdminName(String id) {
		String mName = "";
		
		try {
			conn = DBCP.DBconnection();
			String sql = "select name from admin where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) mName = rs.getString(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			daoClose();
		}
		
		return mName;
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