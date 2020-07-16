<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String memberID = request.getParameter("memberID");
	String pos = request.getParameter("pos");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	try{
		String host = "jdbc:mysql://192.168.50.82:3306/kny";
		String user = "kny";
		String pass = "1234";
		
		conn = DriverManager.getConnection(host, user, pass);
		psmt = conn.prepareStatement("insert into MEMBER values (?, ?, ?, ?)");
		psmt.setString(1, memberID);
		psmt.setString(2, pos);
		psmt.setString(3, name);
		psmt.setString(4, hp);
		
		psmt.executeUpdate();
	} finally {
		if(psmt != null) try {psmt.close();} catch(SQLException ex){}
		if(conn != null) try {conn.close();} catch(SQLException ex){}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삽입</title>
</head>
<body>
	MEMBER 테이블에 새로운 레코드를 삽입했습니다
</body>
</html>