

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

public class pro_listview extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
         String subcat = request.getParameter("subcat");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from product where sub_cat_name='" + subcat + "'");
            JSONArray jsonarr = new JSONArray();
              
            
            while(rs.next())
            {
               JSONObject singleobject=new JSONObject();
               singleobject.put("p_name",rs.getString("p_name"));
               singleobject.put("picpath",rs.getString("image"));
               singleobject.put("p_id",rs.getString("p_id"));
               singleobject.put("mrp",rs.getString("mrp"));
               singleobject.put("offer_price",rs.getString("offer_price"));
               jsonarr.add(singleobject);
               //out.println(singleobject);              
            }
            
            JSONObject ans=new JSONObject();
            ans.put("product", jsonarr);
            
            out.println(ans);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
