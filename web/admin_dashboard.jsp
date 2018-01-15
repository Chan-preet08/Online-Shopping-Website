
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>JSP Page</title>
        <script>
            function go()
            {
                window.location.href="add_category.jsp";
            }
             function go1()
            {
                window.location.href="manage_category.jsp";
            }
             function go2()
            {
                window.location.href="add_subcategory.jsp";
            }
              function go3()
            {
                window.location.href="manage_seller.jsp";
            }
            
        </script>
    </head>
    <body>
        
        <div class="container-fluid col-md-12 "> 
        <button type="button" class="btn btn-primary" onclick="go()" >Add Category</button>
        <button type="button" class="btn btn-success" onclick="go1()" >Manage Category</button>
        <button type="button" class="btn btn-warning" onclick="go2()">Add Sub_Category</button>
        <button type="button" class="btn btn-warning" onclick="go3()">Manage Seller</button>

        </div>
    </body>
</html>
