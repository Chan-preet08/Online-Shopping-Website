
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

             
        <link rel="stylesheet" href="/resources/demos/style.css">

 
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
                //$( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );
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
        <%
            String subc_name = request.getParameter("subc_name");
            String min = request.getParameter("min_price");
            String max = request.getParameter("max_price");
            String dis = request.getParameter("dis");

            if (subc_name == null) {
               // response.sendRedirect("user_home.jsp");
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
        
        <h2>Products under <%=c_name%>  <%=subc_name%></h2>
        <div class="row">
                <div class="col-md-2 filter_bar">
                <!--filters added here--->
                <h4 class="text-center">Filters</h4>
                <p>
                <div class="row">
                    <div class="col-xs-6">
                        <label for="slider-range">Price range:</label>
                    </div>
                    <div class="col-xs-6">
                        <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
                    </div>
                </div>
                </p>
                <div class="row">
                    <div id="slider-range" class="margin"></div>
                </div>
                <!--                <div class="row margin" >
                                    <div class="col-xs-6">
                                        <input  type="button" value="RESET VALUES" id="bt1"/>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="button" value="Show" onclick="go()" />
                                    </div>
                                </div>-->


                <div class="margin">
                    <label for='discount_range'>Discount percentage</label>
                </div>
                <div id="slider" class="margin">
                    <div id="custom-handle" class="ui-slider-handle"></div>
                </div>
                <div class="btn btn-sm btn-primary" style="margin-left: 40%" onclick="filter('<%=subc_name%>')">OK</div>
            </div>            <div class="col-md-10">

                <div class="row">

                    <%
                        while (rs.next()) {
                            String p_name = rs.getString("p_name");
                            String image = rs.getString("image");
                            int p_id = rs.getInt("p_id");
                            String mrp = rs.getString("mrp");
                            String offer_price = rs.getString("offer_price");
                            System.out.println(image);
                    %>
                    <a href="show_single_product.jsp?p_id=<%=p_id%>">
                        <div class="col-xs-3">
                            <div class="thumbnail">
                                <img src="<%=image%>">
                                <div class='caption'>
                                    <label class="text-center"><%=p_name%></label>
                                    <table class='table'>
                                        <tr>
                                            <td>Type</td>
                                            <td><%=subc_name%></td>
                                        </tr>
                                        <tr>
                                            <td>MRP</td>
                                            <%
                                                if (mrp == offer_price) {
                                            %>
                                            <td><%=mrp%></td>
                                            <%
                                            } else {
                                            %>
                                            <td><span style="text-decoration: line-through"><%=mrp%></span> <span><%=offer_price%></span></td>
                                            <%
                                                }
                                            %>
                                        </tr
                                    </table>
                                </div>

                            </div>
                        </div>
                    </a>
                    <%            }
                    %>
                </div>
            </div>

        </div>

                    <%@include file="footer.html" %>    </body>
</html>
