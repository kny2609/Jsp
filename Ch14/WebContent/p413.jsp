<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String idValue = request.getParameter("id");

 	Connection conn = null;
 	PreparedStatement psmtItem = null;
 	PreparedStatement psmtDetail = null;
 	
 	String host = "jdbc:mysql://192.168.50.82:3306/kny";
	String user = "kny";
	String pass = "1234";
	
	Throwable occuredException = null;
	
	try{
		int id = Integer.parseInt(idValue);
		
		conn = DriverManager.getConnection(host, user, pass);
		conn.setAutoCommit(false);
		
		psmtItem = conn.prepareStatement("insert into ITEM values (?, ?)");
		psmtItem.setInt(1, id);
		psmtItem.setString(2, "상품 이름 "+id);
		psmtItem.executeUpdate();
		
		if(request.getParameter("error") != null){
			throw new Exception("의도적 익셉션 발생");
		}
		
		psmtDetail = conn.prepareStatement("insert into ITEM_DETAIL values (?, ?)");
		psmtDetail.setInt(1, id);
		psmtDetail.setString(2, "상세 설명"+id);
		psmtDetail.executeUpdate();
		
		conn.commit();
	} catch (Throwable e){
		if(conn != null){
			try{
				conn.rollback();
			} catch(SQLException ex) {}
		}
		occuredException = e;
	} finally {
		if(psmtItem != null)
			try {psmtItem.close();} catch (SQLException ex) {}
		if(psmtDetail != null)
			try {psmtDetail.close();} catch (SQLException ex) {}
		if(conn != null)
			try {conn.close();} catch (SQLException ex) {}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITEM 값 입력</title>
</head>
<body>
	<% if(occuredException != null){ %>
	에러가 발생하였슴 : <%= occuredException.getMessage() %>
	<% } else { %>
	데이터가 성공적으로 들어감
	<% } %>
</body>
</html>