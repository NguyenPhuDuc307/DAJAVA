package dao;

import context.DBContext;
import entity.Account;
import entity.Datphong;
import entity.Khachhang;
import entity.Khachsan;
import entity.LoaiPhong;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nguye
 */
public class DAO {
    Connection conn = null; //ket noi toi sql
    PreparedStatement ps = null; // nem cau lenh query tu netbean sang sql server
    ResultSet rs = null;
    
    public List<Khachsan> getAllKhachsan(){
        List<Khachsan> list = new ArrayList<>();
        String query = "select* from tb_Khachsan order by TENKHACHSAN desc";
        
        try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
                
                while(rs.next()){
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
    
    public List<Khachsan> getAllKhachsanTen(){
        List<Khachsan> list = new ArrayList<>();
        String query = "select* from tb_Khachsan order by TENKHACHSAN";
        
        try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
                
                while(rs.next()){
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
    public List<LoaiPhong> getAllLoaiphong(){
        List<LoaiPhong> list = new ArrayList<>();
        String query = "select* from tb_Loaiphong";
        
        try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
                
                while(rs.next()){
                    list.add(new LoaiPhong(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getFloat(6),
                            rs.getInt(7),
                            rs.getBoolean(8),
                            rs.getBoolean(9)));
                }
            } catch (Exception e) {
        }
        return list;
    }
    
//    lấy danh sách sách loại phòng theo khách sạn
    public List<LoaiPhong> getAllLoaiphongByMaKS(String id){
        List<LoaiPhong> list = new ArrayList<>();
        String query = "select* from tb_LOAIPHONG where MAKHACHSAN = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                    list.add(new LoaiPhong(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getFloat(6),
                            rs.getInt(7),
                            rs.getBoolean(8),
                            rs.getBoolean(9)));
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
        String query = "select * from tb_LOAIPHONG where IDLOAIPHONG = ?";
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
                            rs.getBoolean(9));
                }
            } catch (Exception e) {
        }
        return null;
    }

    public Account LoginAD(String email, String password){
           String query = "select * from tb_TAIKHOAN	\n" +
                            "where EMAIL = ?\n" +
                            "and PASSWORD = ?";
           try {
               conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, email);
                ps.setString(2, password);
                rs = ps.executeQuery();
                while (rs.next()){
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
       
    public Khachhang LoginKH(String email, String password){
           String query = "select * from tb_KHACHHANG	\n" +
                            "where EMAIL = ? \n" +
                            "and PASSWORD = ?";
           try {
               conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, email);
                ps.setString(2, password);
                rs = ps.executeQuery();
                while (rs.next()){
                    return new Khachhang(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4), 
                            rs.getString(5),
                            rs.getString(6));
                }
           } catch (Exception e) {
           }
           return null;
       }
    
    public Khachhang getKH(String id){
           String query = "select * from tb_KHACHHANG where IDKHACHHANG = ?";
           try {
               conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, id);
                rs = ps.executeQuery();
                while (rs.next()){
                    return new Khachhang(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4), 
                            rs.getString(5),
                            rs.getString(6)
                    );
                }
           } catch (Exception e) {
           }
           return null;
       }
    
    
    public Khachhang checkExist(String email ){
           String query = "select * from tb_KHACHHANG	\n" +
                            "where EMAIL = ?\n" ;
           try {
               conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, email);
                rs = ps.executeQuery();
                while (rs.next()){
                    return new Khachhang(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4), 
                            rs.getString(5),
                            rs.getString(6));
                }
           } catch (Exception e) {
           }
           return null;
       }
    public void signup(String hoten, String dienthoai, String email, String password){
               String query  = " insert into tb_KHACHHANG\n"
                       + "values (?,?,?,?)";
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
                
    public void addDatphong(int idkh, String ghichu, boolean trangthai){
        String query  = "INSERT INTO [dbo].[tb_DATPHONG]([IDKHACHHANG],[GHICHU],[TRANGTHAI]) VALUES (?,?,?)";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idkh);
            ps.setString(2, ghichu);
            ps.setBoolean(3, trangthai);
            ps.executeUpdate();
        } catch (Exception e) 
        {
        }
    }
    
    public Datphong getDatphong(int IDKHACHHANG){
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
    
    public void DatphongCT(int mlp, int iddp, int song, String gdDateTime,String gtDateTime, int tt){
        String query  = "INSERT INTO [dbo].[tb_DATPHONGCHITIET]([MALOAIPHONG],[IDDATPHONG],[SONGUOIO],[GIODAT],[GIOTRA],[THANHTIEN]) VALUES(?,?,?,?,?,?)";
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
        } catch (Exception e) 
        {
        }
    }
        
    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Khachsan> list = dao.getAllKhachsan();
        for(Khachsan k : list){
            System.out.println(k);
        }
    }
    
}
