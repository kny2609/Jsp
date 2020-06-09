<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터 수신
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String pos = request.getParameter("pos");
	String dep = request.getParameter("dep");

	// 데이터베이스 프로그래밍
	String host = "jdbc:mysql://192.168.44.46:3306/kny";
	String user = "kny";
	String pass = "1234";
	
	// 1단계 - JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	// 3단계 - SQL실행 객체 생성
	String sql = "UPDATE `MEMBER` SET `name`=?, `hp`=?, `pos`=?, `dep`=? ";
		   sql += "WHERE `uid`=?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	
	psmt.setString(1, name);
	psmt.setString(2, hp);
	psmt.setString(3, pos);
	psmt.setString(4, dep);
	psmt.setString(5, uid);
	
	// 4단계 - SQL실행
	psmt.executeUpdate();
		   
	// 5단계 - 결과셋 처리(select일 경우)
	
	// 6단계 - 데이터베이스 종료
	psmt.close();
	conn.close();
	
	// 리다이렉트
	response.sendRedirect("./list.jsp");

%>