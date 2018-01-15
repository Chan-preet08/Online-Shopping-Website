<%@page import="pack1.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file='public_header.jsp' %>

        <!-- //banner -->
        <div class="container-fluid all-div" id="div11">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
        <div class="container" style="margin-top: 3%">
            <h1>Thank you for Shopping with us</h1>
            <br><br>
            <a href="index.jsp"><div class="btn btn-lg btn-yellow">Continue Shopping</div></a>
        </div>
 </div>
            </div>
        </div>
        <%@include file='footer.html' %> 
    </body>
</html>
