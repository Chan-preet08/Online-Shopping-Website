<%@page import="pack1.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Payment Successful !!!</h1>
       <!--//sms send to both user and merchant and db entry-->
            <%
                String email = (String) session.getAttribute("email");
                //email="preet.kaur438@gmail.com";
                
                String net_amt = session.getAttribute("net_amt").toString();
                String vat = session.getAttribute("vat").toString();
                String taxes = session.getAttribute("taxes").toString();
                String delivery_charges = session.getAttribute("delivery_charges").toString();
                String net_amt_payable = session.getAttribute("net_amt_payable").toString();
                
                String address= (String)(session.getAttribute("address"));
                
                
                java.util.Date d = new java.util.Date();
                Date today = new Date(d.getTime());
                String booking_date = today.toString();
                //String delivery_date = session.getAttribute("delivery_date").toString();
                String delivery_date=booking_date;
                
                //String address_id = session.getAttribute("add_id").toString();
                //int add_id = 0;
                
                // if (address_id != null) {
                //     add_id = Integer.parseInt(address_id);
                //}
                
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from orders");
                
                rs.moveToInsertRow();
                rs.updateString("order_amt", net_amt);
                rs.updateString("taxes", taxes);
                rs.updateString("vat", vat);
                rs.updateString("delivery_charges", delivery_charges);
                rs.updateString("net_amt", net_amt_payable);
                rs.updateString("delivery_date", delivery_date);
                rs.updateString("booking_date", booking_date);
                rs.updateString("address_detail",address);
                
                //rs.updateInt("address_id", add_id);
                rs.updateString("user_email", email);
                rs.insertRow();
                
                Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs1 = stmt1.executeQuery("select max(order_id) as order_id from orders");
                
                int order_id = 0;
                if (rs1.next()) {
                    order_id = rs1.getInt("order_id");
                }
                
                
                
                
                Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs2 = stmt2.executeQuery("select * from order_details");

                ArrayList<CartItem> al = (ArrayList<CartItem>) 
                        session.getAttribute("al");
                for (int i = 0; i < al.size(); i++) {
                    CartItem obj = al.get(i);
                    String p_id = obj.p_id;
                    int product_id = 0;
                    if (p_id != null) {
                        product_id = Integer.parseInt(p_id);
                    }
                    String p_name = obj.p_name;
                    String offer_price = obj.offer_price;
                    String qty = obj.Qty+"";
                    String photo = obj.photo;
                    rs2.moveToInsertRow();
                    rs2.updateInt("order_id", order_id);
                    rs2.updateInt("p_id", product_id);
                    rs2.updateString("product_name", p_name);
                    rs2.updateString("offer_price", offer_price);
                    rs2.updateString("qty", qty);
                    rs2.updateString("photo", photo);
                    rs2.insertRow();
                }
                
                //SMS LOGIC HERE
                pack1.SMSsender sender=new pack1.SMSsender("7986833547", "Thank You for Shopping Your Orrder no is "+order_id+" and NET amount is "+net_amt_payable, "text");
                Thread t=new Thread(sender);
                t.start();
                
                //now remove from session
                session.removeAttribute("al");
                session.removeAttribute("net_amt");
                session.removeAttribute("taxes");
                session.removeAttribute("vat");
                session.removeAttribute("delivery_date");
                session.removeAttribute("net_amt_payable");
                session.removeAttribute("add_id");
                
                response.sendRedirect("final.jsp");
            %>
 
        
    </body>
</html>


           