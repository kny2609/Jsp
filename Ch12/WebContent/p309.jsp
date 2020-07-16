<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>use_url_tag</title>
</head>
<body>
	<c:url value="http://search.daum.net/search" var="searchUrl">
		<c:param name="w" value="blog"></c:param>
		<c:param name="q" value="공원"></c:param>
	</c:url>
	
	<ul>
		<li>${searchUrl}</li>
		<li><c:url value="/p300.jsp"></c:url>
		<li><c:url value="./p300.jsp"></c:url>
	</ul>
</body>
</html>