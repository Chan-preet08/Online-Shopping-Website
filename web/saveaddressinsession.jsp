<%
     String address=request.getParameter("address");
     session.setAttribute("address", address);
     out.println("address saved");
%>