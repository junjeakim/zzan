package com.example.zzan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;  // 수정된 경로

import com.example.zzan.dto.bbsBean;  // 수정된 경로

public class bbsDAO {
    
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rs = null;
    private PreparedStatement pstmt = null;
    
    public List<bbsBean> selectBBS() {
        List<bbsBean> list = new ArrayList<>();
        try {
            conn = DBCP.DBconnection();
            String sql = "select * from BBS order by idx desc";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            
            while(rs.next()) {
                bbsBean bean = new bbsBean();
                System.out.println("bbs실행");
                bean.setIdx(rs.getInt("idx"));
                bean.setTitle(rs.getString("title"));
                bean.setContent(rs.getString("content"));
                bean.setId(rs.getString("id"));
                bean.setRegTM(rs.getTimestamp("regTM"));                
                list.add(bean);
            }
        } catch(Exception e) {
            System.out.println(e.getMessage());
        } finally {
            daoClose();
        }
        return list;
    }
    
    public int bbsCount() {
        int cnt = 0;
        try {
            conn = DBCP.DBconnection();
            String sql = "select count(*) from bbs";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if(rs.next()) cnt = rs.getInt(1);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            daoClose();
        }
        return cnt;
    }
    
    public boolean insertBBS(HttpServletRequest req) {
        boolean chk = false;
        try {
            conn = DBCP.DBconnection();
            String sql = "insert into bbs (title, content, id) values (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, req.getParameter("title"));
            pstmt.setString(2, req.getParameter("content"));
            pstmt.setString(3, req.getParameter("id"));
            int rntNum = pstmt.executeUpdate();
            if(rntNum == 1) {
                System.out.println("글입력 성공");
                chk = true;
            }
        } catch(Exception e) {
            System.out.println(e.getMessage());
        } finally {
            daoClose();
        }
        return chk;
    }
    
    public bbsBean selectContent(String idx) {
        bbsBean bean = new bbsBean();
        try {
            conn = DBCP.DBconnection();
            String sql = "select * from bbs where idx = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, idx);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                bean.setIdx(rs.getInt("idx"));
                bean.setContent(rs.getString("content"));
                bean.setId(rs.getString("id"));
                bean.setTitle(rs.getString("title"));
                bean.setRegTM(rs.getTimestamp("regTM"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            daoClose();
        }
        return bean;
    }
    
    public boolean updateContent(String idx, String title, String content) {
        boolean res = false;
        try {
            int idxNum = Integer.parseInt(idx);
            conn = DBCP.DBconnection();
            String sql = "update bbs set title= ?, content=? where idx =?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setInt(3, idxNum);
            int rs = pstmt.executeUpdate();
            if(rs == 1) res = true;
        } catch(Exception e) {
            System.out.println(e.getMessage());
        } finally {
            daoClose();         
        }
        return res;
    }
    
    public boolean deleteBBS(int idx) {
        boolean reChk = false;
        try {
            conn = DBCP.DBconnection();
            String sql = "delete from bbs where idx = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idx);
            int rsNum = pstmt.executeUpdate();
            if(rsNum == 1) reChk = true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            daoClose();
        }
        return reChk;
    }
    
    // 공지사항 시작
    public List<bbsBean> selectNotice(){
        List<bbsBean> list = new ArrayList<>();
        try {
            conn = DBCP.DBconnection();
            String sql = "select * from notice order by idx desc";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            
            while(rs.next()) {
                bbsBean bean = new bbsBean();
                System.out.println("노티스 실행");
                bean.setIdx(rs.getInt("idx"));
                bean.setTitle(rs.getString("title"));
                bean.setContent(rs.getString("content"));
                bean.setId(rs.getString("id"));
                bean.setRegTM(rs.getTimestamp("regTM"));                
                list.add(bean);
            }
        } catch(Exception e) {
            System.out.println(e.getMessage());
        } finally {
            daoClose();
        }
        return list;
    }
    
    public int noticeCount() {
        int cnt = 0;
        try {
            conn = DBCP.DBconnection();
            String sql = "select count(*) from notice";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if(rs.next()) cnt = rs.getInt(1);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            daoClose();
        }
        return cnt;
    }
    // 공지사항 끝

    public void daoClose() {
        try {
            if(conn != null) conn.close();
            if(stmt != null) stmt.close();
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
        } catch (Exception e) {}
    }
}
