<% if(request.getAttribute("msg") != null) {
    out.write("<div class='alert "+request.getAttribute("class")+"'>"+request.getAttribute("msg")+"</div>");
}
%>
<% if(request.getAttribute("msg-2") != null) {
    out.write("<div class='alert "+request.getAttribute("class")+"'>"+request.getAttribute("msg-2")+"</div>");
}
%>