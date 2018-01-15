
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" >
    </head>
    <body>
        <%
            String search = request.getParameter("search");
            %>
        <div class="container">
            <h3>Search results for <%=search%></h3>
            <div class="row">
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs = stmt.executeQuery("select * from product where p_name like '%" + search + "%'");
                    while (rs.next()) {
                        int p_id = rs.getInt("p_id");
                        String p_name = rs.getString("p_name");
                        String desc = rs.getString("desc");
                        String image = rs.getString("image");
                        String cat_name = rs.getString("cat_name");
                        String sub_cat_name = rs.getString("sub_cat_name");
                        String mrp = rs.getString("mrp");
                        String offer_price = rs.getString("offer_price");

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
                                        <td><%=sub_cat_name%></td>
                                    </tr>
                                    <tr>
                                        <td>MRP</td>
                                        <td><%=mrp%></td>
                                    </tr>
                                    <tr>
                                        <td>Offered Price</td>
                                        <td><%=offer_price%></td>
                                    </tr>
                                </table>
                            </div>

                        </div>
                    </div>
                </a>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
