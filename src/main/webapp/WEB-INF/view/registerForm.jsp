<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<%@ include file="includes/navbar.jsp" %><br/><br/>
<div class="container">
    <div class="row">
        <div class="col"></div>
        <div class="col-6">
            <form:form method="post" modelAttribute="users" action="/register" cssClass="border-info card shadow-lg p-3 mb-4 bg-white rounded time-right">
                <h4>Fill the form below to login</h4>
                <div class="form-group">
                    <label for="name">User Name</label>
                    <form:input  cssClass="form-control" path="username" type="text" id="name" />
                    <label for="email">Your Email Address</label>
                    <form:input  cssClass="form-control" path="email" type="text" id="email" />
                    <label for="password">Your Password</label>
                    <form:input cssClass="form-control" path="password" type="password" id="password" />
                    <input class="btn btn-outline-primary btn-block" type = 'submit' value='Register' />
                </div>
            </form:form>
        </div>
        <div class="col"></div>
    </div>
</div>
<%@ include file="includes/scripts.jsp" %>
</body>
</html>