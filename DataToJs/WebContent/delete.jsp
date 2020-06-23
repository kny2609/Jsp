<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	
	Connection conn = DBConfig.getConnection();
	Statement stmt = conn.createStatement();
	int result = stmt.executeUpdate("DELETE FROM `MEMBER` WHERE `uid`='"+uid+"'");
	
	stmt.close();
	conn.close();
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	out.print(json);

%>