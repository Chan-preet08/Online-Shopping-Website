<%@page import="pack1.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%
    String p_id = request.getParameter("p_id");
    ArrayList<CartItem> al = (ArrayList<CartItem>) (session.getAttribute("al"));
    if(al==null)
    {
        al=new ArrayList<>();
        session.setAttribute("al", al);        
    }
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from product where p_id='" + p_id + "'");
    
    if (rs.next()) 
    {
        String p_name = rs.getString("p_name");
        String desc = rs.getString("desc");
        String image = rs.getString("image");
        String mrp = rs.getString("mrp");
        String offer_price = rs.getString("offer_price");
    
        al.add(new CartItem(p_id, p_name, mrp, offer_price,1,desc, image));
        session.setAttribute("al", al);
    }
%>
     
    
    <div class="btn btn-success btn-lg" style="float: right">
      <a href="view_cart.jsp" style="color: whitesmoke;"> View Cart</a>
    </div>