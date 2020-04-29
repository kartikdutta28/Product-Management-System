<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Management System</title>
	<%--<%@ include file="includes/style.jsp" %>--%>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
</head>
<body>
<%@ include file="includes/adnavbar.jsp" %>
	<div align="center">
		<br/><br/>
	<form:form method="post" modelAttribute="product" action="/addProduct">
		<table>
			<tr>
				<th>Fill Product Details</th>
			</tr>
			<tr>
				<th>Product Id</th>
				<td><form:input path="id" type="text" id="id" readonly="true"/></td>
				<td><form:errors path="id" cssClass="error"/></td>		
			</tr>
			<tr>
				<th>Name</th>
				<td><form:input path="name" type="text" id="name" /></td>
				<td><form:errors path="name" cssClass="error"/></td>		
			</tr>
			<tr>
				<th>Price</th>
				<td><form:input path="price" type="text" id="price" /></td>
			</tr>
			<tr>
				<th>Quantity</th>
				<td><form:input path="quantity" type="text" id="quantity" /></td>
			</tr>
			<tr>
				<th>Category</th>
				<td>
					<ul>
						<form:select path="category"><form:option value="NONE" label="Select Category" />
							<form:option value="Clothing">Clothing</form:option>
							<form:option value="Accessories">Accessories</form:option>
							<form:option value="Merchandise">Merchandise</form:option>
						</form:select>
					</ul>
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="add" /></td>
			</tr>
		</table>
	</form:form>
	</div>
</body>
</html>