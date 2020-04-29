<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<br/><br/><br/>
<nav class="navbar navbar-expand-lg navbar-light bg-secondary fixed-top">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class='nav-link text-white' href="/adminHome">Home</a>
                </li>
                <li class="nav-item">
                    <a class='nav-link text-white' href="demo">Add Product</a>
                </li>
                <li class="nav-item">
                    <a class='nav-link text-white' href="viewOrders">View Orders</a>
                </li>
                <li class="nav-item">
                    <a class='nav-link text-white' href="report">Generate Report</a>
                </li>
            </sec:authorize>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a  class="nav-link btn btn-outline-dark mr-2 dropdown-toggle bg-dark text-white" href="#" id="navbarDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("userMail")%></a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/logout">Logout</a>
                </div>
            </li>
        </ul>
    </div>
</nav>