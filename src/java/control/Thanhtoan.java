package control;

import dao.DAO;
import entity.enQuanlyDP;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Thanhtoan", urlPatterns = {"/thanhtoan"})
public class Thanhtoan extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        DAO dao = new DAO();

        int MALOAIPHONG = Integer.valueOf(request.getParameter("maloaiphong"));
        int idkh = Integer.valueOf(request.getParameter("idkh"));
        int IDDATPHONG = Integer.valueOf(request.getParameter("idDP"));
        String email = request.getParameter("email");
        String hoten = request.getParameter("hoten");
        String dienthoai = request.getParameter("dienthoai");
        String loaiphong = request.getParameter("loaiphong");
        String tenkhachsan = request.getParameter("tenkhachsan");
        int SONGUOIO = Integer.valueOf(request.getParameter("songuoi"));
        String gdDateTime = request.getParameter("ngayden");
        String gtDateTime = request.getParameter("ngaydi");
        int thanhtien = Integer.valueOf(request.getParameter("thanhtien"));

        dao.DatphongCT(MALOAIPHONG, IDDATPHONG, SONGUOIO, gdDateTime, gtDateTime, thanhtien);

        String tieude = "Chuc mung! Ban da dat phong thanh cong";
        String message = "<!DOCTYPE html>\n"
                + "<html>\n"
                + "        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\n"
                + "    </head>\n"
                + "    <body>\n"
                + "        <div class=\"container\">\n"
                + "            <h3>Ch??c m???ng b???n ???? ?????t ph??ng th??nh c??ng t???i <b style=\"color:blue\">VN</b><b style=\"color:orange\">BOOKING</b></h3>\n"
                + "            <div>Th??ng tin ?????t ph??ng c???a b???n:</div>\n"
                + "            <div>H??? t??n : " + hoten + "</div>\n"
                + "            <div>S??? ??i???n tho???i : " + dienthoai + "</div>\n"
                + "            <div>Kh??ch s???n : " + tenkhachsan + "</div>\n"
                + "            <div>Lo???i ph??ng : " + loaiphong + "</div>\n"
                + "            <div>S??? ng?????i ??? : " + SONGUOIO + "</div>\n"
                + "            <div>Gi??? nh???n ph??ng : " + gdDateTime + "</div>\n"
                + "            <div>Gi??? tr??? ph??ng : " + gtDateTime + "</div>\n"
                + "            <div>Th??nh ti???n : " + thanhtien +  "VND</div>\n"
                + "            <h3>C???m ??n b???n ???? ?????t ph??ng!</h3>\n"
                + "        </div>\n"
                + "    </body>\n"
                + "</html>";
        SeenMail.send(email, tieude, message, "nguyenphuduc62001@gmail.com", "Phuduc@30072001");

        List<enQuanlyDP> listDP = dao.getDatPhongChuaTT(idkh);

        HttpSession session = request.getSession();
        session.setAttribute("count", listDP.size());
        session.setAttribute("tb", "true");
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
