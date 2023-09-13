<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Orders Book</title>
<%@include file="allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp" />
	</c:if>
	<h2 class="text-center">Hello Admin</h2>
	<div class="container">

		<table class="table">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Ph No</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>S</td>
					<td>H</td>
					<td>I</td>
					<td>V</td>
					<td>J</td>
					<td>I</td>
					<td>1</td>
					<td>0</td>


				</tr>

			</tbody>
		</table>

	</div>
	<div style="margin-top:80px">
	<%@include file="footer.jsp"%>
	</div>
</body>
</html>