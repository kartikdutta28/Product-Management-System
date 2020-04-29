<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<br/><br/><br/>
<nav class="navbar navbar-expand-lg navbar-light bg-secondary fixed-top">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
		<sec:authorize access="!isAuthenticated()">
		<li class="nav-item active">
			<a class='nav-link text-white' href='/login'>Login</a>
		</li>
		</sec:authorize>
      <li class="nav-item active">
        <a class="nav-link text-white" href="/tempUserHome">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
      	<%
  		if(session.getAttribute("userId")!=null){
  			out.println("<a class='nav-link text-white' href='/userOrders'>View Orders</a>");	
  		}
  		%>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
		<sec:authorize access="isAuthenticated()">
		<%
			if(session.getAttribute("userId")!=null){%>
		<li class="nav-item dropdown">
			<a  class="nav-link btn btn-outline-dark mr-2 dropdown-toggle bg-dark text-white" href="#" id="navbarDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("userMail")%></a>
			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				<a class="dropdown-item" href="/logout">Logout</a>
			</div>
		</li>
		<%}%>
		</sec:authorize>
		<%
  		if(session.getAttribute("userId")!=null){
  			out.println("<li>");
  			out.println("<button type='button' class='btn btn-primary'>");
  			out.println("Cart <span id='result' class='badge badge-light'></span>");
  			out.println("<span class='sr-only'>unread messages</span></button>");
  			out.println("</li>");
  		}
  		%>
	</ul>
  </div>
</nav>