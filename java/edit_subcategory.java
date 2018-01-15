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
public class edit_subcategory extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String subc_id=request.getParameter("subc_id");
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
            String subc_name = request.getParameter("subc_name");
            String c_name = request.getParameter("c_name");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from sub_category where subc_id ='" + subc_id + "'");
            if (rs.next())
            {
                
                rs.updateString("subc_name", subc_name);
                rs.updateString("c_name", c_name);

                if(!filepath.equals(""))
                { 
                    rs.updateString("photo", filepath);}
                
                
                rs.updateRow();
                response.sendRedirect("manage_subcategory.jsp?msg=Data Changed Successfully!!!!!!");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
