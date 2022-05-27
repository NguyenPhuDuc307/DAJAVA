package control;

import dao.DAO;
import entity.Khachhang;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

@WebServlet(name = "SignUpControl", urlPatterns = {"/signup"})
public class SignUpControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String hoten = request.getParameter("hoten");
        String dienthoai = request.getParameter("new_dienthoai");
        String email = request.getParameter("new_email");
        String password = request.getParameter("new_password");
        String re_password = request.getParameter("re_password");
        if (!password.equals(re_password)) {

            response.sendRedirect("Login.jsp");
        } else {
            DAO dao = new DAO();
            Khachhang a = dao.checkExist(email);
            if (a == null) {

                MessageDigest md = MessageDigest.getInstance("MD5");
                md.update(password.getBytes());
                byte[] digest = md.digest();
                String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();

                // dc dang ki tai khoan
                dao.signup(hoten, dienthoai, email, myHash);
                Khachhang aa = dao.LoginKH(email, myHash);
                int idtkxn = aa.getIDKHACHHANG();
                
                String tieude = "Xac nhan dang ky tai khoan";
                String message = "<!DOCTYPE html>\n"
                        + "<html>\n"
                        + "        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\n"
                        + "    </head>\n"
                        + "    <body>\n"
                        + "        <div class=\"container\">\n"
                        + "            <h3>Bạn đã đăng ký thành công tài khoản của <b style=\"color:blue\">VN</b><b style=\"color:orange\">BOOKING</b></h3>\n"
                        + "            <div>Họ tên : " + hoten + "</div>\n"
                        + "            <div>Số điện thoại : " + dienthoai + "</div>\n"
                        + "            <div>Địa chỉ mail : " + email + "</div>\n"
                        + "            <h3>Bạn vui lòng nhấn vào <a href=\"http://localhost:8080/vnbooking.com/hoantatxacnhan?idtk=" + idtkxn + "\">đây</a> để xác nhận!</h3>\n"
                        + "        </div>\n"
                        + "    </body>\n"
                        + "</html>";
                SeenMail.send(aa.getEMAIL(),tieude , message, "nguyenphuduc62001@gmail.com", "Phuduc@30072001");

                response.sendRedirect("loadlogin");
            } else {
                // ko cho dang ki 
                request.setAttribute("message", "Email exist, please try another.");
                response.sendRedirect("Login.jsp");
            }
        }
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(SignUpControl.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(SignUpControl.class.getName()).log(Level.SEVERE, null, ex);
        }
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
