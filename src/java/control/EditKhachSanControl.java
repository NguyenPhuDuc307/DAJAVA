package control;

import dao.objKhachSan;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "EditKhachSanControl", urlPatterns = {"/EditKhachSanControl"})
public class EditKhachSanControl extends HttpServlet {

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
        RequestDispatcher rd = request.getRequestDispatcher("EditKhachSan.jsp");
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

            String hinh;
            String repaString = request.getServletContext().getRealPath("/images");
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            if (filename == null || filename.equals("")) {
                filename = request.getParameter("ha");
                hinh = filename;
            } else {
                part.write(repaString + "/" + filename);
                hinh = "images/" + filename;
            }
            String maks = request.getParameter("maks");
            String tenks = request.getParameter("tenkhachsan");
            String diachi = request.getParameter("diachi");
            String ggmap = request.getParameter("ggmap");
            String mota = request.getParameter("mota");
            int hang = Integer.valueOf(request.getParameter("hang"));
            Boolean ngung = Boolean.valueOf(request.getParameter("ngung"));
            objKhachSan dao = new objKhachSan();
            dao.editKhachSan(tenks, diachi, ggmap, hinh, mota, hang, ngung, maks);
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
