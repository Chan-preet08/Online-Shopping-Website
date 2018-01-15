
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%@include file='seller_header.jsp' %>
        <!-- //banner -->
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
        <form role="form" class="form-horizontal" action="./signup_action" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="m_name" class="col-md-2">Name</label>
                    <div class="col-md-10">

                        <input type="text" placeholder="Enter Merchant Name" required class="form-control" name="m_name" id="m_name" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="tbemail" class="col-md-2">Email </label>
                    <div class="col-md-10">
                        <input type="email" placeholder="Enter Email" required class="form-control" name="tbemail" id="tbemail" >
                    </div>
                </div>
            <div class="form-group">
              <label for="tbpass" class="col-md-2">Password</label>
              <div class="col-md-10">
                  <input type="password" placeholder="Enter Password" required class="form-control" name="tbpass" id="tbpass">
              </div>
          </div>
            <div class="form-group">
              <label for="cpass" class="col-md-2">Confirm Password</label>
              <div class="col-md-10">
                  <input type="password" placeholder="Confirm Password" required class="form-control" name="cpass" id="cpass">
              </div>
          </div>
                <div class="form-group">
                    <label for="tbcontact" class="col-md-2">Contact No. </label>

                    <div class="col-md-10">

                        <input type="number" placeholder="Enter Contact number" required class="form-control" name="tbcontact" id="tbcontact" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="tbaddress" class="col-md-2">Address </label>
                    <div class="col-md-10">
                        <textarea class="form-control" name="tbaddress" id="tbaddress" >
                        </textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="service_taxpic" class="col-md-2">Service Tax Number </label>
                    <div class="col-md-10">
                        <input type="file" required class="form-control" name="service_taxpic" id="service_taxpic" >
                    </div>
                </div>
<div class="form-group">
                    <label for="sale_taxpic" class="col-md-2">Sale Tax Number </label>
                    <div class="col-md-10">
                        <input type="file" required class="form-control" name="sale_taxpic" id="sale_taxpic" >
                    </div>
                </div>
<div class="form-group">
                    <label for="aadhaarcard" class="col-md-2">Aadhaar Card</label>
                    <div class="col-md-10">
                        <input type="file" required class="form-control" name="aadhaarcard" id="aadhaarcard" >
                    </div>
                </div>
<div class="form-group">
                    <label for="Company_icon" class="col-md-2">Company Icon</label>
                    <div class="col-md-10">
                        <input type="file" required class="form-control" name="Company_icon" id="Company_icon" >
                    </div>
                </div>
  <div class="form-group">
                    <label for="bank_acc" class="col-md-2">Bank Account</label>
                    <div class="col-md-10">

                        <input type="text" placeholder="Enter Bank Account Number" required class="form-control" name="bank_acc" id="bank_acc" >
                    </div>
                </div>
              <div class="form-group">
                    <label for="ifsc" class="col-md-2">IFSC Code</label>
                    <div class="col-md-10">

                        <input type="text" placeholder="Enter ICSC Code" required class="form-control" name="ifsc" id="ifsc" >
                    </div>
                </div>
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="submit" class="btn btn-primary black-background white-text" value="Signup">
                </div>
            </form>
        
          <% 
            String m= request.getParameter("msg");
            if(m!=null)
            {
                if(m.contains("already")){
                    %>
                    <h3 style="color: red; text-align: center"><%= m %></h3>
           <% }
else{
%>
<h3 style="color: green; text-align: center"><%= m %></h3>
<%

}}
        %>
        </div>
            </div>
        </div>
        <%@include file='footer.html' %> 
</body>
</html>
