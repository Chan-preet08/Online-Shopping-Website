<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("admin_login.jsp?msg=Please Login To Perform This Action");
    } else {

%>
<%@page import="java.sql.*" %>
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
        <%   String c_name = request.getParameter("c_name");
            String description = "", icon = "", c_name1 = "";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from category where c_name='" + c_name + "'");
            if (rs.next()) {
                c_name1 = rs.getString("c_name");
                icon = rs.getString("icon");
                description = rs.getString("description");
            } else {
                response.sendRedirect("manage_category.jsp?msg=No%20such%20category");
            }
        %>

            <form role="form" action="./edit_category" method="post" enctype="multipart/form-data">

                <div class="form-group">
                    <label for="c_name" class="col-md-2">Category Name</label>
                    <div class="col-md-10">
                        <input type="text" value="<%= c_name1%>" class="form-control" name="c_name" id="c_name"/>
                    </div>
                </div>
                <br>
                <br>
                <div class="form-group">
                    <label for="desc" class="col-md-2">Description</label>
                    <div class="col-md-10">
                        <input type="text" placeholder="<%= description%>"  class="form-control" name="desc" id="desc"/>
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
                        <input type="submit" class="btn btn-yellow" value="Update"/>
                    </div>
                </div>
            </form>
                    </div>
            </div>
        </div>
        <%@include file='footer.html' %> 
    </body>
</html>
<%
    }
%>