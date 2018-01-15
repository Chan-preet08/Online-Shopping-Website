
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file='public_header.jsp' %>

        <!-- //banner -->
        <div class="container-fluid all-div" id="div11">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from product");
                    while (rs.next()) {
                        String p_name = rs.getString("p_name");
                        String image = rs.getString("image");
                        String mrp = rs.getString("mrp");
                        String offer_price = rs.getString("offer_price");
                %>
                <div class="col-sm-4">
                        <div class="cakes">
                            <img src="<%=image%>" class="img img-responsive img-thumbnail">
                            <h4><%=p_name%></h4>
                            <%
                                if (mrp == offer_price) {
                            %>
                            <p><%=mrp%></p>
                            <%
                            } else {
                            %>
                            <p><del><%=mrp%> INR</p>
                            <p><%=offer_price%> INR</p>
                            <%
                                }
                            %>
                        </div>
                    </a>
                </div>
                <%            }
                %>
           
        </div>  
 </div>
            </div>
       
        <%@include file='footer.html' %> 
    </body>
</html>
