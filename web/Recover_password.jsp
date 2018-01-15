
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file='admin_header.jsp' %>
        <!-- //banner -->
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
        <form role="form"  action="recover.jsp" method="Post">
           <div class="form-group">
                            <label for="tbuname" class="col-md-2">Username</label>
                            <div class="col-md-10">
                            <input type="text" placeholder="Enter username"  class="form-control" name="tbuname" id="tbuname">
                            </div>
                        </div>
            <br>
            <br>
            <div class="col-lg-offset-2 col-lg-10">
                     <button type="submit" class="btn btn-primary">RECOVER</button>
                 </div>
        </form>
         
           <% 
            String m= request.getParameter("msg");
            if(m!=null)
            {%>
        <h3 style="color: green"><%= m %></h3>
           <% }
        %>
         </div>
            </div>
        </div>
        <%@include file='footer.html' %> 
    </body>
</html>
