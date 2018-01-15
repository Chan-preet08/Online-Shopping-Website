
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
public class signup_action extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     response.setContentType("text/html;charset=UTF-8");
          String m_name;
            String email;
            String password;
            String contact;
            String address;
            String bank_acc;
            String ifsc;
            m_name = request.getParameter("m_name");
            email = request.getParameter("tbemail");
            password = request.getParameter("tbpass");
            contact = request.getParameter("tbcontact");
            address = request.getParameter("tbaddress");
            bank_acc = request.getParameter("bank_acc");
            ifsc = request.getParameter("ifsc");
            String abspath = request.getServletContext().getRealPath("/category");

            Part part =request.getPart("service_taxpic");
       String filename=FileUploader.savefileonserver(part, abspath);
       String st="./category/"+filename;

            Part part1 =request.getPart("sale_taxpic");
       String filename1=FileUploader.savefileonserver(part, abspath);
       String sale="./category/"+filename;       

            Part part2 =request.getPart("aadhaarcard");
       String filename2=FileUploader.savefileonserver(part, abspath);
       String ac="./category/"+filename;
       
            Part part3 =request.getPart("Company_icon");
       String filename3=FileUploader.savefileonserver(part, abspath);
       String ci="./category/"+filename;
       try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from seller where email='"+email+"'");
                if(rs.next())
                {
                response.sendRedirect("seller_signup.jsp?msg=already%20exists");
                }
                else
                {
                rs.moveToInsertRow();
                rs.updateString("m_name",m_name);
                rs.updateString("email",email);
                rs.updateString("password",password);
                rs.updateString("contact",contact);
                rs.updateString("address",address);
                rs.updateString("bank_acc",bank_acc);
                rs.updateString("ifsc",ifsc);
                rs.updateString("service_taxpic",st);
                rs.updateString("sale_taxpic",sale);
                rs.updateString("ac_pic",ac);
                rs.updateString("icon", ci);
                rs.insertRow();
                response.sendRedirect("seller_signup.jsp?msg=signup successful");
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
