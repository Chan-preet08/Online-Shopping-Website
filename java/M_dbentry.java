
import java.io.IOException;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.*;
import org.json.simple.parser.*;
import pack1.CartItem;
import java.sql.*;

public class M_dbentry extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        DataInputStream in = new DataInputStream(request.getInputStream());
        int formDataLength = request.getContentLength();

        System.out.println("CONTENT LENGTH::::" + formDataLength);

        byte b[] = new byte[formDataLength];
        in.read(b, 0, formDataLength);

        String reccivedpostdata = new String(b);

        System.out.println("RECEIVED DATA --->" + reccivedpostdata);
        out.println("JSON RECEIVED AT SERVER");

        JSONObject jsonObject = new JSONObject();

        JSONParser parser = new JSONParser();
        try {
            int order_id = 0;

            JSONObject json = (JSONObject) parser.parse(reccivedpostdata);
            JSONArray arr = (JSONArray) json.get("shoppinglist");

            System.out.println("------------------------------------------------");
            System.out.println("..... " + arr);

            String net_amt = (String) json.get("net_amt");
            String vat = (String) json.get("vat");

            String taxes = (String) (json.get("taxes"));
            String delivery_charges = (String) (json.get("delivery_charges"));
            String net_amt_payable = (String) json.get("net_amt_payable");
            String email = (String) json.get("email");
            String address_detail = (String) json.get("address_detail");
            String booking_date = (String) json.get("booking_date");
            String delivery_date = (String) json.get("delivery_date");

            System.out.println("EMAIL EXTRACTED " + email);

            //1 Insert in Order table
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from orders");

                rs.moveToInsertRow();
                rs.updateString("order_amt", net_amt);
                rs.updateString("taxes", taxes);
                rs.updateString("vat", vat);
                rs.updateString("delivery_charges", delivery_charges);
                rs.updateString("net_amt", net_amt_payable);
                rs.updateString("delivery_date", delivery_date);
                rs.updateString("booking_date", booking_date);
                rs.updateString("address_detail", address_detail);
                rs.updateString("user_email", email);
                rs.insertRow();

                System.out.println("Single Insert done ....");

                Class.forName("com.mysql.jdbc.Driver");
                Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");

                Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs2 = stmt2.executeQuery("select max(order_id) as order_id from orders");

                if (rs2.next()) {
                    order_id = rs2.getInt("order_id");
                }

                System.out.println("LAST ORDER IS " + order_id);

            } catch (Exception ex) {
                ex.printStackTrace();
            }

            System.out.println("SIZE OF ARRAY " + arr.size());

            for (int i = 0; i < arr.size(); i++)
            {
                System.out.println("inside loop");
                JSONObject singleobject = (JSONObject) (arr.get(i));
                
                System.out.println("single object -->"+i+ singleobject);
                
                String p_id = (String) (singleobject.get("p_id"));
                String p_name = (String) (singleobject.get("p_name"));
                String offer_price = (String) (singleobject.get("offer_price"));
                String qty = (String) (singleobject.get("qty"));
                String photo = (String) (singleobject.get("photo"));

                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");

                    Statement stmt3 = conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs3 = stmt3.executeQuery("select * from order_details");

                    System.out.println("## CODE INDSIDE LOOP");
                    
                    rs3.moveToInsertRow();
                    rs3.updateInt("order_id", order_id);
                    rs3.updateString("p_id", p_id);
                    rs3.updateString("product_name", p_name);
                    rs3.updateString("offer_price", offer_price);
                    rs3.updateString("qty", qty);
                    rs3.updateString("photo", photo);
                    rs3.insertRow();
                    //Multilple Insert in Order_detail table

                    System.out.println("Multi Insert done -->");
                    
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

            
             //SMS LOGIC HERE
                pack1.SMSsender sender=new pack1.SMSsender("7986833547", "Thank You for Shopping Your Orrder no is "+order_id+" and NET amount is "+net_amt_payable, "text");
                Thread t=new Thread(sender);
                t.start();
                
        } catch (ParseException ex) {
            ex.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        doPost(req, resp);
    }

}
