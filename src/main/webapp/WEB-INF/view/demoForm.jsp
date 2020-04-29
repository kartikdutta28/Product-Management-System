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
<style>
       .error{
           color: #ff0000;
       }
       .errorblock{
           color: #000;
           background-color: #ffEEEE;
           border: 3px solid #ff0000;
           padding: 8px;
           margin: 16px;
       }
    </style>
</head>
<body>
<%@ include file="includes/adnavbar.jsp" %><br/><br/>
		<div class="container">
			<div class="row">
				<div class="col"></div>
				<div class="col-6">
					<form:form method="post" modelAttribute="product" action="/addProduct" cssClass="border-info card shadow-lg p-3 mb-4 bg-white rounded time-right">
                        <div class="form-group">
                            <label for="name">Product Name</label>
                            <form:input  cssClass="form-control" path="name" type="text" id="name" />
                            <form:errors path="name" cssClass="error"/>
                            <label for="price">Product Price</label>
                            <form:input  cssClass="form-control" path="price" type="text" id="price" />
                            <form:errors  path="price" cssClass="error"/>
                            <label for="quantity">Product Quantity</label>
                            <form:input cssClass="form-control" path="quantity" type="text" id="quantity" />
                            <form:errors  path="quantity" cssClass="error"/>
                            <label id="category">Product Category</label>
                        <ul>
                            <form:select id="category" cssClass="form-control" path="category"><form:option value="NONE" label="Select Category" />
                                <form:option value="Clothing">Clothing</form:option>
                                <form:option value="Accessories">Accessories</form:option>
                                <form:option value="Merchandise">Merchandise</form:option>
                            </form:select>
                        </ul>
                        <input class="btn btn-outline-primary btn-block" type = 'submit' value='add' />
                        </div>
                    </form:form>
                    </div>
                <div class="col"></div>
                </div>
			</div>
<%@ include file="includes/scripts.jsp" %>
</body>
</html>