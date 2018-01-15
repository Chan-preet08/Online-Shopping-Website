<%@page import="java.sql.*" %>

<%
      String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println(email + password);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from user where email='" + email + "' and password='" + password + "'");
            if (rs.next())
            {
                out.println("success");
                session.setAttribute("email", email);
            } else {
                out.println("fail");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }    
%>