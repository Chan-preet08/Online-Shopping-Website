
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
public class add_banner_action extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         
         String ban_id=request.getParameter("ban_id");
       String min_dis =request.getParameter("min_discount");
       String min_price = request.getParameter("min_price");
       String max_price = request.getParameter("max_price");
       
        System.out.println(min_price+"  "+max_price+" "+min_dis);
       if(min_dis.equals(""))
       {
           min_dis=0+"";
       }
      
       if(min_price.equals(""))
       {
           min_price=0+"";
       }
       
       if(max_price.equals(""))
       {
           max_price=0+"";
       }
       
       String cat_name = request.getParameter("c_name");
       String sub_cat_name = request.getParameter("subc_name");
      
       Part part =request.getPart("photo");
       String abspath = request.getServletContext().getRealPath("/banner_images");
       String filename=FileUploader.savefileonserver(part, abspath);
       String path="./banner_images/"+filename;
       
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from banner where ban_id='"+ban_id+"'");
                if(rs.next())
                {
                response.sendRedirect("add_banner.jsp?msg=banner%20already%20exists");
                }
                else
                {
                rs.moveToInsertRow();
                rs.updateString("dis",min_dis);
                rs.updateString("photo", path);
                rs.updateString("max_price", max_price);
                rs.updateString("min_price", min_price);
                rs.updateString("c_name", cat_name);
                rs.updateString("subc_name",sub_cat_name);
                rs.insertRow();
                response.sendRedirect("add_banner.jsp?msg=banner added successfully");
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
