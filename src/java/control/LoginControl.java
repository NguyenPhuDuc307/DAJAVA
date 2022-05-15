/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Khachhang;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DAO dao = new DAO();
        
        Khachhang a = dao.LoginKH(email, password);
        Account b = dao.LoginAD(email, password);
        
        if(a == null && b == null  ){
            request.setAttribute("mess", "Sai địa chỉ email hoặc mật khẩu, vui lòng thao tác lại.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        
        else {
         //   request.getRequestDispatcher("home").forward(request, response); (chuyen trang mang theo du lieu)

         // khách hàng
           if(a != null && b == null  ){
                HttpSession session = request.getSession();
                session.setAttribute("acc", a);
                session.setAttribute("istk", false);
                //  session ton tai 10p
                session.setMaxInactiveInterval(600);
            }
           // tài khoan
           else if(a == null && b != null){
                HttpSession session = request.getSession();
                session.setAttribute("acc", b);
                session.setAttribute("istk", true);
                //  session ton tai 10p
                session.setMaxInactiveInterval(600);
                
                //request.getRequestDispatcher("Manager.jsp").forward(request, response);
            }
        response.sendRedirect("home"); // chuyen trang ma ko can mang thep du lieu
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
 