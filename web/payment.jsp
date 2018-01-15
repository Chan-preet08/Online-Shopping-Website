<%-- 
    Document   : payment
    Created on : May 12, 2017, 5:35:09 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
   
        <h1>VMM Payment Gateway Demo</h1>
        <%@page import="pack1.*" %>
        <%@page import="java.util.*" %>
        
        <%
            String amount="50000";
           
            //Fetch Amount from paramater(for mobile only)
            String amt=request.getParameter("amount");
            if(amt!=null)
            {
                amount = amt;
            }
            
            //recalculate and update amount (for web)
            ArrayList<CartItem> al = (ArrayList<CartItem>) (session.getAttribute("al"));
                         
            if(al!=null)
            {
                              Double net_amt = 0.0;                              
 al = (ArrayList<CartItem>) (session.getAttribute("al"));
                            for (int i = 0; i < al.size(); i++)
                            {
                                CartItem obj = al.get(i);
                               
                                String offer_price = obj.offer_price;
                                int Qty = obj.Qty;
                             
                                Double tot_price = Qty*Double.parseDouble(offer_price);
                                net_amt = net_amt + tot_price;
                            }
            
                amount = (net_amt*100)+"";
            }

        %>
        
        <form action="success.jsp" method="post">
           
           
           
<!-- Note that the amount is in paise = 500 INR -->
<!-- This script will show payment screen and block form submit until, payment is successful -->
<script
    src="https://checkout.razorpay.com/v1/checkout.js"
    data-key="rzp_test_96HeaVmgRvbrfT"
    data-amount="<%= amount %>"
    data-buttontext="Pay Now"
    data-name="My Gift Shop"
    data-description="Thank You for Shopping."
    data-image="http://vmmeducation.com/images/newlogo.png"
    data-prefill.name="Amrinder Singh"
    data-prefill.email="amrinder@vmmeducation.com"
    data-theme.color="#2B3F54"
></script>
<input type="hidden" value="Hidden Element" name="hidden">


</form>
        
        
    </body>
</html>
