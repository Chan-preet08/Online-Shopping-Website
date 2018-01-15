
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import vmm.FileUploader;
@MultipartConfig
public class add_subcategory_action extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
       String sub_name = request.getParameter("sub_name");
      String c_name=request.getParameter("c_name");
       Part part =request.getPart("photo");
       String abspath = request.getServletContext().getRealPath("/category");
       String filename=FileUploader.savefileonserver(part, abspath);
       String path="./category/"+filename;
       
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from sub_category where subc_name='"+sub_name+"'");
                if(rs.next())
                {
                response.sendRedirect("add_subcategory.jsp?msg=catgeory%20already%20exists");
                }
                else
                {
                rs.moveToInsertRow();
                rs.updateString("subc_name",sub_name);
                rs.updateString("c_name",c_name);
                rs.updateString("photo", path);
                rs.insertRow();
                response.sendRedirect("add_subcategory.jsp?msg=Sub Category added successfully");
                }
        }
         catch(Exception ex)
        {
            ex.printStackTrace();
        }

}
}
