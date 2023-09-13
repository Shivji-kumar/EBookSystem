<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">

			<%
			BookDaoImpl dao3 = new BookDaoImpl(DBConnect.getCon());
			List<BookDtls> list2 = dao3.getAllOldBook();
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
							<a href="#" class="btn btn-success btn-sm ml-5"><i
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
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>