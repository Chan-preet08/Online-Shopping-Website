<%@page import="pack1.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%
    String p_id = request.getParameter("p_id");
    ArrayList<CartItem> al = (ArrayList<CartItem>) (session.getAttribute("al"));
             
             int pos=-1;
             
             for(int i=0;i<al.size();i++)
             {
                 CartItem obj=al.get(i);
                 if(obj.p_id.equalsIgnoreCase(p_id))
                 {
                     pos=i;
                     break;
                 }
             }
             
             if(pos!=-1)
             {
                al.remove(pos);
             }
             else
             {
                 out.println("item not found");
             }
   
%>
     
 