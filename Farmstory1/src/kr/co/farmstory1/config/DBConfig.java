package kr.co.farmstory1.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	// ������
//	private static final String HOST = "jdbc:mysql://kny.pe.kr?";
//	private static final String USER = "";
//	private static final String PASS = "";
	
	// ���߿�
	private static final String HOST = "jdbc:mysql://192.168.44.46:3306/kny";
	private static final String USER = "kny";
	private static final String PASS = "1234";
	
	public static Connection getConnection() throws Exception {
		// 1�ܰ�
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2�ܰ�
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
	}
}
