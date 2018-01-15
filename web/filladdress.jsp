
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    
        <jsp:include page="bootfiles.jsp" />
        <%@page import="pack1.*" %>
        <%@page import="java.util.*" %>
        
        <%
            String email=(String)(session.getAttribute("email"));
            double net_amt_payable=(Double)(session.getAttribute("net_amt_payable"));
            
        %>
 
        <script>
            function go()
            {
                 //save address in session
                 var address="";
                 //alert("go called");
                 
                 var a1 = document.getElementById("h_no").value;
                 var a2 = document.getElementById("street").value;
                 var a3 = document.getElementById("city").value;
                 var a4 = document.getElementById("state").value;
                 var a5 = document.getElementById("landmark").value;
                 address=a1+"\n"+a2+"\n"+a3+"\n"+a4+"\n"+a5;
                 
                 address=encodeURIComponent(address);
                 //alert("Saving "+address);
                 
                 var xmlhttp=new XMLHttpRequest();
                 
                 xmlhttp.onreadystatechange = function ()
                 {
//                    alert(xmlhttp.responseText);
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        alert(xmlhttp.responseText);
                         //redirect to paymemt 
                         window.location.href="payment_web.jsp?amount=<%= net_amt_payable*100  %>";   
                    }
                 };
                 
                 xmlhttp.open("GET", "saveaddressinsession.jsp?address="+address, true);
                 xmlhttp.send();
                 //alert("request sent");
                 
                
            }            
        </script>
    </head>
    
    <body>
       
     
           <!-- IF USER ALREADY HAVE SAVED ADDRESS, we will prefill form later  -->
        
           <h1>Net Value of Cart  <%= net_amt_payable %></h1>
               
           
        <div class="btn btn-lg btn-primary" data-toggle="collapse" data-target="#add_new_address"><span class="glyphicon glyphicon-plus-sign"> ADD New Address</span></div>
                <div id="add_new_address" class="collapsing all-div">
                    <form class="form-vertical" action="add_new_address.jsp?email=<%=email%>" method="post">
                        <div class="form-group">
                            <label for="h_no">Enter your House No.</label>
                            <input type="text" id="h_no" name="h_no"  class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="street">Enter your Street</label>
                            <input type="text" id="street" name="street"  class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="city">Enter the city</label>
                            <input type="text" id="city" name="city"  class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="state">Enter the State</label>
                            <input type="text" id="state" name="state"  class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="landmark">Enter the Landmark</label>
                            <input type="text" id="landmark" name="landmark"  class="form-control"/>
                        </div>
                        
                       
                        <input type="button"  class="btn-lg btn btn-primary" style="margin-left: 40%" value="Save and Continue" onclick="go()"/>
                        
                        
                    </form>
                </div>
    </body>
</html>
