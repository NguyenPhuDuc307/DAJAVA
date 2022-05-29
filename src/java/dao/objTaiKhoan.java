/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Khachhang;
import entity.TaiKhoan;
import entity.TaikhoanFull;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class objTaiKhoan {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<TaiKhoan> getAllTaiKhoan() {
        List<TaiKhoan> list = new ArrayList<>();
        String query = "select * from tb_TAIKHOAN where ADMIN='false'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TaiKhoan(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<TaikhoanFull> getAllTaiKhoanFull() {
        List<TaikhoanFull> list = new ArrayList<>();
        String query = "SELECT dbo.tb_TAIKHOAN.IDTAIKHOAN, dbo.tb_KHACHSAN.MAKHACHSAN, dbo.tb_KHACHSAN.TENKHACHSAN, \n"
                + " dbo.tb_TAIKHOAN.HOTEN, dbo.tb_TAIKHOAN.DIENTHOAI, dbo.tb_TAIKHOAN.EMAIL, \n"
                + " dbo.tb_TAIKHOAN.PASSWORD, dbo.tb_TAIKHOAN.ADMIN, dbo.tb_TAIKHOAN.HINHANH, dbo.tb_KHACHSAN.HINHANH\n"
                + "FROM dbo.tb_KHACHSAN INNER JOIN\n"
                + " dbo.tb_TAIKHOAN ON dbo.tb_KHACHSAN.MAKHACHSAN = dbo.tb_TAIKHOAN.MAKHACHSAN and ADMIN='false' order by dbo.tb_KHACHSAN.TENKHACHSAN";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TaikhoanFull(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public TaiKhoan getTaiKhoanByID(String idTK) {
        String query = "select * from tb_TAIKHOAN where IDTAIKHOAN = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, idTK);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new TaiKhoan(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Khachhang getKHByID(String idKH) {
        String query = "select * from tb_KHACHHANG where IDKHACHHANG = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, idKH);
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

    public TaikhoanFull getTaiKhoanFullByID(String idTK) {
        String query = "SELECT dbo.tb_TAIKHOAN.IDTAIKHOAN, dbo.tb_KHACHSAN.MAKHACHSAN, dbo.tb_KHACHSAN.TENKHACHSAN, \n"
                + " dbo.tb_TAIKHOAN.HOTEN, dbo.tb_TAIKHOAN.DIENTHOAI, dbo.tb_TAIKHOAN.EMAIL, \n"
                + " dbo.tb_TAIKHOAN.PASSWORD, dbo.tb_TAIKHOAN.ADMIN, dbo.tb_TAIKHOAN.HINHANH, dbo.tb_KHACHSAN.HINHANH\n"
                + "FROM dbo.tb_KHACHSAN INNER JOIN\n"
                + " dbo.tb_TAIKHOAN ON dbo.tb_KHACHSAN.MAKHACHSAN = dbo.tb_TAIKHOAN.MAKHACHSAN and IDTAIKHOAN=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, idTK);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new TaikhoanFull(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void addTaiKhoan(String MAKHACHSAN, String HOTEN, String DIENTHOAI, String EMAIL, String PASSWORD, boolean ADMIN) {
        String query = "INSERT tb_TAIKHOAN\n"
                + "([MAKHACHSAN], [HOTEN], [DIENTHOAI], [EMAIL], [PASSWORD], [ADMIN])"
                + "VALUES (?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MAKHACHSAN);
            ps.setString(2, HOTEN);
            ps.setString(3, DIENTHOAI);
            ps.setString(4, EMAIL);
            ps.setString(5, PASSWORD);
            ps.setBoolean(6, ADMIN);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editTaiKhoan(String MAKHACHSAN, String HOTEN, String DIENTHOAI, String EMAIL, boolean ADMIN, int IDTAIKHOAN) {
        String query = "update tb_TAIKHOAN\n"
                + "set MAKHACHSAN = ?,\n"
                + "HOTEN = ?,\n"
                + "DIENTHOAI = ?,\n"
                + "EMAIL = ?,\n"
                + "ADMIN = ?\n"
                + "where IDTAIKHOAN = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MAKHACHSAN);
            ps.setString(2, HOTEN);
            ps.setString(3, DIENTHOAI);
            ps.setString(4, EMAIL);
            ps.setBoolean(5, ADMIN);
            ps.setInt(6, IDTAIKHOAN);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void editKH(String HOTEN, String DIENTHOAI, String EMAIL, String IDKHACHHANG) {
        String query = "update tb_KHACHHANG\n"
                + "set HOTEN = ?, DIENTHOAI = ?, EMAIL = ? where IDKHACHHANG = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, HOTEN);
            ps.setString(2, DIENTHOAI);
            ps.setString(3, EMAIL);
            ps.setString(4, IDKHACHHANG);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void doimktk(String IDTAIKHOAN, String PASSWORD) {
        String query = "update tb_TAIKHOAN\n"
                + "set PASSWORD = ?\n"
                + "where IDTAIKHOAN = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, PASSWORD);
            ps.setString(2, IDTAIKHOAN);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void doimkkh(String IDKHACHHANG, String PASSWORD) {
        String query = "update tb_KHACHHANG\n"
                + "set PASSWORD = ?\n"
                + "where IDKHACHHANG = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, PASSWORD);
            ps.setString(2, IDKHACHHANG);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void doianhdaidientk(String IDTAIKHOAN, String HINHANH) {
        String query = "update tb_TAIKHOAN\n"
                + "set HINHANH = ?\n"
                + "where IDTAIKHOAN = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, HINHANH);
            ps.setString(2, IDTAIKHOAN);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void doianhdaidienkh(String IDKHACHHANG, String HINHANH) {
        String query = "update tb_KHACHHANG\n"
                + "set HINHANH = ?\n"
                + "where IDKHACHHANG = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, HINHANH);
            ps.setString(2, IDKHACHHANG);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteTaiKhoan(String IDTAIKHOAN) {
        String query = "delete from tb_TAIKHOAN where IDTAIKHOAN = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, IDTAIKHOAN);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        objTaiKhoan dao = new objTaiKhoan();
        String id = "12";
        TaikhoanFull k = dao.getTaiKhoanFullByID(id);
        System.out.println(k);
    }
}
