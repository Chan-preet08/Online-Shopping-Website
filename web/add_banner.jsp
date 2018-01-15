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
        
        <script>
            var xmlhttp = new XMLHttpRequest();

            function myFunction(value) {

                var x;
                if (value == "a")
                {
                    document.getElementById("d1").style.display = "block";
                    document.getElementById("d2").style.display = "none";
                    document.getElementById("d3").style.display = "none";

                } else if (value == "b")
                {
                    document.getElementById("d1").style.display = "none";
                    document.getElementById("d2").style.display = "block";
                    document.getElementById("d3").style.display = "none";

                } else if (value == "c")
                {
                    document.getElementById("d1").style.display = "block";
                    document.getElementById("d2").style.display = "block";
                    document.getElementById("d3").style.display = "none";
                } else
                {
                    document.getElementById("d1").style.display = "none";
                    document.getElementById("d2").style.display = "none";
                    document.getElementById("d3").style.display = "block";

                }

            }

            function fetchcategory()
            {
                var category = document.getElementById('c_name').value;
                xmlhttp.open("get", "fetch_sub_category.jsp?cat=" + category, true);
                xmlhttp.onreadystatechange = hello;
                xmlhttp.send();
            }
            function hello()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    document.getElementById("subc_name").innerHTML = xmlhttp.responseText;
                }
            }
        </script>
<%@include file='admin_header.jsp' %>

        <!-- //banner -->
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
                    
        <form role="form" enctype="multipart/form-data"  action="./add_banner_action" method="post">
                <div class="form-group">
                    <label for="photo" class="col-md-2">Photo</label>
                    <div class="col-md-10">
                        <input type="file" placeholder="Enter Photo" class="form-control" name="photo" id="photo"/>
                    </div>
                </div> 
                <br>
                <br>
                <div class="form-group">
                    <label for="c_name" class="col-md-2">Category </label>
                    <div class="col-md-10">
                        <select required class="form-control" id="c_name" name="c_name" onchange="fetchcategory()">
                            <option value="0" >----Select----</option>
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                                    Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                    ResultSet rs = stmt.executeQuery("select c_name from category");
                                    while (rs.next()) {
                                        String c_name = rs.getString("c_name");
                            %>
                            <option><%=c_name%> </option>
                            <%
                                    }
                                } catch (Exception ex) {
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
                <label for="g1"><input  type="radio" id="g1" name="rb1" onclick="myFunction(this.value)" value="a" />     minimum price wise offers</label><br>
                        <label for="g2"><input  type="radio" id="g2" name="rb1"onclick="myFunction(this.value)" value="b" />     maximum price wise offers</label><br>
                        <label for="g3"><input  type="radio" id="g3" name="rb1"onclick="myFunction(this.value)" value="c" />   minimum and maximum price wise offers</label><br>
                        <label for="g4"><input type="radio" id="g4" name="rb1"onclick="myFunction(this.value)" value="d"/>     discount wise offers</label><br>
                        <div id="d1" style="display: none"> <label>enter minimum price</label>
                            <input type="text" name="min_price" class="form-control"><br>
                        </div>
                        <div id="d2" style="display: none"> <label>enter maximum price</label>
                            <input type="text" name="max_price" class="form-control"><br>
                        </div>  
                        <div id="d3" style="display: none"> <label>enter discount</label>
                            <input type="text" name="min_discount" class="form-control"><br>
                        </div>
                <br>
                <br>
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="submit" class="btn btn-yellow" value="Add"/>
                </div>
            </form>
                    
                        <%
            String m = request.getParameter("msg");
            if (m != null) {
                if (m.contains("already")) {
        %>
        <h3 style="color: red; text-align: center"><%= m%></h3>
        <% } else {
        %>
        <h3 style="color: green; text-align: center"><%= m%></h3>
        <%

                }
            }
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