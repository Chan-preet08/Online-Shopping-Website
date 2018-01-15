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
        <script>
            var xmlhttp = new XMLHttpRequest();
            function go()
            {
                var category=document.getElementById('c_name').value;
                xmlhttp.open("get","fetch_sub_category.jsp?cat="+category,true);
                xmlhttp.onreadystatechange = hello;
                xmlhttp.send();
            }
            function hello()
            {
                if(xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    document.getElementById("subc_name").innerHTML = xmlhttp.responseText;
                }
            }
        </script>
<%@include file='seller_header.jsp' %>
        <!-- //banner -->
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">

        <form role="form" enctype="multipart/form-data"  action="./add_product_action" method="post">
           <div class="form-group">
                            <label for="p_name" class="col-md-2">Product Name</label>
                            <div class="col-md-10">
                            <input type="text" placeholder="Enter Product Name"  class="form-control" name="p_name" id="p_name"/>
                            </div>
                        </div>
            <br>
            <br>
             <br>
            <div class="form-group">
                <label for="desc" class="col-md-2">Description</label>
                <div class="col-md-10">
                    <input type="text" placeholder="Enter Description" class="form-control" name="desc" id="desc"/>
                </div>
            </div>
            <br>
             <br>
                <div class="form-group">
                <label for="image" class="col-md-2">Photo</label>
                <div class="col-md-10">
                    <input type="file" placeholder="Enter Photo" class="form-control" name="image" id="image"/>
            </div>
                </div> 
              <br>
               <br>
             <div class="form-group">
                            <label for="mrp" class="col-md-2">Price</label>
                            <div class="col-md-10">
                            <input type="text" placeholder="Enter Price"  class="form-control" name="mrp" id="mrp"/>
                            </div>
                        </div>
                <br>
                 <br>
             <div class="form-group">
                            <label for="offer_price" class="col-md-2">Offer Price</label>
                            <div class="col-md-10">
                            <input type="text" placeholder="Enter Offer Price"  class="form-control" name="offer_price" id="offer_price"/>
                            </div>
                        </div>
       <br><br>
                       <div class="form-group">
                            <label for="c_name" class="col-md-2">Category </label>
                            <div class="col-md-10">
                                <select required class="form-control" id="c_name" name="c_name" onchange="go()">
                                    <option value="0" >----Select----</option>
                                    <%
                                        try
                                        {
                                           Class.forName("com.mysql.jdbc.Driver");
                                           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                                           Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                           ResultSet rs = stmt.executeQuery("select c_name from category");
                                           while(rs.next())
                                           {
                                               String c_name= rs.getString("c_name");
                                               %>
                                               <option><%=c_name%> </option>
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
                                <br>
                                <br>
                                <div class="form-group" >
                                    <label class="col-md-2"> Sub Category</label>
                                    <div class="col-md-10">
                                    <select name="subc_name" id="subc_name" class="form-control">
                                    <option disabled >----Select----</option>
                                    </select>
                                    </div>
                                </div>
                                    <br>
                                    <br>
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