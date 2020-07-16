<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String memberID = request.getParameter("memberID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			String host = "jdbc:mysql://192.168.50.82:3306/kny";
			String user = "kny";
			String pass = "1234";
			
			String query = "select * from MEMBER where uid='"+memberID+"'";
			
			conn = DriverManager.getConnection(host, user, pass);
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(query);
			
			if(rs.next()){
	%>
	
	<table border="1">
		<tr>
			<td>아이디</td><td><%= memberID %></td>
		</tr>
		<tr>
			<td>직급</td><td><%= rs.getString("pos") %></td>
		</tr>
		<tr>
			<td>이름</td><td><%= rs.getString("name") %></td>
		</tr>
		<tr>
			<td>휴대폰</td><td><%= rs.getString("hp") %></td>
		</tr>
	</table>
	<%
			} else {
	%>
	<%= memberID %>에 해당하는 정보가 존재하지 않습니다.
	<%
			}
		} catch(SQLException ex){
	%>
	에러 발생 : <%= ex.getMessage() %>
	<%
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			if(stmt != null) try {stmt.close();} catch(SQLException ex){}
			if(conn != null) try {conn.close();} catch(SQLException ex){}
		}
	%>
</body>
</html>