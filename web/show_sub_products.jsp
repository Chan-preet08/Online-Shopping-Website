<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("user_login.jsp?msg=Please Login To Perform This Action");
    } else {

%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .filter_bar
            {
                background-color: whitesmoke;
                height: 100vh;
            }


        </style>
        <script>
            var minvalue, maxvalue;

            $(function ()
            {
                $("#bt1").click(function ()
                {
                    $("#slider-range").slider({values: [0, 500]});
                });
                $("#slider-range").slider(
                        {
                            range: true,
                            min: 0,
                            max: 5000,
                            values: [500, 1500],

                            slide: function (event, ui)
                            {
                                minvalue = ui.values[ 0 ];
                                maxvalue = ui.values[ 1 ];

                                $("#amount").val(minvalue + " - " + maxvalue);

                            }
                        });
                //to show initial value
                $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );
            });
            function go()
            {
                alert(minvalue + " -- " + maxvalue);
            }

        </script>
        <script>
            var xmlhttp = new XMLHttpRequest();
            function func()
            {

                maxvalue;

                var item = document.getElementById("occasion").value;
                var protype = document.getElementById("protype").value;


                var loc = window.location.href;
                var loc2 = loc.substring(0, loc.indexOf("&"));

                loc2 = loc2 + "&max_price=" + maxvalue + "&min_price=" + minvalue;


                alert(loc2);


                window.location.href = loc2;
            }
        </script>

    </head>
    <body>
        <%@include file='public_header.jsp' %>

        <!-- //banner -->
        <div class="container-fluid all-div" id="div11">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
        <%
            String subc_name = request.getParameter("subc_name");
            String min = request.getParameter("min_price");
            String max = request.getParameter("max_price");
            String dis = request.getParameter("dis");

            if (subc_name == null) {
                response.sendRedirect("user_home.jsp");
            }
            String c_name = request.getParameter("c_name");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            String sqlstatement = "select * from product where sub_cat_name=\'" + subc_name + "\'";

            String cond2;
            String cond3;

            if (max == null) {
                cond2 = "";
            } else {
                cond2 = " and mrp>=" + min;
            }
            if (min == null) {
                cond3 = "";
            } else {
                cond3 = " and mrp<=" + max;
            }

            ResultSet rs = stmt.executeQuery(sqlstatement + cond2 + cond3);

            System.out.println(subc_name);
        %>
       
        <h2 class="text-center">Products under <%=c_name%>  <%=subc_name%></h2>

        
           
       
                <%
                    while (rs.next()) {
                        String p_name = rs.getString("p_name");
                        String image = rs.getString("image");
                        int p_id = rs.getInt("p_id");
                        String mrp = rs.getString("mrp");
                        String offer_price = rs.getString("offer_price");
                        System.out.println(image);
                %>
                <div class="col-sm-4">
                    <a href="show_single_product.jsp?p_id=<%=p_id%>" id="cake_link">
                        <div class="cakes">
                            <img src="<%=image%>" class="img img-responsive img-thumbnail">
                            <h4><%=p_name%></h4>
                            <%
                                if (mrp == offer_price) {
                            %>
                            <p><%=mrp%></p>
                            <%
                            } else {
                            %>
                            <p><del><%=mrp%> INR</p>
                            <p><%=offer_price%> INR</p>
                            <%
                                }
                            %>
                        </div>
                    </a>
                </div>
                <%            }
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