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

                    </ul>


                </div>
                <div class="header-right header-right1">
                    <%@include file="menu1.jsp" %>	
                    <div class="menu-icon animated wow zoomIn" data-wow-duration="1000ms" data-wow-delay="800ms"><span></span></div>
                </div>
                <div class="clearfix"> </div>
            </div>

            <div class="logo animated wow bounceInDown" data-wow-duration="1000ms" data-wow-delay="500ms">
                <h1><a href="index.jsp">Shopaholics</a></h1>
            </div>
            <div  class="category-menu social-icons animated wow bounceInDown" data-wow-duration="1000ms" data-wow-delay="800ms">
                <ul>
                    <li class="dropdown"><a href="#" data-toggle="dropdown"><b>Category</b><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="add_category.jsp">Add Category</a></li>
                            <li><a href="manage_category.jsp">View Category</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" data-toggle="dropdown"><b>Sub Category</b><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="add_subcategory.jsp">Add Sub Category</a></li>
                            <li><a href="manage_subcategory.jsp">View Sub Category</a></li>
                        </ul>
                    </li>
                    <li><a href="manage_seller.jsp"><b>Manage Seller</b></a></li>
                    <li class="dropdown"><a href="#" data-toggle="dropdown"><b>Banners</b><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="add_banner.jsp">Add Banners</a></li>
                            <li><a href="del_banner.jsp">Delete Banners</a></li>
                        </ul>
                    </li>
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
