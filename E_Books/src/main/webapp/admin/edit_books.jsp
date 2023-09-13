<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Books</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">

					<div class="card-body">
						<h2 class="text-center">Edit Books</h2>					
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						BookDaoImpl dao=new BookDaoImpl(DBConnect.getCon());
						BookDtls b=dao.getBookById(id);
												
						%>


						<form action="../editbooks" method="post">
						
						<input type="hidden" name="id" value="<%=b.getBookId() %> ">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="bname"
									value="<%= b.getBookname() %> ">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="author"
									value="<%=b.getAuthor() %>" >
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="price"
									value="<%= b.getPrice()%>">
							</div>
							
							<div class="form-group">
								<label for="inputState" name="bstatus">Book Status</label><select
									id="inputState" name="status" class="form-control">									
									<% 
									if("Active".equals(b.getStatus())){%>
										<option value="Active">Active</option>
										 <option value="Inactive">Inactive</option>
									<%}else{%>
									
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%}
										%>
									
								</select>
							</div>
							
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update Book</button>
							</div>

						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 10px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>