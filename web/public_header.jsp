<%@page import="java.sql.*"%>
<%@page import="pack1.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="header_files.html" %>

<!-- banner -->
<div class="banner-figures">
    <div class="banner1">
        <div class="container banner-drop">
            <div class="header header1">
                <div class="header-left">
                    <ul>
                        <li class="animated wow fadeInLeftBig" data-wow-duration="1200ms" data-wow-delay="800ms"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 345/2 Ajit Nagar Amritsar</li>
                        <li class="animated wow fadeInLeftBig" data-wow-duration="1200ms" data-wow-delay="900ms"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> +919780199319</li>
                        <li class="animated wow fadeInLeftBig" data-wow-duration="1200ms" data-wow-delay="1000ms"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> <a href="mailto:preet.kaur438@gmail.com">preet.kaur438@gmail.com</a></li>
                        <li class="animated wow fadeInLeftBig" data-wow-duration="1200ms" data-wow-delay="1010ms"><a href="#">
                                <span class="glyphicon glyphicon-shopping-cart" data-toggle="collapse" data-target="#demo"></span>
                                <%
                                    int n = 0;
                                    ArrayList<CartItem> altemp = (ArrayList<CartItem>) (session.getAttribute("al"));

                                    if (altemp != null) {
                                        n = altemp.size();
                                    }
                                %>

                                <span id="cartitemcount"  class="badge"><%= n%></span>
                            </a></li>   

                    </ul>
                    <div class="animated wow bounceInDown" data-wow-duration="1000ms" data-wow-delay="800ms">
                        <form class="navbar-form" role="search" action="search_products.jsp" id="navBarSearchForm">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search..." name="search" id="search" onchange="search(this.value)">
                                <div class="input-group-btn">
                                    <button class="btn btn-yellow" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="header-right header-right1">
                    <%@include file="menu.jsp" %>	
                    <div class="menu-icon animated wow zoomIn" data-wow-duration="1000ms" data-wow-delay="800ms"><span></span></div>
                </div>
                <div class="clearfix"> </div>
            </div>

            <div class="logo animated wow bounceInDown" data-wow-duration="1000ms" data-wow-delay="500ms">
                <h1><a href="index.jsp">Shopaholics</a></h1>
            </div>
            <div  class="category-menu social-icons animated wow bounceInDown" data-wow-duration="1000ms" data-wow-delay="800ms">
                <ul>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                        Statement stmt11 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs11 = stmt11.executeQuery("select c_name from category");
                        while (rs11.next()) {
                            String c_name1 = rs11.getString("c_name");
                            //System.out.println("home:"+ c_name1);
%>
<li class="dropdown"><a href="#" data-toggle="dropdown"><b><%=c_name1%></b> <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <%
                                Statement stmt22 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs22 = stmt22.executeQuery("select subc_name from sub_category where c_name='" + c_name1 + "'");
                                while (rs22.next()) {
                                    String sub_c_name1 = rs22.getString("subc_name");
                                    // System.out.println("home:"+sub_c_name1);
%>
                            <li><a href="show_sub_products.jsp?subc_name=<%=sub_c_name1%>&c_name=<%=c_name1%>"><%=sub_c_name1%></a></li>
                                <%
                                    }
                                %>

                        </ul>
                    </li>
                    <%
                        }
                    %>


                </ul>
            </div>
        </div>
    </div>
    <script>
        (function ($) {
            $(".menu-icon").on("click", function () {
                $(this).toggleClass("open");
                $(".container").toggleClass("nav-open");
                $("nav ul li").toggleClass("animate");
            });

        })(jQuery);
    </script>
</div>
<div class="col-md-6 collapse cartstyle" id="demo">
    <table class="table table-responsive">
        <%
            ArrayList<CartItem> al = (ArrayList<CartItem>) (session.getAttribute("al"));
            if (al == null) {

        %>
        <h4>Your Cart is Empty</h4>
        <%                        } else {

            al = (ArrayList<CartItem>) (session.getAttribute("al"));

            for (int i = 0; i < al.size(); i++) {
                CartItem obj = al.get(i);
        %>
        <tr>
            <td><img src="<%=obj.photo%>" height="50px" width="50px"></td>   
            <td style="text-align: right"><%=obj.p_name%></td>
            <td style="text-align: right"><%=obj.desc%></td>
            <td style="text-align: right; text-decoration: line-through"><%=obj.mrp%></td>
            <td style="text-align: right"><%=obj.offer_price%></td>
        </tr>
        <%
                }
            }
        %>
        <tr>
            <td></td>
            <td><div class="btn btn-yellow btn-lg" id="checkout" style="float: right" onclick="go()">Checkout</div></td>
        </tr>
    </table>
</div>
