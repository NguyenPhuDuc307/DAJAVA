/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Khachhang;
import entity.enQuanlyDP;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DAO dao = new DAO();

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();

        Khachhang a = dao.LoginKH(email, myHash);
        Account b = dao.LoginAD(email, myHash);
        boolean xn = false;

        HttpSession session = request.getSession();
        session.removeAttribute("isxnthanhcong");
        session.removeAttribute("mes");

        if (a == null && b == null) {
            request.setAttribute("mess", "Sai địa chỉ email hoặc mật khẩu, vui lòng thao tác lại.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            // khách hàng
            if (a != null && b == null) {
                if (a.isXACNHAN() == true) {
                    session.setAttribute("acc", a);
                    session.setAttribute("istk", false);
                    session.setAttribute("iskh", true);
                    //  session ton tai 10p
                    session.setMaxInactiveInterval(600);
                    xn = true;
                    List<enQuanlyDP> listDP = dao.getDatPhongChuaTT(a.getIDKHACHHANG());

                    session.setAttribute("count", listDP.size());
                    session.removeAttribute("countQL");
                } else {
                    xn = false;
                }
            } // tài khoan
            else if (a == null && b != null) {
                session.setAttribute("acc", b);
                session.setAttribute("istk", true);
                session.setAttribute("iskh", false);
                //  session ton tai 10p
                session.setMaxInactiveInterval(6000);
                xn = true;
                List<enQuanlyDP> listQLDP = dao.getQuanlyDPChuaTT(b.getMAKHACHSAN());

                if (b.getADMIN() != 1) 
                {
                    session.setAttribute("countQL", listQLDP.size());
                }
                session.removeAttribute("count");
                //request.getRequestDispatcher("Manager.jsp").forward(request, response);
            }

            if (xn == false) {
                session.setAttribute("idtkchuaxn", a.getIDKHACHHANG());
                request.setAttribute("mess", "Tài khoản chưa được xác nhận, vui lòng kiểm tra trong email của bạn.");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                response.sendRedirect("login");
            } else {
                response.sendRedirect("home"); // chuyen trang ma ko can mang thep du lieu
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
            Logger.getLogger(LoginControl.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(LoginControl.class.getName()).log(Level.SEVERE, null, ex);
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
