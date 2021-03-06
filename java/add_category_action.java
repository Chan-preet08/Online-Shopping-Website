
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
public class add_category_action extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
       String cat_name = request.getParameter("cat_name");
       String description = request.getParameter("description");
      
       Part part =request.getPart("tbphoto");
       String abspath = request.getServletContext().getRealPath("/category");
       String filename=FileUploader.savefileonserver(part, abspath);
       String path="./category/"+filename;
       
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from category where c_name='"+cat_name+"'");
                if(rs.next())
                {
                response.sendRedirect("add_category.jsp?msg=product%20already%20exists");
                }
                else
                {
                rs.moveToInsertRow();
                rs.updateString("c_name",cat_name);
                rs.updateString("description",description);
                rs.updateString("icon", path);
                rs.insertRow();
                response.sendRedirect("add_category.jsp?msg=Category added successfully");
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
