/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.objLoaiPhong;
import entity.Account;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author bigbo
 */
@MultipartConfig
@WebServlet(name = "AddLoaiPhongControl", urlPatterns = {"/AddLoaiPhongControl"})
public class AddLoaiPhongControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("LoaiPhong.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            Part part = request.getPart("image");

            String repaString = request.getServletContext().getRealPath("/images");
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Paths.get(repaString))) {
                Files.createDirectories(Paths.get(repaString));
            }
            part.write(repaString + "/" + filename);
            String HINHANH = "images/" + filename;

            String TENLOAIPHONG = request.getParameter("TENLOAIPHONG");
            String MOTA = request.getParameter("MOTA");
            String GIAPHONG = request.getParameter("GIAPHONG");
            String SOLUONG = request.getParameter("SOLUONG");
            Boolean TRANGTHAI = Boolean.valueOf(request.getParameter("TRANGTHAI"));
            Boolean NGUNG = Boolean.valueOf(request.getParameter("NGUNG"));

            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("acc");
            String maks = a.getMAKHACHSAN();

            objLoaiPhong dao = new objLoaiPhong();
            dao.addLoaiPhong(TENLOAIPHONG, MOTA, HINHANH, GIAPHONG, SOLUONG, TRANGTHAI, NGUNG, maks);
            response.sendRedirect("LoaiPhongControl");

        } catch (Exception e) {
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
