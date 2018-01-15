<%@page import="java.sql.*"%>
<%@page import="pack1.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="bootfiles.jsp" />

<script>
    function go()
    {
        window.location.href = "view_cart.jsp";
    }
</script>
<style>
    #navBarSearchForm input[type=text]{width:700px !important;}

    .inner{
        text-align:center;
    }
</style>


<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>

            <a class="navbar-brand"href="user_home.jsp" >
                <span class="text-primary">Online Gift Shop</span>
            </a>
        </div>


        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="user_signup.jsp"><span class="glyphicon glyphicon-user">SignUp</span></a></li>   
                <li><a href="user_login.jsp"><span class="glyphicon glyphicon-log-in">Login</span></a></li>
                <li><a href="myorders.jsp">My Orders</a></li>
                <li><a href="#">
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
            <div class="col-sm-12 col-md-12 inner">
                <form class="navbar-form" role="search" action="search_products.jsp" id="navBarSearchForm">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search..." name="search" id="search" onchange="search(this.value)">
                        <div class="input-group-btn">
                            <button class="btn btn-primary" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>

            <ul class="nav navbar-nav">
                <li class="active"><a href="user_home.jsp"><span class="glyphicon glyphicon-home"></span>Home</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">All Products <span class="caret"></span></a>
                    <ul class="dropdown-menu ">
                        <div class="row" style="width: 400px;padding: 10px">
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                                Statement stmt11 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs11 = stmt11.executeQuery("select c_name from category");
                                while (rs11.next()) {
                                    String c_name = rs11.getString("c_name");
                                    //System.out.println("home:"+ c_name);
                            %>
                            <div class="col-md-3">
                                <label><a href="#"><%=c_name%></a></label>
                                    <%
                                        Statement stmt22 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                        ResultSet rs22 = stmt22.executeQuery("select subc_name from sub_category where c_name='" + c_name + "'");
                                        while (rs22.next()) {
                                            String sub_c_name = rs22.getString("subc_name");
                                            // System.out.println("home:"+sub_c_name);
                                    %>
                                <li><a href="show_sub_products.jsp?subc_name=<%=sub_c_name%>&c_name=<%=c_name%>"> <%=sub_c_name%></a></li>
                                    <%
                                        }
                                    %>

                            </div>
                            <%                      }
                            %>
                        </div>
                    </ul>
                </li>
            </ul>

        </div>



    </div>
</nav>

<div class="col-md-6 collapse" style="position: absolute; z-index: 5; left: 80%; top: 10%; width: 20%; background-color: whitesmoke" id="demo">
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
            <td><div class="btn btn-primary btn-lg" id="checkout" style="float: right" onclick="go()">Checkout</div></td>
        </tr>
    </table>
</div>


