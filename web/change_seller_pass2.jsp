
<%@page import="java.sql.*"%>
        <%
            String email1 = (String)session.getAttribute("email1");
            String oldpass=request.getParameter("old");
            String newpass=request.getParameter("new"); 
          try{
            Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "system");
                java.sql.Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from seller where password='"+oldpass+"' && email='"+email1+"'");
                if(rs.next())
                {
                    rs.updateString("password",newpass);
                    rs.updateRow();
                    response.sendRedirect("change_sellerpass.jsp?msg=password changed successfully");
                   
                  
               }
                else
                {
                  response.sendRedirect("change_sellerpass.jsp?msg=old password doesn't match");

                }
          }
         
                     catch(Exception e)
                             {e.printStackTrace();}

        %>
