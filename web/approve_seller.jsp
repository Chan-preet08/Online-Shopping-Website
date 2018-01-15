<%@page import="java.sql.*"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file='admin_header.jsp' %>
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">
             <form role="form" class="form-horizontal" action="./approve_action" method="post" enctype="multipart/form-data">
        <%
            String email= request.getParameter("msg");
            Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from seller where email='"+email+"'");
                while(rs.next())
                {
                    String m_name = rs.getString("m_name");
                    String contact = rs.getString("contact");
                    String address = rs.getString("address");
                    String bank_acc = rs.getString("bank_acc");
                    String ifsc = rs.getString("ifsc");
                    String service_taxpic = rs.getString("service_taxpic");
                    String sale_taxpic = rs.getString("sale_taxpic");
                    String ac_pic = rs.getString("ac_pic");
                    String icon = rs.getString("icon");
                    %>
                    <div class="form-group">
                        <label for="m_name" class="col-md-2" >Name</label>
                    <div class="col-md-10">
                     <input type="text"  value="<%=m_name%>" readonly class="form-control"  >
                    </div>
                </div>
                    <div class="form-group">
                        <label for="contact" class="col-md-2" >Contact</label>
                    <div class="col-md-10">
                     <input type="text"  value="<%=contact%>" readonly class="form-control" >
                    </div>
                </div>
                    <div class="form-group">
                        <label for="address" class="col-md-2" >Address</label>
                    <div class="col-md-10">
                     <input type="text"  value="<%=address%>" readonly class="form-control"  >
                    </div>
                </div>
                    <div class="form-group">
                        <label for="bank_acc" class="col-md-2" >Bank Account</label>
                    <div class="col-md-10">
                     <input type="text"  value="<%=bank_acc%>" readonly class="form-control"  >
                    </div>
                </div>
                    <div class="form-group">
                        <label for="ifsc" class="col-md-2" >IFSC</label>
                    <div class="col-md-10">
                     <input type="text"  value="<%=ifsc%>" readonly class="form-control"  >
                    </div>
                </div>
                      <div class="form-group">
                        <label for="service_taxpic" class="col-md-2" >Service Tax Image</label>
                    <div class="col-md-10">
                        <img width="70px" height="70px" src="<%=service_taxpic%>" />
                    </div>
                </div>
                     <div class="form-group">
                        <label for="sale_taxpic" class="col-md-2" >Sale Tax Image</label>
                    <div class="col-md-10">
                        <img width="70px" height="70px" src="<%=sale_taxpic%>" />
                    </div>
                </div>
                     <div class="form-group">
                        <label for="ac_pic" class="col-md-2" >Aadhar Card Image</label>
                    <div class="col-md-10">
                        <img width="70px" height="70px" src="<%=ac_pic%>" />
                    </div>
                </div>
                     <div class="form-group">
                        <label for="icon" class="col-md-2" >Company Logo</label>
                    <div class="col-md-10">
                        <img width="70px" height="70px" src="<%=icon%>" />
                    </div>
                      <div class="form-group col-md-12">
                     <input type="hidden"  value="<%=email%>" class="form-control" name="email" id="email" >
                </div>
                </div>
                      <div class="col-lg-offset-2 col-lg-10">
                    <input type="submit" class="btn btn-yellow black-background white-text" value="Approve">
                </div>
                    
                    <%
                }
  String m= request.getParameter("msg");
            if(m!=null)
            {%>
        <h3><%= m %></h3>
           <% }
        %>
        </form>
         </div>
            </div>
        </div>
        <%@include file='footer.html' %> 
    </body>
</html>
