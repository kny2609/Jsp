package kr.co.farmstory1.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	// 배포용
//	private static final String HOST = "jdbc:mysql://kny.pe.kr?";
//	private static final String USER = "";
//	private static final String PASS = "";
	
	// 개발용
	private static final String HOST = "jdbc:mysql://192.168.44.46:3306/kny";
	private static final String USER = "kny";
	private static final String PASS = "1234";
	
	public static Connection getConnection() throws Exception {
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
	}
}
