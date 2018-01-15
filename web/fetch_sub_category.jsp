<%@page import="java.sql.*"%>
<%
    String cat=request.getParameter("cat");
Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select subc_name from sub_category where c_name='"+cat+"'");
            while(rs.next())
            {
             String subc_name = rs.getString("subc_name");
             
             %>
             <option><%=subc_name%></option>
             <%
             }
            
%>