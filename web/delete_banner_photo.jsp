<%@page import="java.sql.*"%>
<%
String ban_id=request.getParameter("ban_id");


 Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from banner where ban_id="+ban_id+"");
            
            if(rs.next())
            {
              rs.deleteRow();
            }
            
            
                        Statement stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                        ResultSet rs1 = stmt1.executeQuery("select * from banner");


        %>
        
        
        
        <table>
                    <tr>
                        <%   while ((rs1.next())) 
                             {
                                 ban_id=rs1.getString("ban_id");
                                String photo = rs1.getString("photo");
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