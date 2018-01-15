
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


public class u_signup_action extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     response.setContentType("text/html;charset=UTF-8");
          String u_name;
            String email;
            String password;
            String contact;
            u_name = request.getParameter("u_name");
            email = request.getParameter("email");
            password = request.getParameter("password");
            contact = request.getParameter("contact");
       try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from user where email='"+email+"'");
                if(rs.next())
                {
                response.sendRedirect("user_signup.jsp?msg=already%20exists");
                }
                else
                {
                rs.moveToInsertRow();
                rs.updateString("u_name",u_name);
                rs.updateString("email",email);
                rs.updateString("password",password);
                rs.updateString("contact_no",contact);
                rs.insertRow();
                response.sendRedirect("user_signup.jsp?msg=signup successful");
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
