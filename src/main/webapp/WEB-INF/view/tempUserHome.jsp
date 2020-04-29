<%@ page import="com.example.demo.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%@ include file="includes/navbar.jsp" %>
    <div class="container">
        <form action="/temp/checkOut" method="post">
            <input type="submit" value="Checkout" class="btn btn-primary">
            <%
                List<Product> pl = (List<Product>) request.getAttribute("pList");
                for (Product p : pl)
                {
            %>
            <div class="row">
                <div class="col"></div>
                <div class="col-6 border-info card shadow-lg p-3 mb-4 bg-white rounded time-right">
                    <div class="card-body">
                        <h5 class="card-title">Product Name : <%=p.getName()%></h5>
                        <h6 class="card-subtitle mb-2 text-muted">Product Price : <%=p.getPrice()%></h6>
                        <p class="card-text"><%=p.getQuantity()%> Pieces left</p>
                        <div class="row">
                            <div class="col">
                                <div class="form-check">
                                    <input id="defaultCheck1" class="form-check-input" type="checkbox" name="order" value='<%=p.getName()%>,<%=p.getPrice()%>,<%=p.getId()%>,<%=p.getCategory()%>'/>
                                    <label class="form-check-label" for="defaultCheck1">
                                        Check this box to add this item to your cart
                                    </label>
                                </div>
                            </div>
                            <div class="col">
                                <label class="form-check-label" for="qty">
                                    Select your quantity
                                </label>
                                <select class="form-control" id="qty" name="<%=p.getId()%>">
                                    <%
                                        for(int i=1; i<=p.getQuantity(); i++) {
                                            out.write("<option value=\""+i+"\">"+i+"</option>");
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col"></div>
            </div>
            <%}%>
        </form>
    </div>


    <%@ include file="includes/scripts.jsp" %>
</body>
</html>