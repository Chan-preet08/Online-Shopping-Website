<%@page import="java.sql.*"%>
<%
int sno1=Integer.parseInt(request.getParameter("s_no"));
int pid=Integer.parseInt(request.getParameter("p_id"));


 Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from product_gallery where s_no='"+sno1+"'");
            
            if(rs.next())
            {
              rs.deleteRow();
            }
            
            
                        Statement stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                        ResultSet rs1 = stmt1.executeQuery("select * from product_gallery where p_id='"+pid+"'");


        %>
        
        
        
         <table>
              <tr>
                  <%
                        String path="",caption="";
                        int sno;
            while((rs1.next()))
            {
                path=rs1.getString("pic_path");
                caption=rs1.getString("caption");
                sno=rs1.getInt("s_no");
                %>
                <td>
                  <div><img src="<%=path%>" style="width: 100px; height: 100px;" /></div>
                  <label><%=caption%></label> <br><br>
                                   <input type="button" value="X" onclick="go6(this.id,<%=pid%>)" id="<%=sno%>"/>

                </td>    
                <%
            }
             %>
             </tr>
            </table>