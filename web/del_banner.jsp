<%
    String email2 = (String) session.getAttribute("email2");
    if (email2 == null) {
        response.sendRedirect("admin_login.jsp?msg=Please Login To Perform This Action");
    } else {

%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Banners</title>
    </head>
    <script>
         function del(ban_id)
            {
                var ban_id = ban_id;
                var a = confirm("Are You Sure you want to Delete!");

                if (a) {
                    var xml;

                    xml = new XMLHttpRequest();
                    xml.onreadystatechange = function ()
                    {
                        if (xml.readyState == 4 && xml.status == 200) {
                            document.getElementById('div11').innerHTML = xml.responseText;
                        }

                    };
                    xml.open("get", "delete_banner_photo.jsp?ban_id=" + ban_id , true);
                    xml.send();
                }

            }
        </script>
    <body>
        <%@include file='admin_header.jsp' %>

        <!-- //banner -->
        <div class="container-fluid all-div" id="div11">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
                 
                <%
                    String photo="",ban_id="";
                     Class.forName("com.mysql.jdbc.Driver");
                     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                    Statement stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs1 = stmt1.executeQuery("select * from banner");

                %>
                <table>
                    <tr>
                        <%   while ((rs1.next())) 
                             {
                                 ban_id=rs1.getString("ban_id");
                                photo = rs1.getString("photo");
                        %>
                        <td>
                            <div><img src="<%=photo%>" style="width: 100px; height: 100px;" /></div>
                            <input type="button" value="X" onclick="del(<%=ban_id %>)" />
                        </td>    
                        <%
                            }
                        %>
                    </tr>
                </table>
             </div>
            </div>
        </div>
        <%@include file='footer.html' %>            
    </body>
</html>
<%
    }
%>