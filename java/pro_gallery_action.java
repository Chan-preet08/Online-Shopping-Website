
import java.io.*;
import java.sql.*;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import javax.servlet.http.Part;

@MultipartConfig
public class pro_gallery_action extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        Collection<Part> parts = request.getParts();
        String filepath = "";
        String absolutepath = request.getServletContext().getRealPath("/product_images");
        String caption = request.getParameter("caption");
        String pid = request.getParameter("pid");
        String filename = "";
        
        for (Part part : parts) 
        {
            String newfilename=pid + "-" + caption + ".jpg";
            File f=new File(absolutepath+"/"+newfilename); 
            
            if(f.exists())
            {
                newfilename=(int)(Math.random()*1000000)+newfilename;
            }
            
            filename = vmm.FileUploader.savefileonserver(part, absolutepath, newfilename);
            if (filename.equals("not-a-file")) {

            } else {
                filepath = "./product_images/" + filename;
            }
        }
        
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from product_gallery");

            //insert photo entry in DB
            rs.moveToInsertRow();
            rs.updateString("caption", caption);
            rs.updateString("p_id", pid);
            rs.updateString("pic_path", filepath);
            rs.insertRow();

            //refresh resultset
            rs = stmt.executeQuery("select * from product_gallery where p_id='" + pid + "'");

            out.println("<table>");
            out.println("<tr>");
            while ((rs.next())) 
            {
                out.println("<td>");
                out.println("<div><img src=\"" + rs.getString("pic_path") + "\" style=\"width: 100px;height: 100px;\" /></div>");
                out.println(rs.getString("caption"));
                out.println("<br><br>");
                out.println("<input type=\"button\" id=\"" + rs.getString("s_no") + "\" value=\"X\" onclick=\"go6(\'" + rs.getString("s_no") + "\'," + pid + ")\"");
                out.println("</td>");
            }
            out.println("</tr>");
            out.println("</table>");

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
