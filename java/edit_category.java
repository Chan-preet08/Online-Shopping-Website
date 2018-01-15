import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class edit_category extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            Collection<Part> parts = request.getParts();
            String ans = "";
            String filepath = "";
            String absolutepath = request.getServletContext().getRealPath("/category");
            for (Part part : parts) {
                if(part.getSize()!=0){
                    
                
                String filename = vmm.FileUploader.savefileonserver(part, absolutepath);
                if (filename.equals("not-a-file")) {
                } else {
                filepath = "./category/" + filename;
                }
            }}
            String c_name = request.getParameter("c_name");
            String desc = request.getParameter("desc");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from category where c_name ='" + c_name + "'");
            if (rs.next())
            {
                
                rs.updateString("description", desc);
                if(!filepath.equals(""))
                { 
                    rs.updateString("icon", filepath);}
                
                
                rs.updateRow();
                response.sendRedirect("manage_category.jsp?msg=Data Changed Successfully!!!!!!");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
