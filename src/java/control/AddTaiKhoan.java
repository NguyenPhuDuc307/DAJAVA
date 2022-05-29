package control;

import dao.objTaiKhoan;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

@WebServlet(name = "AddTaiKhoan", urlPatterns = {"/AddTaiKhoan"})
public class AddTaiKhoan extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String MAKHACHSAN = request.getParameter("MAKHACHSAN");
        String HOTEN = request.getParameter("HOTEN");
        String DIENTHOAI = request.getParameter("DIENTHOAI");
        String EMAIL = request.getParameter("EMAIL");
        Boolean ADMIN = false;

        // tạo mật khẩu ngẫu nhiên
        int radix = 16;
        Random random = new SecureRandom();
        BigInteger bi = new BigInteger(48, random);
        String PASSWORD = bi.toString(radix);

        objTaiKhoan dao = new objTaiKhoan();

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(PASSWORD.getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();

        dao.addTaiKhoan(MAKHACHSAN, HOTEN, DIENTHOAI, EMAIL, myHash, ADMIN);

        String tieude = "Xac nhan dang ky tai khoan";
        String message = "<!DOCTYPE html>\n"
                + "<html>\n"
                + "        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\n"
                + "    </head>\n"
                + "    <body>\n"
                + "        <div class=\"container\">\n"
                + "            <h3>Bạn đã đăng ký thành công tài khoản đối tác của <b style=\"color:blue\">VN</b><b style=\"color:orange\">BOOKING</b></h3>\n"
                + "            <div>Họ tên : " + HOTEN + "</div>\n"
                + "            <div>Số điện thoại : " + DIENTHOAI + "</div>\n"
                + "            <div>Địa chỉ mail : " + EMAIL + "</div>\n"
                + "            <div>Mật khẩu : " + PASSWORD + "</div>\n"
                + "            <div>Hãy dùng mật khẩu này để đăng nhập vào trang web và đổi mật khẩu.</div>\n"
                + "        </div>\n"
                + "    </body>\n"
                + "</html>";
        SeenMail.send(EMAIL, tieude, message, "nguyenphuduc62001@gmail.com", "Phuduc@30072001");

        response.sendRedirect("TaiKhoanControl");
    }

    public static void main(String[] args) {
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
            Logger.getLogger(AddTaiKhoan.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddTaiKhoan.class.getName()).log(Level.SEVERE, null, ex);
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
