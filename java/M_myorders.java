

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

public class M_myorders extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
String email= request.getParameter("email");
        PrintWriter out = response.getWriter();

        try {
           
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from orders where user_email='"+email+"'");
            JSONArray jsonarr = new JSONArray();
              
            
            while(rs.next())
            {
                String order_id=rs.getString("order_id");
                
            Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            Statement stmt2 = con2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs2 = stmt2.executeQuery("select count(*) as nooforders from order_details where order_id='"+order_id+"'");
                
            int count=0;
            
                if(rs2.next())
                {
                    count=rs2.getInt("nooforders");
                }
                
               JSONObject singleobject=new JSONObject();
               singleobject.put("order_id", order_id);
               singleobject.put("net_amt",rs.getString("net_amt"));
               singleobject.put("booking_date",rs.getString("booking_date"));
               singleobject.put("delivery_date",rs.getString("delivery_date"));
               singleobject.put("address_detail",rs.getString("address_detail"));
               singleobject.put("nooforders",count);
               
               jsonarr.add(singleobject);
               //out.println(singleobject);              
            }
            
            JSONObject ans=new JSONObject();
            ans.put("orders", jsonarr);
            
            out.println(ans);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
