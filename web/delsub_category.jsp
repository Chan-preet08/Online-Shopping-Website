
<%@page import="java.sql.*" %>
        <%   String subc_id=request.getParameter("subc_id");
             Class.forName("com.mysql.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
             Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
             ResultSet rs= stmt.executeQuery("select * from sub_category where subc_id='"+subc_id+"'");
             if(rs.next())
             {
                 rs.deleteRow();
                 response.sendRedirect("manage_subcategory.jsp?msg=deleted");
             }
             %>
 
