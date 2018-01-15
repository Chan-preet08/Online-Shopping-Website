<%
    String email2 = (String) session.getAttribute("email2");
    if (email2 == null) {
        response.sendRedirect("admin_login.jsp?msg=Please Login To Perform This Action");
    } else {

%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file='admin_header.jsp' %>
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
        <h1 class="jumbotron">Pending Sellers</h1>
        <table class="table table-responsive table-bordered table-hover ">   
             
            <tr>
                <td> <b>Email</b> </td>
                <td><b>Merchant Name</b> </td>
                <td><b>Contact</b>  </td>
                <td><b>Icon</b> </td>
                <td><b>Status</b> </td>
            </tr>
            
        <%
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select email,m_name,contact,icon from seller where status='pending' ");
                while(rs.next())
                {
                    String email = rs.getString("email");
                    String m_name = rs.getString("m_name");
                    String contact = rs.getString("contact");
                    String icon = rs.getString("icon");
                    %>
        
            <tr>
                <td> <%= email%></td>
                <td> <%=m_name%></td>
                <td> <%= contact%></td>
                <td><img width="50px" height="50px" src="<%=icon%>"  /> </td>
                <td><a href="approve_seller.jsp?msg=<%=email%>" > Approve</a></td>
            </tr>
    
                    <%
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            %>
        </table>
        
        
        <h1 class="jumbotron">Active Sellers  </h1>
         <table class="table table-responsive table-bordered table-hover ">   
             
            <tr>
                <td> <b>Email</b> </td>
                <td><b>Merchant Name</b> </td>
                <td><b>Contact</b>  </td>
                <td><b>Icon</b> </td>
                <td><b>Status</b> </td>
            </tr>
            
        <%
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select email,m_name,contact,icon from seller where status='active' ");
                while(rs.next())
                {
                    String email = rs.getString("email");
                    String m_name = rs.getString("m_name");
                    String contact = rs.getString("contact");
                    String icon = rs.getString("icon");
                    %>
        
            <tr>
                <td> <%= email%></td>
                <td> <%=m_name%></td>
                <td> <%= contact%></td>
                <td><img width="50px" height="50px" src="<%=icon%>"  /> </td>
               <td><a  href="approve_seller.jsp"> Block</a></td>
            </tr>
    
                    <%
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            %>
        </table>
        </div>
            </div>
        </div>
        <%@include file='footer.html' %> 
         </body>
</html>
<%
    }
%>