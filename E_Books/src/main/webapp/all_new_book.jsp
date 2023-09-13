<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book</title>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%
	User u=(User)session.getAttribute("userobj");
	
	%>
	<%@include file="component/navbar.jsp"%>
	<c:if test="${not empty addCart}">
		<h5 class="text-center text-success">${addCart }</h5>
		<c:remove var="addCart" scope="session" />
	</c:if>
	<c:if test="${not empty failedCart}">
		<h5 class="text-center text-danger">${failedCart }</h5>
		<c:remove var="failedCart" scope="session" />
	</c:if>
	<div class="container-fluid">
		<div class="row p-3">

			<%
			BookDaoImpl dao2 = new BookDaoImpl(DBConnect.getCon());
			List<BookDtls> list = dao2.getAllNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%> "
							style="width: 100px; height: 150px;" class="img-thumblin">
						<p>
							Name:
							<%=b.getBookname()%></p>
						<p>
							Author:<%=b.getAuthor()%></p>
						<p>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="#" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a> <a href="#"
								class="btn btn-success btn-sm ml-1"><i
								class="fa-solid fa-book"></i>View</a> <a href="#"
								class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>