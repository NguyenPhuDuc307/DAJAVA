package control;

import dao.DAO;
import entity.Datphong;
import entity.LoaiPhong;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Adddatphong", urlPatterns = {"/adddatphong"})
public class Adddatphong extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        DAO dao = new DAO();
        
        int IDKHACHHANG = Integer.valueOf(request.getParameter("IDKHACHHANG"));
        String GHICHU = request.getParameter("GHICHU");
        String tenkhachsan = request.getParameter("tenkhachsan");
        Boolean TRANGTHAI = false;
        
        dao.addDatphong(IDKHACHHANG, GHICHU, TRANGTHAI);
        
        int MALOAIPHONG = Integer.valueOf(request.getParameter("MALOAIPHONG"));
        int SONGUOIO = Integer.valueOf(request.getParameter("SONGUOIO"));
        
        String gdDateTime = request.getParameter("gdDate")+" "+request.getParameter("gdTime");
        String gtDateTime = request.getParameter("gtDate")+" "+request.getParameter("gtTime");
        

        LocalTime giodat = LocalTime.parse(request.getParameter("gdTime"));
        LocalTime giotra = LocalTime.parse(request.getParameter("gtTime"));
        long differenceGio = giotra.getHour()- giodat.getHour();
        SimpleDateFormat df=new SimpleDateFormat ("yyyy-MM-dd");
        Date ngaydat=df.parse (request.getParameter("gdDate"));
        Date ngaytra=df.parse (request.getParameter("gtDate"));
        long differenceNgay = (ngaytra.getTime()- ngaydat.getTime())/3600000;
        long difference = differenceNgay + differenceGio;
        Datphong datphong = dao.getDatphong(IDKHACHHANG);
        String idLP = request.getParameter("idLP");
        LoaiPhong loaiPhong = dao.getLoaiPhongKhachsan(idLP);
        Float giaphong = loaiPhong.getGIAPHONG();
        int thanhtien;
        thanhtien = (int) ((int) (giaphong+ (giaphong*(SONGUOIO-1)*0.7))*difference/24) ;
        if(thanhtien<giaphong) 
        {
            thanhtien = (int) (giaphong*1);
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("maloaiphong", MALOAIPHONG);
        session.setAttribute("idkh", IDKHACHHANG);
        session.setAttribute("songuoi", SONGUOIO);
        session.setAttribute("ngayden", gdDateTime);
        session.setAttribute("ngaydi", gtDateTime);
        session.setAttribute("thanhtien", thanhtien);
        session.setAttribute("tenkhachsan", tenkhachsan);
        session.setAttribute("ghichu", GHICHU);
        session.setAttribute("idDP", datphong.getIDDATPHONG());
        session.setAttribute("giaphong", giaphong);
        session.setAttribute("loaiphong1", loaiPhong.getTENLOAIPHONG());
        session.setAttribute("idDP1", datphong.getIDDATPHONG());
        session.setAttribute("sogio", difference);
        
        //dao.DatphongCT(MALOAIPHONG, datphong.getIDDATPHONG(), SONGUOIO, gdDateTime, gtDateTime, thanhtien);
        
        response.sendRedirect("Thanhtoan.jsp");
        
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
            Logger.getLogger(Adddatphong.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Adddatphong.class.getName()).log(Level.SEVERE, null, ex);
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
