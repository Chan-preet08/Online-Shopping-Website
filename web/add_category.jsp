<%
    String email2 = (String) session.getAttribute("email2");
    if (email2 == null) {
        response.sendRedirect("admin_login.jsp?msg=Please Login To Perform This Action");
    } else {

%>
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
                    
        <form role="form" enctype="multipart/form-data"  action="./add_category_action" method="post">
           <div class="form-group">
                            <label for="cat_name" class="col-md-2">Name</label>
                            <div class="col-md-10">
                            <input type="text" placeholder="Enter Category Name"  class="form-control" name="cat_name" id="cat_name"/>
                            </div>
                        </div>
            <br>
            <br>
            <div class="form-group">
                <label for="description" class="col-md-2">Description</label>
                <div class="col-md-10">
                    <input type="text" placeholder="Enter Description" class="form-control" name="description" id="description"/>
                </div>
            </div>
            <br>
            <br>
                <div class="form-group">
                <label for="tbphoto" class="col-md-2">Photo</label>
                <div class="col-md-10">
                    <input type="file" placeholder="Enter Photo" class="form-control" name="tbphoto" id="tbphoto"/>
            </div>
                </div>    
       <br><br>
                 <div class="col-lg-offset-2 col-lg-10">
                     <input type="submit" class="btn btn-yellow" value="Add"/>
                 </div>
        </form>
      
       <% 
            String m= request.getParameter("msg");
            if(m!=null)
            {
                if(m.contains("already")){
                    %>
                    <h3 style="color: red; text-align: center"><%= m %></h3>
           <% }
else{
%>
<h3 style="color: green; text-align: center"><%= m %></h3>
<%

}}
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