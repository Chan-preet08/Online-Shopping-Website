
<%@page import="java.sql.*"%>

        <%
            String email2;
            String password;
            email2 = request.getParameter("tbemail");
            password = request.getParameter("tbpass");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from admin_login where email='"+email2+"' and password='"+password+"'");
                if(rs.next())
                {
                  // response.sendRedirect("admin_dashboard.jsp");
                  response.sendRedirect("admin_login.jsp?msg=Login%20Successful");
                  session.setAttribute("email2", email2);
                }
                else
                {
                    response.sendRedirect("admin_login.jsp?msg=invalid%20username/password");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        %>

