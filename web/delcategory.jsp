
<%@page import="java.sql.*" %>
        <%   String c_name=request.getParameter("c_name");
             Class.forName("com.mysql.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
             Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
             ResultSet rs= stmt.executeQuery("select * from category where c_name='"+c_name+"'");
             if(rs.next())
             {
                 rs.deleteRow();
                 response.sendRedirect("manage_category.jsp?msg=deleted");
             }
             %>
 
