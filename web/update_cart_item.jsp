<%@page import="pack1.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
    String p_id = request.getParameter("p_id");
    String Qty = request.getParameter("qty");
    
    ArrayList<CartItem> al = (ArrayList<CartItem>) (session.getAttribute("al"));
    int m;
          for(int i=0;i<al.size();i++)
             {
                 CartItem obj=al.get(i);
    
                 if(obj.p_id.equalsIgnoreCase(p_id))
                 {
                     m=Integer.parseInt(Qty)*(Integer.parseInt(obj.offer_price));

                     al.get(i).Qty=Integer.parseInt(Qty);

                     %>
                     <%=m%>
                     
                     <%
                 }
             }
%>
