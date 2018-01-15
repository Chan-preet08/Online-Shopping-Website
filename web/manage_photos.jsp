<%
    String email1 = (String) session.getAttribute("email1");
    if (email1 == null) {
        response.sendRedirect("seller_login.jsp?msg=Please Login To Perform This Action");
    } else {

%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Product Photos</title>
        
        <script>

            function go6(id, pid)
            {
                var id = id;
                var pid = pid;
                var a = confirm("Are You Sure you want to Delete!");

                if (a) {
                    var xml;

                    xml = new XMLHttpRequest();
                    xml.onreadystatechange = function ()
                    {
                        if (xml.readyState == 4 && xml.status == 200) {
                            document.getElementById('div1').innerHTML = xml.responseText;
                        }

                    };
                    xml.open("get", "delete_product_photo.jsp?s_no=" + id + "&p_id=" + pid, true);
                    xml.send();
                }

            }


            function go5()
            {

                if (document.getElementById("bt1").value == "+")
                {
                    document.getElementById("label").style.display = "none";

                    document.getElementById("add_cat").style.display = "block";
                    document.getElementById("bt1").value = "-";


                } else
                {
                    document.getElementById("add_cat").style.display = "none";
                    document.getElementById("bt1").value = "+";

                }
            }


            function readandpreview(fileobj, imageid)
            {
                var firstfile = fileobj.files[0];

                var reader = new FileReader();

                //alert("File name: " + firstfile.name);
                //alert("File size: " + firstfile.size);

                reader.onload = (function (f)
                {
                    return function read12(e)
                    {
                        if (firstfile.type.indexOf("image") !== -1)
                        {
                            document.getElementById(imageid).src = e.target.result;
                        } else if (firstfile.type.indexOf("audio") !== -1)
                        {
                            document.getElementById(imageid).src = "audio.jpg";
                        } else if (firstfile.type.indexOf("video") !== -1)
                        {
                            document.getElementById(imageid).src = "video.jpg";
                        } else
                        {
                            document.getElementById(imageid).src = "other.png";
                        }
                    };
                })(firstfile);


                reader.readAsDataURL(firstfile);
            }


            function upload()
            {
                if (document.getElementById("caption").value == "" || document.getElementById("f1").value == "")
                {                    
                    document.getElementById("label").style.display = "inherit";
                } 
                else
                {
                    document.getElementById("label").style.display = "none";
                    var ans = "";
                    //NEW CODE
                    var formdata = new FormData();
                    var controls = document.getElementById("form1").elements;
                    var flag = 0;
                    for (var i = 0; i < controls.length; i++)
                    {
                        if (controls[i].name == "" || controls[i].name == null)
                        {
                            flag = 1;
                        }

                        if (controls[i].type == "file")
                        {
                            if (controls[i].files.length > 0)
                            {
                                ans = ans + controls[i].name + ": " + controls[i].files[0].name + "\n";
                                formdata.append(controls[i].name, controls[i].files[0]);
                            } else
                            {
                                flag = 2;
                            }
                        } 
                        else    // for other input types  text,password,select
                        {
                            ans = ans + controls[i].name + ": " + controls[i].value + "\n";
                            formdata.append(controls[i].name, controls[i].value);
                        }
                    }
                    if (flag == 1)
                    {
                    } else if (flag == 2)
                    {
                    }
                    else
                    {
                        var xhr = new XMLHttpRequest;
                        xhr.open("POST", "./pro_gallery_action", true);
                        //for response receiving
                        xhr.onreadystatechange = function ()
                        {
                            if (xhr.readyState === 4 && xhr.status == 200)
                            {                                       
                                document.getElementById("div1").innerHTML = xhr.responseText;
                                document.getElementById("im1").src = "";
                                document.getElementById("caption").value = "";
                                document.getElementById("f1").value = "";
                                
                                //document.getElementById("div1").style.display="block";
                                //document.getElementById("add_cat").style.display="none";
                            }
                        };
                        xhr.send(formdata);
                    }

                }
            }

            function updateProgress(evt)
            {
                if (evt.lengthComputable)
                {
                    var percentComplete = parseInt((evt.loaded * 100) / evt.total);
                    document.getElementById("label").innerHTML = percentComplete + " %";
                    document.getElementById("progress").value = percentComplete;
                }
            }

        </script>
    </head>
    <body>
        
     <%@include file='seller_header.jsp' %>
        <!-- //banner -->
        <div class="container-fluid all-div">       <!--      Three div to be included in every Page    -->
            <div class="row">
                <div class="container">

        <h1 class="jumbotron">Manage Product Photos</h1>


        <%
            String pid = request.getParameter("pid");
            String path = "", caption = "";
            int sno;

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from product where p_id='" + pid + "'");

            String p_name = "", description = "", mrp = "", offer_price = "";
            if (rs.next()) {
                p_name = rs.getString("p_name");
                description = rs.getString("desc");
                mrp = rs.getString("mrp");
                offer_price = rs.getString("offer_price");
            }
        %>
        

            <!-- FORM TO DISPLAY PRODUCT DETAIL -->
            <div class="row">  
                <form role="form">

                    <div class="form-group">
                        <label for="p_name" class="col-md-2">Product Name</label>
                        <div class="col-md-10">
                            <input type="text" value="<%= p_name%>" readonly class="form-control" />
                        </div>
                    </div>
                    <br>
                    <br>
                    <br>
                    <div class="form-group">
                        <label for="desc" class="col-md-2">Description </label>
                        <div class="col-md-10">
                            <input type="text" value="<%= description%>" readonly class="form-control" />
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <label for="mrp" class="col-md-2">MRP</label>
                        <div class="col-md-10">
                            <input type="text" value="<%= mrp%>" readonly class="form-control" />
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <label for="offer_price" class="col-md-2">Offer Price</label>
                        <div class="col-md-10">
                            <input type="text" value="<%= offer_price%>" readonly class="form-control" />
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="col-lg-offset-2 col-lg-10">
                        <input type="button" class="btn btn-yellow" value="+" onclick="go5()" id="bt1"/>
                    </div>
                </form>
            </div>

            <!-- HIDDEN DIV WHICH CONTAINS FORM TO UPLOAD PIC  -->                       
            <div id="add_cat" class="row" style="display: none">
                <form role="form" action="#" method="post" enctype="multipart/form-data" id="form1">

                    <div class="form-group">
                        <label class="col-md-2" >Add Photo</label>
                        <div class="col-md-10">
                            <img src="" id="im1" style="width: 100px;height: 100px;"><br>
                            <input type="file" class="btn" required id="f1" name="f1"  onchange="readandpreview(this, 'im1')" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-2" >Enter Caption</label>
                        <input type="text" value="<%=pid%>" name="pid" style="display: none"/>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="caption" id="caption" required>
                            <label id="label" style="color:red">Please Fill all Fields!</label>
                        </div>
                    </div>           
                        <br>
                        <br>                   
                       
                </form>
                        
                         <div class="col-md-offset-2 col-md-10">
                            <input type="button" class="btn btn-yellow" value="Uplaod" onclick="upload()">
                        </div>
            </div>       

            <!--  DIV FOR Gallery IMAGES -->
            <div id="div1" class="row">
                <%
                    Statement stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs1 = stmt1.executeQuery("select * from product_gallery where p_id='" + pid + "'");

                %>
                <table>
                    <tr>
                        <%   while ((rs1.next())) 
                             {
                                path = rs1.getString("pic_path");
                                caption = rs1.getString("caption");
                                sno = rs1.getInt("s_no");
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
            </div>

    </div>
            </div>
        </div>
        <%@include file='footer.html' %> 

    </body>
</html>
<%
    }
%>