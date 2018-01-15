
<%@page import="java.sql.*"%>

   
        <%
            String username;
            username=request.getParameter("tbuname");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from admin_login where username='"+username+"'");
                if(rs.next())
                {
                  String pass=rs.getString("password");
                   response.sendRedirect("Recover_password.jsp?msg=password+is+"+pass);
                }
                else
                {
                   response.sendRedirect("Recover_password.jsp?msg=Invalid+username");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            %>
  