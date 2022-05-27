/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Khachsan;
import entity.LoaiPhong;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "Timkiem", urlPatterns = {"/timkiem"})
public class Timkiem extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        DAO dao = new DAO();

        String tukhoa = request.getParameter("tukhoa");
        String sao = request.getParameter("sao");
        String giatt = request.getParameter("giatt");
        String giatd = request.getParameter("giatd");
        List<Khachsan> listTimKiem = new ArrayList<>();
        List<LoaiPhong> listLP = new ArrayList<>();
        
        
        
        
        if (tukhoa != null) {
            listTimKiem = dao.TimKiemKhachsans(tukhoa);
            listLP = dao.TimKiemLoaiPhongs(tukhoa);
        }
        
        if (sao != null) {
            listTimKiem = dao.TimKiemKhachsanBySao(sao);
            listLP = dao.TimKiemLoaiphongBySao(sao);
        }
        
        if (giatt != null && giatd != null) {
            listLP = dao.TimKiemLoaiphongByGia(giatt, giatd);
        }

        request.setAttribute("listKSorder", listTimKiem);
        request.setAttribute("listLP", listLP);

        List<Khachsan> list = dao.getAllKhachsan();

        request.setAttribute("listKS", list);

        HttpSession session = request.getSession();
        if (tukhoa != null) {
            session.setAttribute("tukhoa", "với từ khóa '" + tukhoa + "'");
        }
        
        if (sao != null) {
            session.setAttribute("tukhoa",sao + " sao");
        }
        if (giatt != null && giatd != null) {
            session.setAttribute("tukhoa","từ " +giatt+ " đến "+giatd);
        }
        
        session.setAttribute("soluongks", listTimKiem.size()+listLP.size());
        
        

        request.setAttribute("txtS", tukhoa);
        
        request.getRequestDispatcher("Home.jsp").forward(request, response);
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
