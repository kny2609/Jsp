<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.FormatUtil" %>
<%
	request.setAttribute("price", 12345L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 함수 호출</title>
</head>
<body>
	가격은 <b>${FormatUtil.number(price, '#,##O'}</b>원 입니다.
</body>
</html>