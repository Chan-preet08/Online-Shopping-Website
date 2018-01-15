<%
    String email1 = (String) session.getAttribute("email1");
    if (email1 == null) {
        response.sendRedirect("seller_login.jsp?msg=Please Login To Perform This Action");
    } else {

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function go()
            {
                var pass = document.getElementById("pass").value;
                var a = document.getElementById("t1").value;
                var b = document.getElementById("t2").value;
                if (a != b)
                {
                    alert("please confirm your new password");
                    return false;
                } else
                {
                    return true;
                }

            }

        </script>
    </head>
    <body>
        <%@include file='seller_header.jsp' %>
        <!-- //banner -->
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
                    <form role="form"  action="change_seller_pass2.jsp" method="post">
                        <div class="form-group">
                            <label for="opass" class="col-md-2">Enter Old Password</label>
                            <div class="col-md-10">
                                <input type="password" required  class="form-control" name="old" id="opass">
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="form-group">
                            <label for="npass" class="col-md-2">Enter new Password</label>
                            <div class="col-md-10">
                                <input type="password" required class="form-control" name="new" id="npass">
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="form-group">
                            <label for="cpass" class="col-md-2">Confirm Password</label>
                            <div class="col-md-10">
                                <input type="password" required class="form-control" id="cpass">
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="col-lg-offset-2 col-lg-10">
                            <button type="submit" class="btn btn-yellow">Change Password</button>
                        </div>
                    </form>
 <%
            String msg = request.getParameter("msg");
            if(msg!=null)
            {
             %>
                         <label style="color: green"><%= msg %></label>
             <%
            }
   
            %>
                </div>
            </div>
        </div>
        <%@include file='footer.html' %>
    </body>
</html>
<%}%>