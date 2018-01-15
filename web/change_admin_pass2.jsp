
<%@page import="java.sql.*"%>
        <%
            String email2 = (String)session.getAttribute("email2");
            String oldpass=request.getParameter("old");
            String newpass=request.getParameter("new"); 
          try{
            Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "system");
                java.sql.Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from admin_login where password='"+oldpass+"' && email='"+email2+"'");
                if(rs.next())
                {
                    rs.updateString("password",newpass);
                    rs.updateRow();
                    response.sendRedirect("change_adminpass.jsp?msg=password changed successfully");
                   
                  
               }
                else
                {
                  response.sendRedirect("change_adminpass.jsp?msg=old password doesn't match");

                }
          }
         
                     catch(Exception e)
                             {e.printStackTrace();}

        %>
