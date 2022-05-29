package control;

import dao.DAO;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nguye
 */
@WebServlet(name = "EditDatPhong", urlPatterns = {"/editdatphong"})
public class EditDatPhong extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
//        giotra     
        Date dNow = new Date();
        SimpleDateFormat ft =  new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        String ngaytra = ft.format(dNow);
        
//        thanhtien
        int thanhtien;
        int giaphong = Integer.valueOf(request.getParameter("giaphong"));
        int songuoi = Integer.valueOf(request.getParameter("songuoi"));
        
        String ngaydatString = request.getParameter("ngaydat");
        
        Date ngaydat = ft.parse(ngaydatString);
        
        Calendar calendar = GregorianCalendar.getInstance();
        
        calendar.setTime(ngaydat);
        
        long differenceGio = LocalDateTime.now().getHour()- calendar.get(Calendar.HOUR_OF_DAY);
        
        long differenceNgay = (ngaydat.getTime()- dNow.getTime())/3600000;
        
        long difference = Math.abs(differenceNgay + differenceGio);
        
        thanhtien = (int) ((int) (giaphong+ (giaphong*(songuoi-1)*0.7))*difference/24) ;
        
        if(thanhtien<giaphong) 
        {
            thanhtien = (int) (giaphong*1);
        }
        
        DAO dao = new DAO();
//        idDP
        String idDP = request.getParameter("iddatphong");
        String iddpct = request.getParameter("iddpct");
        dao.editDatPhong(idDP);
        
        dao.editDatPhongCT(ngaytra, thanhtien, iddpct);
        
        response.sendRedirect("quanlydatphong");
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
        } catch (ParseException ex) {
            Logger.getLogger(EditDatPhong.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(EditDatPhong.class.getName()).log(Level.SEVERE, null, ex);
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
