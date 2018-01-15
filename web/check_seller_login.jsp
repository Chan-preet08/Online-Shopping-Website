
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <%
            String email1;
            String password;
            email1 = request.getParameter("tbemail");
            password = request.getParameter("tbpass");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from seller where email='"+email1+"' and password='"+password+"'");
                if(rs.next())
                {
                    session.setAttribute("email1", email1);
                    response.sendRedirect("seller_login.jsp?msg=login%20successful");
                }
                else
                {
                    response.sendRedirect("seller_login.jsp?msg=invalid%20email/password");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        %>

