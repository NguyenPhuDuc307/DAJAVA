package dao;

import context.DBContext;
import static control.HomeControl.removeAccent;
import entity.Account;
import entity.Datphong;
import entity.Khachhang;
import entity.Khachsan;
import entity.LoaiPhong;
import entity.enQuanlyDP;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.Normalizer;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.regex.Pattern;

/**
 *
 * @author nguye
 */
public class DAO {

    Connection conn = null; //ket noi toi sql
    PreparedStatement ps = null; // nem cau lenh query tu netbean sang sql server
    ResultSet rs = null;

    public List<Khachsan> getAllKhachsan() {
        List<Khachsan> list = new ArrayList<>();
        String query = "select top 8* from tb_Khachsan order by TENKHACHSAN desc";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Khachsan(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteDP(String IDDPCT) {
        String query = "delete from tb_DATPHONGCHITIET where IDDPCT = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, IDDPCT);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Khachsan> getAllKhachsans() {
        List<Khachsan> list = new ArrayList<>();
        String query = "select * from tb_Khachsan order by TENKHACHSAN desc";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Khachsan(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Khachsan> TimKiemKhachsans(String ten) {
        String temp = Normalizer.normalize(ten, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        String kq = pattern.matcher(temp).replaceAll("");
        String kq1 = "%" + kq + "%";
        List<Khachsan> list = new ArrayList<>();
        String query = "SELECT * FROM tb_KHACHSAN WHERE dbo.ufn_removeMark(TENKHACHSAN) LIKE ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, removeAccent(kq1));
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Khachsan(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<LoaiPhong> TimKiemLoaiPhongs(String ten) {
        String temp = Normalizer.normalize(ten, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        String kq = pattern.matcher(temp).replaceAll("");
        String kq1 = "%" + kq + "%";
        List<LoaiPhong> list = new ArrayList<>();
        String query = "SELECT dbo.tb_LOAIPHONG.*, dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHSAN.HANG\n"
                + "FROM dbo.tb_KHACHSAN INNER JOIN dbo.tb_LOAIPHONG\n"
                + "ON dbo.tb_KHACHSAN.MAKHACHSAN = dbo.tb_LOAIPHONG.MAKHACHSAN \n"
                + "WHERE dbo.ufn_removeMark(dbo.tb_LOAIPHONG.TENLOAIPHONG) LIKE ? \n"
                + "OR dbo.ufn_removeMark(dbo.tb_KHACHSAN.TENKHACHSAN) LIKE ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, removeAccent(kq1));
            ps.setString(2, removeAccent(kq1));
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new LoaiPhong(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getInt(7),
                        rs.getBoolean(8),
                        rs.getBoolean(9),
                        rs.getString(10),
                        rs.getInt(11)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Khachsan> TimKiemKhachsanBySao(String sao) {
        List<Khachsan> list = new ArrayList<>();
        String query = "SELECT * FROM tb_KHACHSAN WHERE HANG = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, sao);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Khachsan(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<LoaiPhong> TimKiemLoaiphongBySao(String sao) {
        List<LoaiPhong> list = new ArrayList<>();
        String query = "SELECT dbo.tb_LOAIPHONG.*, dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHSAN.HANG\n"
                + "FROM dbo.tb_KHACHSAN INNER JOIN dbo.tb_LOAIPHONG\n"
                + "ON dbo.tb_KHACHSAN.MAKHACHSAN = dbo.tb_LOAIPHONG.MAKHACHSAN WHERE dbo.tb_KHACHSAN.HANG = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, sao);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new LoaiPhong(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getInt(7),
                        rs.getBoolean(8),
                        rs.getBoolean(9),
                        rs.getString(10),
                        rs.getInt(11)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<LoaiPhong> TimKiemLoaiphongByGia(String giatt, String giatd) {
        List<LoaiPhong> list = new ArrayList<>();
        String query = "SELECT dbo.tb_LOAIPHONG.*, dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHSAN.HANG\n"
                + "FROM dbo.tb_KHACHSAN INNER JOIN dbo.tb_LOAIPHONG\n"
                + "ON dbo.tb_KHACHSAN.MAKHACHSAN = dbo.tb_LOAIPHONG.MAKHACHSAN \n"
                + "WHERE dbo.tb_LOAIPHONG.GIAPHONG >= ? AND dbo.tb_LOAIPHONG.GIAPHONG <= ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, giatt);
            ps.setString(2, giatd);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new LoaiPhong(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getInt(7),
                        rs.getBoolean(8),
                        rs.getBoolean(9),
                        rs.getString(10),
                        rs.getInt(11)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<enQuanlyDP> getQuanlyDP(String MAKS) {
        List<enQuanlyDP> list = new ArrayList<>();
        String query = "SELECT dbo.tb_DATPHONG.GHICHU, dbo.tb_DATPHONG.TRANGTHAI, dbo.tb_DATPHONGCHITIET.SONGUOIO, dbo.tb_DATPHONGCHITIET.GIODAT,\n"
                + "dbo.tb_DATPHONGCHITIET.GIOTRA, dbo.tb_DATPHONGCHITIET.THANHTIEN, dbo.tb_KHACHHANG.HOTEN, dbo.tb_KHACHHANG.DIENTHOAI,\n"
                + "dbo.tb_LOAIPHONG.TENLOAIPHONG, dbo.tb_LOAIPHONG.GIAPHONG, dbo.tb_DATPHONG.IDDATPHONG, dbo.tb_DATPHONGCHITIET.IDDPCT,\n"
                + "dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHHANG.EMAIL\n"
                + "FROM     dbo.tb_DATPHONG INNER JOIN\n"
                + "dbo.tb_DATPHONGCHITIET ON dbo.tb_DATPHONG.IDDATPHONG = dbo.tb_DATPHONGCHITIET.IDDATPHONG INNER JOIN\n"
                + "dbo.tb_KHACHHANG ON dbo.tb_DATPHONG.IDKHACHHANG = dbo.tb_KHACHHANG.IDKHACHHANG INNER JOIN\n"
                + "dbo.tb_LOAIPHONG ON dbo.tb_DATPHONGCHITIET.MALOAIPHONG = dbo.tb_LOAIPHONG.IDLOAIPHONG INNER JOIN\n"
                + "dbo.tb_KHACHSAN ON dbo.tb_LOAIPHONG.MAKHACHSAN = dbo.tb_KHACHSAN.MAKHACHSAN\n"
                + "WHERE dbo.tb_KHACHSAN.MAKHACHSAN = ? ORDER BY dbo.tb_DATPHONGCHITIET.GIODAT desc";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MAKS);
            rs = ps.executeQuery();

            while (rs.next()) {

                int thanhtien;

                Date dNow = new Date();
//                SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                Date ngaydat = rs.getTimestamp(4);
                Date ngaytra = rs.getTimestamp(5);

                Calendar calendar = GregorianCalendar.getInstance();
                calendar.setTime(ngaydat);
                long differenceGio = LocalDateTime.now().getHour() - calendar.get(Calendar.HOUR_OF_DAY);
                long differenceNgay = (ngaydat.getTime() - dNow.getTime()) / 3600000;
                long difference = Math.abs(differenceNgay + differenceGio);

                Calendar calendar1 = GregorianCalendar.getInstance();
                calendar.setTime(ngaytra);
                long differenceGio1 = LocalDateTime.now().getHour() - calendar1.get(Calendar.HOUR_OF_DAY);
                long differenceNgay1 = (ngaytra.getTime() - dNow.getTime()) / 3600000;
                long giooqua = (differenceNgay1 + differenceGio1) * (-1);

                thanhtien = (int) ((int) (rs.getInt(10) + (rs.getInt(10) * (rs.getInt(3) - 1) * 0.7)) * difference / 24);
                if (thanhtien < rs.getInt(10)) {
                    thanhtien = (int) (rs.getInt(10) * 1);
                }

                list.add(new enQuanlyDP(
                        rs.getString(1),
                        rs.getBoolean(2),
                        rs.getInt(3),
                        rs.getTimestamp(4),
                        rs.getTimestamp(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getString(13),
                        (int) difference,
                        thanhtien,
                        (int) giooqua,
                        rs.getString(14)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<enQuanlyDP> getQuanlyDPHN(String MAKS) {
        List<enQuanlyDP> list = new ArrayList<>();
        String query = "SELECT dbo.tb_DATPHONG.GHICHU, dbo.tb_DATPHONG.TRANGTHAI, dbo.tb_DATPHONGCHITIET.SONGUOIO, dbo.tb_DATPHONGCHITIET.GIODAT,\n"
                + "dbo.tb_DATPHONGCHITIET.GIOTRA, dbo.tb_DATPHONGCHITIET.THANHTIEN, dbo.tb_KHACHHANG.HOTEN, dbo.tb_KHACHHANG.DIENTHOAI,\n"
                + "dbo.tb_LOAIPHONG.TENLOAIPHONG, dbo.tb_LOAIPHONG.GIAPHONG, dbo.tb_DATPHONG.IDDATPHONG, dbo.tb_DATPHONGCHITIET.IDDPCT,\n"
                + "dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHHANG.EMAIL\n"
                + "FROM     dbo.tb_DATPHONG INNER JOIN\n"
                + "dbo.tb_DATPHONGCHITIET ON dbo.tb_DATPHONG.IDDATPHONG = dbo.tb_DATPHONGCHITIET.IDDATPHONG INNER JOIN\n"
                + "dbo.tb_KHACHHANG ON dbo.tb_DATPHONG.IDKHACHHANG = dbo.tb_KHACHHANG.IDKHACHHANG INNER JOIN\n"
                + "dbo.tb_LOAIPHONG ON dbo.tb_DATPHONGCHITIET.MALOAIPHONG = dbo.tb_LOAIPHONG.IDLOAIPHONG INNER JOIN\n"
                + "dbo.tb_KHACHSAN ON dbo.tb_LOAIPHONG.MAKHACHSAN = dbo.tb_KHACHSAN.MAKHACHSAN\n"
                + "WHERE dbo.tb_KHACHSAN.MAKHACHSAN = ? AND dbo.tb_DATPHONGCHITIET.GIODAT > CONVERT (Date, GETDATE()) AND dbo.tb_DATPHONGCHITIET.GIODAT <= DATEADD(day, 1, CONVERT (Date, GETDATE()))\n"
                + "ORDER BY dbo.tb_DATPHONGCHITIET.GIODAT desc";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MAKS);
            rs = ps.executeQuery();

            while (rs.next()) {

                int thanhtien;

                Date dNow = new Date();
//                SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                Date ngaydat = rs.getTimestamp(4);
                Date ngaytra = rs.getTimestamp(5);
                Calendar calendar = GregorianCalendar.getInstance();
                calendar.setTime(ngaydat);
                long differenceGio = LocalDateTime.now().getHour() - calendar.get(Calendar.HOUR_OF_DAY);
                long differenceNgay = (ngaydat.getTime() - dNow.getTime()) / 3600000;
                long difference = Math.abs(differenceNgay + differenceGio);

                Calendar calendar1 = GregorianCalendar.getInstance();
                calendar.setTime(ngaytra);
                long differenceGio1 = LocalDateTime.now().getHour() - calendar1.get(Calendar.HOUR_OF_DAY);
                long differenceNgay1 = (ngaytra.getTime() - dNow.getTime()) / 3600000;
                long giooqua = (differenceNgay1 + differenceGio1) * (-1);

                thanhtien = (int) ((int) (rs.getInt(10) + (rs.getInt(10) * (rs.getInt(3) - 1) * 0.7)) * difference / 24);
                if (thanhtien < rs.getInt(10)) {
                    thanhtien = (int) (rs.getInt(10) * 1);
                }

                list.add(new enQuanlyDP(
                        rs.getString(1),
                        rs.getBoolean(2),
                        rs.getInt(3),
                        rs.getTimestamp(4),
                        rs.getTimestamp(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getString(13),
                        (int) difference,
                        thanhtien,
                        (int) giooqua,
                        rs.getString(14)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<enQuanlyDP> getQuanlyDPTUAN(String MAKS) {
        List<enQuanlyDP> list = new ArrayList<>();
        String query = "SELECT dbo.tb_DATPHONG.GHICHU, dbo.tb_DATPHONG.TRANGTHAI, dbo.tb_DATPHONGCHITIET.SONGUOIO, dbo.tb_DATPHONGCHITIET.GIODAT,\n"
                + "dbo.tb_DATPHONGCHITIET.GIOTRA, dbo.tb_DATPHONGCHITIET.THANHTIEN, dbo.tb_KHACHHANG.HOTEN, dbo.tb_KHACHHANG.DIENTHOAI,\n"
                + "dbo.tb_LOAIPHONG.TENLOAIPHONG, dbo.tb_LOAIPHONG.GIAPHONG, dbo.tb_DATPHONG.IDDATPHONG, dbo.tb_DATPHONGCHITIET.IDDPCT,\n"
                + "dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHHANG.EMAIL\n"
                + "FROM     dbo.tb_DATPHONG INNER JOIN\n"
                + "dbo.tb_DATPHONGCHITIET ON dbo.tb_DATPHONG.IDDATPHONG = dbo.tb_DATPHONGCHITIET.IDDATPHONG INNER JOIN\n"
                + "dbo.tb_KHACHHANG ON dbo.tb_DATPHONG.IDKHACHHANG = dbo.tb_KHACHHANG.IDKHACHHANG INNER JOIN\n"
                + "dbo.tb_LOAIPHONG ON dbo.tb_DATPHONGCHITIET.MALOAIPHONG = dbo.tb_LOAIPHONG.IDLOAIPHONG INNER JOIN\n"
                + "dbo.tb_KHACHSAN ON dbo.tb_LOAIPHONG.MAKHACHSAN = dbo.tb_KHACHSAN.MAKHACHSAN\n"
                + "WHERE dbo.tb_KHACHSAN.MAKHACHSAN = ? AND dbo.tb_DATPHONGCHITIET.GIODAT > CONVERT (Date, DATEADD(dd, -(DATEPART(dw, GETDATE())-1), GETDATE())) AND dbo.tb_DATPHONGCHITIET.GIODAT <= DATEADD(day, 1, CONVERT (Date, DATEADD(dd, 7-(DATEPART(dw, GETDATE())), GETDATE())))\n"
                + "ORDER BY dbo.tb_DATPHONGCHITIET.GIODAT desc";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MAKS);
            rs = ps.executeQuery();

            while (rs.next()) {

                int thanhtien;

                Date dNow = new Date();
//                SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                Date ngaydat = rs.getTimestamp(4);
                Date ngaytra = rs.getTimestamp(5);

                Calendar calendar = GregorianCalendar.getInstance();
                calendar.setTime(ngaydat);
                long differenceGio = LocalDateTime.now().getHour() - calendar.get(Calendar.HOUR_OF_DAY);
                long differenceNgay = (ngaydat.getTime() - dNow.getTime()) / 3600000;
                long difference = Math.abs(differenceNgay + differenceGio);

                Calendar calendar1 = GregorianCalendar.getInstance();
                calendar.setTime(ngaytra);
                long differenceGio1 = LocalDateTime.now().getHour() - calendar1.get(Calendar.HOUR_OF_DAY);
                long differenceNgay1 = (ngaytra.getTime() - dNow.getTime()) / 3600000;
                long giooqua = (differenceNgay1 + differenceGio1) * (-1);

                thanhtien = (int) ((int) (rs.getInt(10) + (rs.getInt(10) * (rs.getInt(3) - 1) * 0.7)) * difference / 24);
                if (thanhtien < rs.getInt(10)) {
                    thanhtien = (int) (rs.getInt(10) * 1);
                }

                list.add(new enQuanlyDP(
                        rs.getString(1),
                        rs.getBoolean(2),
                        rs.getInt(3),
                        rs.getTimestamp(4),
                        rs.getTimestamp(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getString(13),
                        (int) difference,
                        thanhtien,
                        (int) giooqua,
                        rs.getString(14)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<enQuanlyDP> getQuanlyDPTHANG(String MAKS) {
        List<enQuanlyDP> list = new ArrayList<>();
        String query = "SELECT dbo.tb_DATPHONG.GHICHU, dbo.tb_DATPHONG.TRANGTHAI, dbo.tb_DATPHONGCHITIET.SONGUOIO, dbo.tb_DATPHONGCHITIET.GIODAT,\n"
                + "dbo.tb_DATPHONGCHITIET.GIOTRA, dbo.tb_DATPHONGCHITIET.THANHTIEN, dbo.tb_KHACHHANG.HOTEN, dbo.tb_KHACHHANG.DIENTHOAI,\n"
                + "dbo.tb_LOAIPHONG.TENLOAIPHONG, dbo.tb_LOAIPHONG.GIAPHONG, dbo.tb_DATPHONG.IDDATPHONG, dbo.tb_DATPHONGCHITIET.IDDPCT,\n"
                + "dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHHANG.EMAIL\n"
                + "FROM     dbo.tb_DATPHONG INNER JOIN\n"
                + "dbo.tb_DATPHONGCHITIET ON dbo.tb_DATPHONG.IDDATPHONG = dbo.tb_DATPHONGCHITIET.IDDATPHONG INNER JOIN\n"
                + "dbo.tb_KHACHHANG ON dbo.tb_DATPHONG.IDKHACHHANG = dbo.tb_KHACHHANG.IDKHACHHANG INNER JOIN\n"
                + "dbo.tb_LOAIPHONG ON dbo.tb_DATPHONGCHITIET.MALOAIPHONG = dbo.tb_LOAIPHONG.IDLOAIPHONG INNER JOIN\n"
                + "dbo.tb_KHACHSAN ON dbo.tb_LOAIPHONG.MAKHACHSAN = dbo.tb_KHACHSAN.MAKHACHSAN\n"
                + "WHERE dbo.tb_KHACHSAN.MAKHACHSAN = ? AND dbo.tb_DATPHONGCHITIET.GIODAT > CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(GETDATE())-1),GETDATE()),101) \n"
                + "AND dbo.tb_DATPHONGCHITIET.GIODAT <= CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,GETDATE()))),DATEADD(mm,1,GETDATE())),101)\n"
                + "ORDER BY dbo.tb_DATPHONGCHITIET.GIODAT desc";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MAKS);
            rs = ps.executeQuery();

            while (rs.next()) {

                int thanhtien;

                Date dNow = new Date();
//                SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                Date ngaydat = rs.getTimestamp(4);
                Date ngaytra = rs.getTimestamp(5);

                Calendar calendar = GregorianCalendar.getInstance();
                calendar.setTime(ngaydat);
                long differenceGio = LocalDateTime.now().getHour() - calendar.get(Calendar.HOUR_OF_DAY);
                long differenceNgay = (ngaydat.getTime() - dNow.getTime()) / 3600000;
                long difference = Math.abs(differenceNgay + differenceGio);

                Calendar calendar1 = GregorianCalendar.getInstance();
                calendar.setTime(ngaytra);
                long differenceGio1 = LocalDateTime.now().getHour() - calendar1.get(Calendar.HOUR_OF_DAY);
                long differenceNgay1 = (ngaytra.getTime() - dNow.getTime()) / 3600000;
                long giooqua = (differenceNgay1 + differenceGio1) * (-1);

                thanhtien = (int) ((int) (rs.getInt(10) + (rs.getInt(10) * (rs.getInt(3) - 1) * 0.7)) * difference / 24);
                if (thanhtien < rs.getInt(10)) {
                    thanhtien = (int) (rs.getInt(10) * 1);
                }

                list.add(new enQuanlyDP(
                        rs.getString(1),
                        rs.getBoolean(2),
                        rs.getInt(3),
                        rs.getTimestamp(4),
                        rs.getTimestamp(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getString(13),
                        (int) difference,
                        thanhtien,
                        (int) giooqua,
                        rs.getString(14)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<enQuanlyDP> getDatPhong(int ID) {
        List<enQuanlyDP> list = new ArrayList<>();
        String query = "SELECT dbo.tb_DATPHONG.GHICHU, dbo.tb_DATPHONG.TRANGTHAI, dbo.tb_DATPHONGCHITIET.SONGUOIO, dbo.tb_DATPHONGCHITIET.GIODAT, \n"
                + "                  dbo.tb_DATPHONGCHITIET.GIOTRA, dbo.tb_DATPHONGCHITIET.THANHTIEN, dbo.tb_KHACHHANG.HOTEN, dbo.tb_KHACHHANG.DIENTHOAI, \n"
                + "                  dbo.tb_LOAIPHONG.TENLOAIPHONG, dbo.tb_LOAIPHONG.GIAPHONG, dbo.tb_DATPHONG.IDDATPHONG, dbo.tb_DATPHONGCHITIET.IDDPCT, "
                + "                   dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHHANG.EMAIL\n"
                + "FROM     dbo.tb_DATPHONG INNER JOIN\n"
                + "                  dbo.tb_DATPHONGCHITIET ON dbo.tb_DATPHONG.IDDATPHONG = dbo.tb_DATPHONGCHITIET.IDDATPHONG INNER JOIN\n"
                + "                  dbo.tb_KHACHHANG ON dbo.tb_DATPHONG.IDKHACHHANG = dbo.tb_KHACHHANG.IDKHACHHANG INNER JOIN\n"
                + "                  dbo.tb_LOAIPHONG ON dbo.tb_DATPHONGCHITIET.MALOAIPHONG = dbo.tb_LOAIPHONG.IDLOAIPHONG INNER JOIN\n"
                + "                  dbo.tb_KHACHSAN ON dbo.tb_LOAIPHONG.MAKHACHSAN = dbo.tb_KHACHSAN.MAKHACHSAN\n"
                + "WHERE dbo.tb_KHACHHANG.IDKHACHHANG = ? ORDER BY dbo.tb_DATPHONGCHITIET.GIODAT desc";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, ID);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new enQuanlyDP(
                        rs.getString(1),
                        rs.getBoolean(2),
                        rs.getInt(3),
                        rs.getTimestamp(4),
                        rs.getTimestamp(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getString(13),
                        0,
                        0,
                        0,
                        rs.getString(14)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<enQuanlyDP> getDatPhongChuaTT(int ID) {
        List<enQuanlyDP> list = new ArrayList<>();
        String query = "SELECT dbo.tb_DATPHONG.GHICHU, dbo.tb_DATPHONG.TRANGTHAI, dbo.tb_DATPHONGCHITIET.SONGUOIO, dbo.tb_DATPHONGCHITIET.GIODAT, \n"
                + "                  dbo.tb_DATPHONGCHITIET.GIOTRA, dbo.tb_DATPHONGCHITIET.THANHTIEN, dbo.tb_KHACHHANG.HOTEN, dbo.tb_KHACHHANG.DIENTHOAI, \n"
                + "                  dbo.tb_LOAIPHONG.TENLOAIPHONG, dbo.tb_LOAIPHONG.GIAPHONG, dbo.tb_DATPHONG.IDDATPHONG, dbo.tb_DATPHONGCHITIET.IDDPCT, "
                + "                   dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHHANG.EMAIL\n"
                + "FROM     dbo.tb_DATPHONG INNER JOIN\n"
                + "                  dbo.tb_DATPHONGCHITIET ON dbo.tb_DATPHONG.IDDATPHONG = dbo.tb_DATPHONGCHITIET.IDDATPHONG INNER JOIN\n"
                + "                  dbo.tb_KHACHHANG ON dbo.tb_DATPHONG.IDKHACHHANG = dbo.tb_KHACHHANG.IDKHACHHANG INNER JOIN\n"
                + "                  dbo.tb_LOAIPHONG ON dbo.tb_DATPHONGCHITIET.MALOAIPHONG = dbo.tb_LOAIPHONG.IDLOAIPHONG INNER JOIN\n"
                + "                  dbo.tb_KHACHSAN ON dbo.tb_LOAIPHONG.MAKHACHSAN = dbo.tb_KHACHSAN.MAKHACHSAN\n"
                + "WHERE dbo.tb_KHACHHANG.IDKHACHHANG = ? AND dbo.tb_DATPHONG.TRANGTHAI = 'false' ORDER BY dbo.tb_DATPHONGCHITIET.GIODAT desc";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, ID);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new enQuanlyDP(
                        rs.getString(1),
                        rs.getBoolean(2),
                        rs.getInt(3),
                        rs.getTimestamp(4),
                        rs.getTimestamp(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getString(13),
                        0,
                        0,
                        0,
                        rs.getString(14)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<enQuanlyDP> getQuanlyDPChuaTT(String MAKS) {
        List<enQuanlyDP> list = new ArrayList<>();
        String query = "SELECT dbo.tb_DATPHONG.GHICHU, dbo.tb_DATPHONG.TRANGTHAI, dbo.tb_DATPHONGCHITIET.SONGUOIO, dbo.tb_DATPHONGCHITIET.GIODAT, \n"
                + "                  dbo.tb_DATPHONGCHITIET.GIOTRA, dbo.tb_DATPHONGCHITIET.THANHTIEN, dbo.tb_KHACHHANG.HOTEN, dbo.tb_KHACHHANG.DIENTHOAI, \n"
                + "                  dbo.tb_LOAIPHONG.TENLOAIPHONG, dbo.tb_LOAIPHONG.GIAPHONG, dbo.tb_DATPHONG.IDDATPHONG, dbo.tb_DATPHONGCHITIET.IDDPCT, "
                + "                   dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHHANG.EMAIL\n"
                + "FROM     dbo.tb_DATPHONG INNER JOIN\n"
                + "                  dbo.tb_DATPHONGCHITIET ON dbo.tb_DATPHONG.IDDATPHONG = dbo.tb_DATPHONGCHITIET.IDDATPHONG INNER JOIN\n"
                + "                  dbo.tb_KHACHHANG ON dbo.tb_DATPHONG.IDKHACHHANG = dbo.tb_KHACHHANG.IDKHACHHANG INNER JOIN\n"
                + "                  dbo.tb_LOAIPHONG ON dbo.tb_DATPHONGCHITIET.MALOAIPHONG = dbo.tb_LOAIPHONG.IDLOAIPHONG INNER JOIN\n"
                + "                  dbo.tb_KHACHSAN ON dbo.tb_LOAIPHONG.MAKHACHSAN = dbo.tb_KHACHSAN.MAKHACHSAN\n"
                + "WHERE dbo.tb_KHACHSAN.MAKHACHSAN = ? AND dbo.tb_DATPHONG.TRANGTHAI = 'false' ORDER BY dbo.tb_DATPHONGCHITIET.GIODAT desc";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MAKS);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new enQuanlyDP(
                        rs.getString(1),
                        rs.getBoolean(2),
                        rs.getInt(3),
                        rs.getTimestamp(4),
                        rs.getTimestamp(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getString(13),
                        0,
                        0,
                        0,
                        rs.getString(14)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void editDatPhong(String IDDP) {
        String query = "UPDATE [dbo].[tb_DATPHONG]\n"
                + "SET TRANGTHAI = 'true'\n"
                + "WHERE IDDATPHONG = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, IDDP);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editDatPhongCT(String ngaytra, int thanhtien, String iddpct) {
        String query = "UPDATE [dbo].[tb_DATPHONGCHITIET]\n"
                + "SET GIOTRA = ?, THANHTIEN = ?\n"
                + "WHERE IDDPCT = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ngaytra);
            ps.setInt(2, thanhtien);
            ps.setString(3, iddpct);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void Datlaimatkhau(String email, String pass) {
        String query = "UPDATE [dbo].[tb_KHACHHANG] SET PASSWORD = ? WHERE EMAIL = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pass);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void DatlaimatkhauTK(String email, String pass) {
        String query = "UPDATE [dbo].[tb_TAIKHOAN] SET PASSWORD = ? WHERE EMAIL = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pass);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Khachsan> getAllKhachsanTen() {
        List<Khachsan> list = new ArrayList<>();
        String query = "select* from tb_Khachsan order by TENKHACHSAN";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Khachsan(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Khachsan> getAllKhachsanPage(int index) {
        List<Khachsan> list = new ArrayList<>();
        index = (index - 1) * 5;
        String query = "select * from tb_KHACHSAN order by TENKHACHSAN offset ? rows fetch next 5 rows only;";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, index);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Khachsan(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    //    lấy khách sạn mới nhất
    public Khachsan getLast() {
        String query = "select top 1 * from tb_Khachsan order by MAKHACHSAN desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Khachsan(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

//    lấy tất cả loại phòng
    public List<LoaiPhong> getAllLoaiphong() {
        List<LoaiPhong> list = new ArrayList<>();
        String query = "SELECT dbo.tb_LOAIPHONG.*, dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHSAN.HANG \n"
                + "FROM dbo.tb_KHACHSAN INNER JOIN dbo.tb_LOAIPHONG \n"
                + "ON dbo.tb_KHACHSAN.MAKHACHSAN = dbo.tb_LOAIPHONG.MAKHACHSAN";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new LoaiPhong(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getInt(7),
                        rs.getBoolean(8),
                        rs.getBoolean(9),
                        rs.getString(10),
                        rs.getInt(11)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<LoaiPhong> getAllLoaiphongPage(int index) {
        List<LoaiPhong> list = new ArrayList<>();
        index = (index - 1) * 5;
        String query = "SELECT dbo.tb_LOAIPHONG.*, dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHSAN.HANG \n"
                + "FROM dbo.tb_KHACHSAN INNER JOIN dbo.tb_LOAIPHONG \n"
                + "ON dbo.tb_KHACHSAN.MAKHACHSAN = dbo.tb_LOAIPHONG.MAKHACHSAN "
                + "order by dbo.tb_LOAIPHONG.IDLOAIPHONG offset ? rows fetch next 5 rows only;";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, index);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new LoaiPhong(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getInt(7),
                        rs.getBoolean(8),
                        rs.getBoolean(9),
                        rs.getString(10),
                        rs.getInt(11)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

//    lấy danh sách sách loại phòng theo khách sạn
    public List<LoaiPhong> getAllLoaiphongByMaKS(String id) {
        List<LoaiPhong> list = new ArrayList<>();
        String query = "SELECT dbo.tb_LOAIPHONG.*, dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHSAN.HANG \n"
                + "FROM dbo.tb_KHACHSAN INNER JOIN dbo.tb_LOAIPHONG \n"
                + "ON dbo.tb_KHACHSAN.MAKHACHSAN = dbo.tb_LOAIPHONG.MAKHACHSAN where dbo.tb_LOAIPHONG.MAKHACHSAN = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new LoaiPhong(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getInt(7),
                        rs.getBoolean(8),
                        rs.getBoolean(9),
                        rs.getString(10),
                        rs.getInt(11)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

//    lấy khách sạn theo mã khách sạn
    public Khachsan getKSByMA(String id) {
        String query = "select * from tb_Khachsan where MAKHACHSAN = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Khachsan(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public LoaiPhong getLoaiPhongKhachsan(String id) {
        String query = "SELECT dbo.tb_LOAIPHONG.*, dbo.tb_KHACHSAN.TENKHACHSAN, dbo.tb_KHACHSAN.HANG \n"
                + "FROM dbo.tb_KHACHSAN INNER JOIN dbo.tb_LOAIPHONG \n"
                + "ON dbo.tb_KHACHSAN.MAKHACHSAN = dbo.tb_LOAIPHONG.MAKHACHSAN \n"
                + "where dbo.tb_LOAIPHONG.IDLOAIPHONG = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new LoaiPhong(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getInt(7),
                        rs.getBoolean(8),
                        rs.getBoolean(9),
                        rs.getString(10),
                        rs.getInt(11)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account LoginAD(String email, String password) {
        String query = "select * from tb_TAIKHOAN	\n"
                + "where EMAIL = ?\n"
                + "and PASSWORD = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account LoginADid(String id, String password) {
        String query = "select * from tb_TAIKHOAN\n"
                + "where IDTAIKHOAN = ?\n"
                + "and PASSWORD = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Khachhang LoginKH(String email, String password) {
        String query = "select * from tb_KHACHHANG	\n"
                + "where EMAIL = ? \n"
                + "and PASSWORD = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Khachhang(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Khachhang LoginKHid(String id, String password) {
        String query = "select * from tb_KHACHHANG\n"
                + "where IDKHACHHANG = ? \n"
                + "and PASSWORD = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Khachhang(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Khachhang getKH(String id) {
        String query = "select * from tb_KHACHHANG where IDKHACHHANG = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Khachhang(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Khachhang checkExist(String email) {
        String query = "select * from tb_KHACHHANG \n"
                + "where EMAIL = ?\n";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Khachhang(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signup(String hoten, String dienthoai, String email, String password) {
        String query = "insert into [dbo].[tb_KHACHHANG]"
                + "([HOTEN],[DIENTHOAI],[EMAIL],[PASSWORD],[HINHANH],[XACNHAN])"
                + "values (?,?,?,?,null,'false')";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, hoten);
            ps.setString(2, dienthoai);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void kichhoat(String idkh) {
        String query = "UPDATE [dbo].[tb_KHACHHANG] SET XACNHAN = 'true' WHERE IDKHACHHANG = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, idkh);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addDatphong(int idkh, String ghichu, boolean trangthai) {
        String query = "INSERT INTO [dbo].[tb_DATPHONG]([IDKHACHHANG],[GHICHU],[TRANGTHAI]) VALUES (?,?,?)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idkh);
            ps.setString(2, ghichu);
            ps.setBoolean(3, trangthai);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Datphong getDatphong(int IDKHACHHANG) {
        String query = "select top 1 * from tb_DATPHONG where IDKHACHHANG = ? order by IDDATPHONG desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, IDKHACHHANG);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Datphong(
                        rs.getInt(1),
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getBoolean(3));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void DatphongCT(int mlp, int iddp, int song, String gdDateTime, String gtDateTime, int tt) {
        String query = "INSERT INTO [dbo].[tb_DATPHONGCHITIET]([MALOAIPHONG],[IDDATPHONG],[SONGUOIO],[GIODAT],[GIOTRA],[THANHTIEN]) VALUES(?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mlp);
            ps.setInt(2, iddp);
            ps.setInt(3, song);
            ps.setString(4, gdDateTime);
            ps.setString(5, gtDateTime);
            ps.setInt(6, tt);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<enQuanlyDP> list = dao.getQuanlyDP("KS1");
        for (enQuanlyDP k : list) {
            System.out.println(k);
        }
    }

}
