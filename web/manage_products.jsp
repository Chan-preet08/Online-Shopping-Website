<%
    String email1 = (String) session.getAttribute("email1");
    if (email1 == null) {
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
        <%@include file='seller_header.jsp' %>
        <!-- //banner -->
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
          <table class="table table-responsive table-bordered table-hover ">  
                <tr>
                    <td><b> Product Name</b></td>
                    <td><b> Description </b></td>
                    <td><b> MRP </b></td>
                    <td><b> Offer Price </b></td>
                    <td><b>Icon</b></td>
            </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from product");
                while (rs.next()) 
                {
                    String p_id= rs.getString("p_id");
                    String p_name = rs.getString("p_name");
                    String desc = rs.getString("desc");
                    String image = rs.getString("image");
                    String mrp = rs.getString("mrp");
                    String offer_price = rs.getString("offer_price");
        %>
              
            <tr>
                <td><%=p_name%> </td>
                <td><%=desc%></td>
                <td><%=mrp%></td>
                <td><%=offer_price%></td>
                <td><img width="60px" height="60px" src="<%=image%>"></td>
                <td><a href="editproduct.jsp?pid=<%=p_id%>"> Edit</a></td>
                <td><a href="delproduct.jsp?pid=<%= p_id %>"> Delete</a></td>
                <td><a href="manage_photos.jsp?pid=<%= p_id %> "> Manage Photos</a></td>
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