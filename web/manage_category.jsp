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
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file='admin_header.jsp' %>
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
                
          <table class="table table-responsive table-bordered table-hover ">  
                <tr>
                    <td><b> Category Name</b></td>
                    <td><b> Description </b></td>
                    <td><b>Icon</b></td>
            </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from category");
                while (rs.next()) {
                    String c_name = rs.getString("c_name");
                    String description = rs.getString("description");
                    String icon = rs.getString("icon");
        %>
              
            <tr>
                <td>
                    <%=c_name%>
                </td>
                <td>                               <%=description%>
                </td>
                <td>                               <%=icon%>
                </td>
                <td><a href="editcategory.jsp?c_name=<%=c_name%>"> Edit</a></td>
                <td><a href="delcategory.jsp?c_name=<%=c_name%>"> Delete</a></td>
            </tr>
      
        <%
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        %>
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