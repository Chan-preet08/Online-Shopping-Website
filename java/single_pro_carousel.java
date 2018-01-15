 

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.*;

public class single_pro_carousel extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
         String p_id= request.getParameter("p_id");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from product_gallery where p_id='" + p_id + "'");
            JSONArray jsonarr = new JSONArray();
              
            
            while(rs.next())
            {
               JSONObject singleobject=new JSONObject();
               singleobject.put("picpath",rs.getString("pic_path"));
               singleobject.put("caption",rs.getString("caption"));
               jsonarr.add(singleobject);
               //out.println(singleobject);              
            }
            
            JSONObject ans=new JSONObject();
            ans.put("images", jsonarr);
            
            out.println(ans);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
