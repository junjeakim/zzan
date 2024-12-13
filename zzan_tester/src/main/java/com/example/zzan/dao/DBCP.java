package com.example.zzan.dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCP {
	
	static Connection conn = null;
	
	
	public static Connection DBconnection() throws Exception{
		Context init = new InitialContext();
		DataSource dataSource = (DataSource) init.lookup("java:comp/env/jdbc/dbcpConn");
		conn = dataSource.getConnection();
		
		System.out.println("데이터베이스 연결 OK!");
		return conn;
	}

}
