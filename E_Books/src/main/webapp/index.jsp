<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
.back-img {
	background: url('img/book.png');
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>

<title>Ebook: Home Page</title>
<%@include file="component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">Welcome to, Ebook Shopping
			System</h2>

	</div>
	<!-- Start Recent Book -->

	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDaoImpl dao2 = new BookDaoImpl(DBConnect.getCon());
			List<BookDtls> list = dao2.getRecentBooks();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%> "
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p>
							Name:
							<%=b.getBookname()%></p>
						<p>
							Author:
							<%=b.getAuthor()%></p>
						<%
						if (b.getBookCategory().equals("Old")) {
						%>
						<p>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>

							<%
							} else {
							%>
							<a href="cart?bid<%=b.getBookId()%> && uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>

							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5"><i
								class="fa-solid fa-book"></i>View</a> <a href="#"
								class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						Category:
						<%=b.getBookCategory()%></p>
						<div class="row">

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1"><i
								class="fa-solid fa-book"></i>View</a> <a href="#"
								class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>

						<%
						}
						%>


					</div>
				</div>
			</div>

			<%
			}
			%>


		</div>
		<div class="text-center">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white mt-1"><i
				class="fa-solid fa-book"></i>View All</a>
		</div>
	</div>
	<!-- End Recent Book -->
	<hr>
	<!-- Start New Book -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getCon());
			List<BookDtls> list1 = dao.getNewBook();
			for (BookDtls b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%> "
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p>
							Name:
							<%=b.getBookname()%></p>
						<p>
							Author:<%=b.getAuthor()%></p>
						<p>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>

							<%
							} else {
							%>
							<a href="cart?bid<%=b.getBookId()%> && uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>

							<%
							}
							%>
							 <a
								href="view_books.jsp?bid=<%=b.getBookId()%>"
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
		<div class="text-center">
			<a href="all_new_book.jsp"
				class="btn btn-danger btn-sm text-white mt-1"><i
				class="fa-solid fa-book"></i>View All</a>
		</div>
	</div>
	<!-- End New Book -->
	<hr>
	<!-- Start Old Book -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			BookDaoImpl dao3 = new BookDaoImpl(DBConnect.getCon());
			List<BookDtls> list2 = dao3.getOldBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%> "
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p>
							Name:
							<%=b.getBookname()%></p>
						<p>
							Author:
							<%=b.getAuthor()%></p>
						<p>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%> "
								class="btn btn-success btn-sm ml-5"><i
								class="fa-solid fa-book"></i>View Details</a> <a href="#"
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
		<div class="text-center">
			<a href="all_old_book.jsp"
				class="btn btn-danger btn-sm text-white mt-1"><i
				class="fa-solid fa-book"></i>View All</a>
		</div>
	</div>


	<!-- End Old Book -->
	<%@include file="component/footer.jsp"%>
</body>
</html>