package control;

import dao.DAO;
import entity.Khachsan;
import entity.LoaiPhong;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.Normalizer;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

@WebServlet(name = "HomeControl", urlPatterns = {"/home"})
public class HomeControl extends HttpServlet {

    public static String removeAccent(String s) {

        String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(temp).replaceAll("");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        DAO dao = new DAO();
        
        HttpSession session = request.getSession();
                session.setAttribute("soluongks", null);

        List<Khachsan> list = dao.getAllKhachsan();

        String indexKSString = request.getParameter("idKS");
        if(indexKSString == null) indexKSString = "1";
        int indexKS = Integer.parseInt(indexKSString);
        List<Khachsan> listorder = dao.getAllKhachsanPage(indexKS);
        List<Khachsan> listKS = dao.getAllKhachsanTen();
        int countKS = listKS.size();
        if(countKS%5!=0)
            countKS = countKS/5+1;
        else
            countKS = countKS/5;
        request.setAttribute("countKS", countKS);
        request.setAttribute("countAllKS", listKS.size());
        request.setAttribute("listKSorder", listorder);
        session.setAttribute("truocdoKS", indexKS-1);
        session.setAttribute("ketiepKS", indexKS+1);
        
        
        
        
        String indexLPString = request.getParameter("idLP");
        if(indexLPString == null) indexLPString = "1";
        int indexLP = Integer.parseInt(indexLPString);
        List<LoaiPhong> listLP = dao.getAllLoaiphongPage(indexLP);
        List<LoaiPhong> listallLoaiPhongs = dao.getAllLoaiphong();
        int countLP = listallLoaiPhongs.size();
        if(countLP%5!=0)
            countLP = countLP/5+1;
        else
            countLP = countLP/5;
        request.setAttribute("countLP", countLP);
        request.setAttribute("countAllLP", listallLoaiPhongs.size());
        request.setAttribute("listLP", listLP);
        session.setAttribute("truocdoLP", indexLP-1);
        session.setAttribute("ketiepLP", indexLP+1);
        session.removeAttribute("mes");
        
        request.setAttribute("listKS", list);
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
