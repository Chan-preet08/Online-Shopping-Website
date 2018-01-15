<%
    String email2 = (String) session.getAttribute("email2");
    if (email2 == null) {
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

        <!-- //banner -->
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
                    
                    <form role="form" enctype="multipart/form-data"  action="./add_subcategory_action" method="post">
           <div class="form-group">
                            <label for="sub_name" class="col-md-2">Name</label>
                            <div class="col-md-10">
                            <input type="text" placeholder="Enter Sub Category Name"  class="form-control" name="sub_name" id="sub_name">
                            </div>
                        </div>
            <br>
            <br>
                <div class="form-group">
                <label for="photo" class="col-md-2">Photo</label>
                <div class="col-md-10">
                    <input type="file" placeholder="Enter Photo" class="form-control" name="photo" id="photo">
                 </div>
                </div>   
            <br><br>
             <div class="form-group">
                <label for="photo" class="col-md-2">Category</label>
                <div class="col-md-10">
                    <select required name="c_name" class="form-control">
                        <%
                                 try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from category");
        
                while (rs.next()) 
                {
                    String c_name=rs.getString("c_name");
                        %>
                        <option ><%=c_name%></option>
                        <%
                            
                }
}
catch(Exception ex)
{
  ex.printStackTrace();
}
%>
                    </select>
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