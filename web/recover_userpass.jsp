<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file='public_header.jsp' %>

        <!-- //banner -->
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
                    <div class="container-fluid col-md-12 "> 
                        <form role="form"  action="recover_user.jsp" method="post">
                            <div class="form-group">
                                <label for="email" class="col-md-2">Email</label>
                                <div class="col-md-10">
                                    <input type="text" placeholder="Enter Email"  class="form-control" name="email" id="email">
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="col-lg-offset-2 col-lg-10">
                                <button type="submit" class="btn btn-yellow">RECOVER</button>
                            </div>
                        </form>
                    </div>
                    <%               String m = request.getParameter("msg");
               if (m != null) {%>
                    <h3><%= m%></h3>
                    <% }
                    %>
                </div>
            </div>
        </div>
        <%@include file='footer.html' %> 
    </body>
</html>
