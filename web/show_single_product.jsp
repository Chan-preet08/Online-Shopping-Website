<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("user_login.jsp?msg=Please Login To Perform This Action");
    } else {

%>
<%@page import="java.sql.*"%>
<%@page import="pack1.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
        <script>
            function make_active(i)
            {
                document.getElementById("make_active" + i).className = "item active";
            }
            
            var xmlhttp = new XMLHttpRequest();
            function addtocartfunc(p_id)
            {
                xmlhttp.open("get","add_to_cart.jsp?p_id="+p_id,true);
                xmlhttp.onreadystatechange = hello;
                xmlhttp.send();
            }
           
            function hello()
            {
                if(xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    document.getElementById("div1").innerHTML = xmlhttp.responseText;
                    window.location.reload();
                }
            }
        </script>

    </head>
    <body>
         <%@include file='public_header.jsp' %>

        <!-- //banner -->
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
         
            <%                
                String p_id = request.getParameter("p_id");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from product where p_id='" + p_id + "'");
                if (rs.next()) {
                    String p_name = rs.getString("p_name");
                    String desc = rs.getString("desc");
                    String image = rs.getString("image");
                    String cat_name = rs.getString("cat_name");
                    String sub_cat_name = rs.getString("sub_cat_name");
                    String mrp = rs.getString("mrp");
                    String offer_price = rs.getString("offer_price");

            %>
            <h2> <%=p_name%> </h2>
            <div class="row" style="border-radius: 20;border: 2; background-color: whitesmoke">
                <div class="col-md-6">
                    <div class="row">
                        <img src="<%=image%>" class="img-thumbnail img-responsive" alt="primary photo of product" />
                    </div>
                    <div class="row">
                        <div class="row" style="margin-left: 10%">
                            <label>Additional Photos of product</label>
                        </div>
                        <%
                            Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs1 = stmt1.executeQuery("select * from product_gallery where p_id='" + p_id + "'");
                            int count = 0;  //to use in carousel indexing later
                            while (rs1.next()) {

                        %>

                        <div class="col-xs-3">
                            <img src='<%=rs1.getString("pic_path")%>' class="img-responsive img-thumbnail hover-shadow cursor" data-toggle="modal" data-target="#myModal" onclick="make_active('<%=count%>')" style="height:50px"/>
                        </div>

                        <% count++;
                            }
                            rs1.beforeFirst(); //so that we can use the same result set to generate slides in lightbox
%>
                    </div>
                </div>
                <div class="col-md-6">
                    <table class="table table-responsive">
                        <tr>
                            <td><label>Name of product</label></td>
                            <td><%=p_name%></td>   
                        </tr>
                        <tr>
                            <td><label>Type of product</label></td>
                            <td><%=sub_cat_name%></td>   
                        </tr>
                        <tr>
                            <td><label>Category</label></td>
                            <td><%=cat_name%></td>   
                        </tr>
                        <tr>
                            <td><label>Description</label></td>
                            <td><%=desc%></td>   
                        </tr>
                        <tr>
                            <td><label>Price of product</label></td>
                            <td><%=mrp%></td>   
                        </tr>
                        <tr>
                            <td><label>Offered price</label></td>
                            <td><%=offer_price%></td>   
                        </tr>
                        <tr>
                            <td></td>
                            <td><div  id="div1" 
                                     style="float: right" >
                                       <input type="button"   value="Add to Cart" onclick="addtocartfunc(<%= p_id%>)" class="btn btn-yellow" /> 
                                </div></td>
                        </tr>
                    </table>
                </div>
            </div>

            <!----Light Box -------->
            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close"  data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modal Header</h4>
                        </div>
                        <div class="modal-body">

                            <!------carousel code---->
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                
                                <div class="carousel-inner" role="listbox">
                                    <%
                                        int i = 0;
                                        while (rs1.next()) {
                                    %>
                                    <div id="make_active<%=i%>" class="item ">
                                        <img src="<%=rs1.getString("pic_path")%>" alt="" width="100%" height="400px">
                                        <div class="carousel-caption">
                                            <h3><%=rs1.getString("caption")%></h3>
                                        </div>
                                    </div>
                                    <%
                                            i++;
                                        }
                                    %>
                                </div>

                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>


                            <!--------carousel code ends----->




                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-yellow" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
            <!----light box ends----->



            <%            }  //outermost if ends  ---everything on this page must be inside this
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