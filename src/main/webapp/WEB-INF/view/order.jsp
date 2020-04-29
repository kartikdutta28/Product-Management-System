<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.model.Orders" %>
<%@ page import="com.example.demo.model.OrderdProducts" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.example.demo.model.User" %>
<%@ page import="java.util.Optional" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <%--<%@ include file="includes/style.jsp" %>--%>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
</head>
<body>
<%@ include file="includes/adnavbar.jsp" %><br/><br/>
    <div class="container">
        <div class="row">
            <div class="col"></div>
                <div class="col-8 border-info card shadow-lg p-3 mb-4 bg-white rounded time-right">
                    <% Orders order = (Orders) request.getAttribute("order");%>
                    <% Optional<User> user=(Optional<User>)request.getAttribute("user");%>
                    <%User u=user.get();%>
                    <div class="card-body">
                        <h5 class="card-title">Ordered By :</h5>
                        <h5 class="card-title">User Mail : <%=u.getEmail()%></h5>
                        <h5 class="card-title">User Name : <%=u.getUsername()%></h5>
                        <p class="card-text">Order Date : <%=order.getDate()%></p>
                        <p class="card-text">No of items ordered : <%=order.getOrderdProducts().size()%></p>
                    </div>
                </div>
            <div class="col"></div>
        </div>
        <div class="row">
            <div class="col"></div>
            <div class="col-8">
            <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">Product ID</th>
                <th scope="col">Product Name</th>
                <th scope="col">Product Quantity</th>
                <th scope="col">Product Price</th>
                <th scope="col">Product Category</th>
            </tr>
            </thead>
            <tbody>
            <%Set<OrderdProducts> op=order.getOrderdProducts();
                for(OrderdProducts o:op){
            %>
            <tr>
                <td><%=o.getPid()%></td>
                <td><%=o.getName()%></td>
                <td><%=o.getQuantity()%></td>
                <td><%=o.getPrice()%></td>
                <td><%=o.getCategory()%></td>
            </tr>
            <%}%>
            </tbody>
        </table>
            </div>
            <div class="col"></div>
    </div>
        </div>
</body>
</html>