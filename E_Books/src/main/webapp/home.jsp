<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User : Dashboard</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<h1>User : Home</h1>
	<c:if test="${not empty userobj }">
		<h5>Name: ${userobj.name }</h5>
		<%-- <h5>Email: ${userobj.email }</h5> --%>
		
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<div style="margin-top:400px">
	<%@include file="component/footer.jsp"%>
	</div>
</body>
</html>