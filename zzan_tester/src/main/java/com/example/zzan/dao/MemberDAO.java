package com.example.zzan.dao;

import com.example.zzan.dto.MemberDTO;
import com.example.zzan.pack.DBUtill;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MemberDAO {
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;

    /* 회원가입정보 입력 */
    public boolean insertMember(MemberDTO memberDto) {
        boolean flag = false;
        try {
            conn = DBUtill.getConnection();
            String sql = "insert into member (mId, mPw, mName, mBirthday, mAddr, mEmail, mPhone) values (?, ?, ?, ?, ?, ?, ?)";
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
            DBUtill.closePreparedStatement(pstmt);
            DBUtill.closeConnection(conn);
        }
        return flag;
    }

    public String getMemberName(String id) {
        String mName = "";

        try {
            conn = DBUtill.getConnection();
            String sql = "select mName from member where mId = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) mName = rs.getString(1);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            DBUtill.closePreparedStatement(pstmt);
            DBUtill.closeConnection(conn);
        }

        return mName;
    }

    public String getAdminName(String id) {
        String mName = "";

        try {
            conn = DBUtill.getConnection();
            String sql = "select name from admin where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) mName = rs.getString(1);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            DBUtill.closePreparedStatement(pstmt);
            DBUtill.closeConnection(conn);
        }

        return mName;
    }
}
