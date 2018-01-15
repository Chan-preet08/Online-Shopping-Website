
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet">
    </head>
    <body>
        <%@include file='public_header.jsp' %>
        <!-- //banner -->
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">

                    <div class="container-fluid col-md-12 ">
                        <form role="form" class="form-horizontal" action="./u_signup_action" method="post">
                            <div class="form-group">
                                <label for="u_name" class="col-md-2">Name</label>
                                <div class="col-md-10">

                                    <input type="text" placeholder="Enter Name" required class="form-control" name="u_name" id="u_name" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-md-2">Email </label>
                                <div class="col-md-10">
                                    <input type="email" placeholder="Enter Email" required class="form-control" name="email" id="email" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-md-2">Password</label>
                                <div class="col-md-10">
                                    <input type="password" placeholder="Enter Password" required class="form-control" name="password" id="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="cpass" class="col-md-2">Confirm Password</label>
                                <div class="col-md-10">
                                    <input type="password" placeholder="Confirm Password" required class="form-control" name="cpass" id="cpass">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="contact" class="col-md-2">Contact No. </label>

                                <div class="col-md-10">

                                    <input type="number" placeholder="Enter Contact number" required class="form-control" name="contact" id="contact" >
                                </div>
                            </div>

                            <div class="col-lg-offset-2 col-lg-10">
                                <input type="submit" class="btn btn-primary black-background white-text" value="Signup">
                            </div>
                        </form>
                    </div>
                    <%              String m = request.getParameter("msg");
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
