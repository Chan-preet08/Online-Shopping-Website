<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
               
        <script>
            $(document).ready(function ()
            {
                //If u want to change Interval of corousal
                $('.carousel').carousel({
                    interval: 3000
                });
            });  
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div id="all" class="container-fluid">
            <div id="myCarousel" class="carousel slide" data-ride="carousel" >
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                        Statement stmt32 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs32 = stmt32.executeQuery("select * from banner");

                        int pos1 = 0;

                        while (rs32.next()) {

                            String applyclass;

                            if (pos1 == 0) {
                                applyclass = "data-slide-to=\"0\" class=\"active\"";
                            } else {
                                applyclass = "data-slide-to=\"" + pos1 + "\"";
                            }

                            pos1++;
                    %>
                    <li data-target="#myCarousel" <%= applyclass%>></li>
                    <%
                        }
                    %>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <%
                        Statement stmt33 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs33 = stmt33.executeQuery("select * from banner");
                        int pos2 = 0;
                        while (rs33.next()) {
                            String photo = rs33.getString("photo");
                            String c_name = rs33.getString("c_name");
                            String subc_name = rs33.getString("subc_name");
                            String min_price = rs33.getString("min_price");
                            String max_price = rs33.getString("max_price");
                            String dis = rs33.getString("dis");
                            String applyclass;
                            if (pos2 == 0) {
                                applyclass = "class=\"item active\"";
                            } else {
                                applyclass = "class=\"item\"";
                            }
                            pos2++;
                    %>
                    <div <%= applyclass%> >
                        <a href="show_sub_products.jsp?subc_name=<%=subc_name%>&c_name=<%=c_name%>&max_price=<%=max_price%>&min_price=<%=min_price%>&dis=<%=dis%>>"><img src="<%=photo%>" alt="<%=c_name%>" /></a>
                    </div>
                    <%
                        }
                    %>
                </div>
                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </body>
</html>
