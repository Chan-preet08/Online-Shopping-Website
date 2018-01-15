<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("user_login.jsp?msg=Please Login To Perform This Action");
    } else {

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%@include file='public_header.jsp' %>
        <!-- //banner -->
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container"> 

            <%
                String username = (String) session.getAttribute("email");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from orders where user_email='" + username + "'");
                while (rs.next()) 
                {
                    String order_id = rs.getString("order_id");
                    String net_amt = rs.getString("net_amt");
                    String booking_date = rs.getString("booking_date");
                    String delivery_date = rs.getString("delivery_date");
                    String address_detail = rs.getString("address_detail");
            %>
            <table class="table table-hover">              
                <tr>
                    <td style=""><%=net_amt%></td>
                    <td style=""><%=booking_date%></td>
                    <td style=""><%=delivery_date%></td>
                    <td style=""><%=address_detail%></td>
                    <td><a href="#Details_<%= order_id%>" data-toggle="collapse">Click to View Details</a></td>
                </tr>



            </table>
                
            <div id="Details_<%= order_id%>" class="collapse">     
            <%
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                    Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs2 = stmt2.executeQuery("select * from order_details where order_id='" + order_id + "'");
                    while (rs2.next()) {
                        String product_name = rs2.getString("product_name");
                        String qty = rs2.getString("qty");
                        String photo = rs2.getString("photo");
                        String offer_price = rs2.getString("offer_price");


            %>
             <div class="row" style="padding:10px">
                 <div class="col-md-6" >
                    <img src="<%=photo%>" width="100px" height="100px" alt="primary photo of product" />
                </div>
                <div class="col-md-6"> 
                    <table class="table table-responsive" >              
                        <tr>
                            <td><label>Name of product</label></td>
                            <td><%=product_name%></td>   
                        </tr>
                        <tr>
                            <td><label>Offer Price</label></td>
                            <td><%=offer_price%></td>   
                        </tr>
                        <tr>
                            <td><label>Quantity</label></td>
                            <td><%=qty%></td>   
                        </tr>

                    </table>
                </div>
            </div>
            <%
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
 
         %>
            </div>
            <%                    }
            %>

        </div>
            </div>
        </div>
        <%@include file='footer.html' %>
    </body>
</html>
<%
    }
%>