
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%@include file='seller_header.jsp' %>
        <!-- //banner -->
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
        <form role="form"  action="check_seller_login.jsp" method="post">
           <div class="form-group">
                            <label for="tbemail" class="col-md-2">Email</label>
                            <div class="col-md-10">
                                <input type="text" placeholder="Enter Email" required  class="form-control" name="tbemail" id="tbemail">
                            </div>
                        </div>
            <br>
            <br>
          <div class="form-group">
              <label for="tbpass" class="col-md-2">Password</label>
              <div class="col-md-10">
                  <input type="password" placeholder="Enter Password" required class="form-control" name="tbpass" id="tbpass">
              </div>
          </div>
            <br>
            <br>
                 <div class="col-lg-offset-2 col-lg-10">
                     <button type="submit" class="btn btn-yellow">Login</button>
                 </div>
        </form>
        
        <% 
            String m= request.getParameter("msg");
            if(m!=null)
            {%>
        <h3><%= m %></h3>
           <% }
        %>
        <a href="recover_sellerpass.jsp">Forgot Password?</a>
        </div>
            </div>
        </div>
        <%@include file='footer.html' %> 
    </body>
</html>
