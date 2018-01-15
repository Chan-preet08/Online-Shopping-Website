<%@page import="java.sql.*"%>
        <%
            String email;
            String password;
            email = request.getParameter("email");
            password = request.getParameter("password");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from user where email='"+email+"' and password='"+password+"'");
                if(rs.next())
                {
                   session.setAttribute("email", email);
                   response.sendRedirect("user_login.jsp?msg=Login%20Successful");
                }
                else
                {
                    response.sendRedirect("user_login.jsp?msg=invalid%20email/password");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        %>

