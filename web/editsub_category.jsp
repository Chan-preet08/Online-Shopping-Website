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
        <%   String subc_id = request.getParameter("subc_id");
            String c_name = "", photo = "", subc_name = "";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from sub_category where subc_id='" + subc_id + "'");
            if (rs.next()) {
                subc_name = rs.getString("subc_name");
                photo = rs.getString("photo");
                c_name = rs.getString("c_name");
            } else {
                response.sendRedirect("manage_subcategory.jsp?msg=No%20such%20subcategory");
            }
        %>


            <form role="form" action="./edit_subcategory" method="post" enctype="multipart/form-data">

                <div class="form-group">
                    <label for="c_name" class="col-md-2">Category Name</label>
                    <div class="col-md-10">
                        <input type="text" value="<%= c_name%>" class="form-control" name="c_name" id="c_name"/>
                    </div>
                </div>
                <br>
                <br>
                <div class="form-group">
                    <label for="subc_name" class="col-md-2">Sub Category Name</label>
                    <div class="col-md-10">
                        <input type="text" placeholder="<%= subc_name%>"  class="form-control" name="subc_name" id="subc_name"/>
                    </div>
                </div>
                <br><br>
                <div class="form-group">
                    <label for="photo" class="col-md-2">Photo</label>
                    <div class="col-md-10">
                        <input type="file" placeholder="Enter Photo" class="form-control" name="photo" id="photo"/>
                    </div>
                </div>
 <br><br>
                <div class="form-group">        
                    <div class="col-lg-offset-2 col-md-10">
                        <input type="submit" class="btn btn-yellow" value="Update"/>
                        <input type="hidden"  name="subc_id" value="<%=subc_id%>"/>
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