
<%@page import="java.sql.*"%>

   
        <%
            String email;
            email=request.getParameter("tbemail");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from seller where email='"+email+"'");
                if(rs.next())
                {
                  String pass=rs.getString("password");
                   response.sendRedirect("recover_sellerpass.jsp?msg=password+is+"+pass);
                }
                else
                {
                   response.sendRedirect("recover_sellerpass.jsp?msg=Invalid+email");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            %>
  