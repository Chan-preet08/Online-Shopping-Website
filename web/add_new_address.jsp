<%@page import="java.sql.*"%>
<%
    String email = request.getParameter("email");
    String h_no = request.getParameter("h_no").toUpperCase();
    String street = request.getParameter("street").toUpperCase();
    String city = request.getParameter("city").toUpperCase();
    String state = request.getParameter("state").toUpperCase();
    String landmark = request.getParameter("landmark").toUpperCase();
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
    Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs1 = stmt1.executeQuery("select * from user_addresses");
    rs1.moveToInsertRow();
    rs1.updateString("email", email);
    rs1.updateString("h_no", h_no);
    rs1.updateString("street", street);
    rs1.updateString("state", state);
    rs1.updateString("city", city);
    rs1.updateString("landmark", landmark);
    rs1.insertRow();
    response.sendRedirect("place_order.jsp");

%>
