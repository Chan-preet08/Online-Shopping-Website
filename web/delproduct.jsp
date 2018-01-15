
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%   String pid=request.getParameter("pid");
             Class.forName("com.mysql.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
             Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
             ResultSet rs= stmt.executeQuery("select * from product where p_id="+pid+"");
             
             if(rs.next())
             {
                 rs.deleteRow();
                 response.sendRedirect("manage_products.jsp?msg=deleted");
             }
             
             
             %>
           
    </body>
</html>
