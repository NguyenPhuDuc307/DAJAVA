package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nguye
 */
@WebServlet(name = "Quenmk", urlPatterns = {"/Quenmk"})
public class Quenmk extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("email");
        

        String tieude = "Dat lai mat khau cho tai khoan";
        String message = "<!DOCTYPE html>\n"
                + "<html>\n"
                + "        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\n"
                + "    </head>\n"
                + "    <body>\n"
                + "        <div class=\"container\">\n"
                + "            <h3>Chúng tôi đã xác nhận yêu cầu đặt lại mật khẩu cho tài khoản <b style=\"color:blue\">VN</b><b style=\"color:orange\">BOOKING</b> của bạn</h3>\n"
                + "            <h3>Bạn vui lòng nhấn vào <a href=\"http://localhost:8080/vnbooking.com/Datlaimatkhau.jsp\">đây</a> để đặt lại mật khẩu.</h3>\n"
                + "            <h3>Vui lòng không chia sẻ cho bất kỳ ai!</h3>\n"
                + "        </div>\n"
                + "    </body>\n"
                + "</html>";
        SeenMail.send(email, tieude, message, "nguyenphuduc62001@gmail.com", "Phuduc@30072001");
        HttpSession session = request.getSession();
        session.setAttribute("mes", "Chúng tôi đã gửi một email đến bạn, bạn vui lòng kiểm tra hòm thư.");        
        session.setAttribute("emaildatlai", email);

        response.sendRedirect("Quenmk.jsp");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
