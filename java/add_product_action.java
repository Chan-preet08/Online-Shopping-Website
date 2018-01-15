
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import vmm.FileUploader;
import java.sql.*;

@MultipartConfig
public class add_product_action extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
       String p_name = request.getParameter("p_name");
       String desc = request.getParameter("desc");
       String mrp = request.getParameter("mrp");
       String offer_price = request.getParameter("offer_price");
       String cat_name = request.getParameter("c_name");
       String sub_cat_name = request.getParameter("subc_name");
      
       Part part =request.getPart("image");
       String abspath = request.getServletContext().getRealPath("/category");
       String filename=FileUploader.savefileonserver(part, abspath);
       String path="./category/"+filename;
       
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from product where p_name='"+p_name+"'");
                if(rs.next())
                {
                response.sendRedirect("seller_dashboard.jsp?msg=product%20already%20exists");
                }
                else
                {
                rs.moveToInsertRow();
                rs.updateString("p_name",p_name);
                rs.updateString("desc",desc);
                rs.updateString("image", path);
                rs.updateString("mrp", mrp);
                rs.updateString("offer_price", offer_price);
                rs.updateString("cat_name", cat_name);
                rs.updateString("sub_cat_name",sub_cat_name);
                rs.insertRow();
                response.sendRedirect("seller_dashboard.jsp?msg=product added successfully");
                }
        }
         catch(Exception ex)
        {
            ex.printStackTrace();
        }

    }
       
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
