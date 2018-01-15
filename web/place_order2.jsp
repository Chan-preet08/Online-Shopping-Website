
<%
String mode_of_payment= request.getParameter("mode");
if(mode_of_payment.equals("cod")){
    response.sendRedirect("before_final.jsp");
}else{
    response.sendRedirect("payment.jsp");
}
%>