
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet">

    </head>

    <body>
        <%   String pid = request.getParameter("pid");
            String desc = "", pic = "", mrp = "", offer_price = "", p_name = "";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from product where p_id='" + pid + "'");
            if (rs.next()) {
                p_name = rs.getString("p_name");
                desc = rs.getString("desc");
                pic = rs.getString("image");
                mrp = rs.getString("mrp");
                offer_price = rs.getString("offer_price");
            } else {
                response.sendRedirect("manage_products.jsp?msg=No%20such%20products");
            }
        %>

        <div class="container">

            <form role="form" action="./edit_product" method="post" enctype="multipart/form-data">

                <div class="form-group">
                    <label for="p_name" class="col-md-2">Product Name</label>
                    <div class="col-md-10">
                        <input type="text" value="<%= p_name%>" class="form-control" name="p_name" id="p_name"/>
                    </div>
                </div>
                <br>
                <br>
                <div class="form-group">
                    <label for="desc" class="col-md-2">Description</label>
                    <div class="col-md-10">
                        <input type="text" placeholder="<%= desc%>"  class="form-control" name="desc" id="desc"/>
                    </div>
                </div>
                <br><br>
                <div class="form-group">
                    <label for="mrp" class="col-md-2">MRP</label>
                    <div class="col-md-10">
                        <input type="text" placeholder="<%= mrp%>"  class="form-control" name="mrp" id="mrp"/>
                    </div>
                </div>
                <br><br>
                <div class="form-group">
                    <label for="offer_price" class="col-md-2">Offer Price</label>
                    <div class="col-md-10">
                        <input type="text" placeholder="<%= offer_price%>"  class="form-control" name="offer_price" id="offer_price"/>
                    </div>
                </div>

                <br><br>
                <div class="form-group">
                    <label for="image" class="col-md-2">Photo</label>
                    <div class="col-md-10">
                        <input type="file" placeholder="Enter Photo" class="form-control" name="image" id="image"/>
                    </div>
                </div>
 <br><br>
                <div class="form-group">        
                    <div class="col-lg-offset-2 col-md-10">
                        <input type="submit" class="btn btn-primary" value="Update"/>
                    </div>
                </div>

            </form>


        </div>
    </body>
</html>
