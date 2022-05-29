package control;

import dao.objKhachSan;
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
import javax.servlet.http.Part;

/**
 *
 * @author bigbo
 */
@MultipartConfig
@WebServlet(name = "AddKhachSanControl", urlPatterns = {"/AddKhachSanControl"})
public class AddKhachSanControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
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
        RequestDispatcher rd = request.getRequestDispatcher("KhachSan.jsp");
        rd.forward(request, response);
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

            String MAKHACHSAN = request.getParameter("MAKHACHSAN");
            String TENKHACHSAN = request.getParameter("TENKHACHSAN");
            String DIACHI = request.getParameter("DIACHI");
            String MOTA = request.getParameter("MOTA");
            String GGMAP = request.getParameter("GGMAP");
            int HANG = Integer.valueOf(request.getParameter("HANG"));
            Boolean NGUNG = Boolean.valueOf(request.getParameter("NGUNG"));

            objKhachSan dao = new objKhachSan();
            dao.addKhachSan(MAKHACHSAN, TENKHACHSAN, DIACHI, GGMAP, HINHANH, MOTA, HANG, NGUNG);
            response.sendRedirect("KhachSanControl");

        } catch (Exception e) {
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
