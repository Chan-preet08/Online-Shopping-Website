

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

public class signup_entry extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        System.out.println(email +password);

       try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from user where email='"+email+"'");
                if(rs.next())
                {
                  out.println("User Already Exists");                }
                else
                {
                rs.moveToInsertRow();
                rs.updateString("u_name",name);
                rs.updateString("email",email);
                rs.updateString("password",password);
                rs.updateString("contact_no",number);
                rs.insertRow();
                out.println("Signup Successful");
                }
        }
         catch(Exception ex)
        {
            ex.printStackTrace();
        }

    }

}
