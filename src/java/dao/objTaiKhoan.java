/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.TaiKhoan;
import entity.TaikhoanFull;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bigbo
 */
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
                list.add(new TaiKhoan(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getBoolean(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<TaikhoanFull> getAllTaiKhoanFull() {
        List<TaikhoanFull> list = new ArrayList<>();
        String query = "SELECT dbo.tb_TAIKHOAN.IDTAIKHOAN, dbo.tb_KHACHSAN.MAKHACHSAN, dbo.tb_KHACHSAN.TENKHACHSAN, \n" +
                        " dbo.tb_TAIKHOAN.HOTEN, dbo.tb_TAIKHOAN.DIENTHOAI, dbo.tb_TAIKHOAN.EMAIL, \n" +
                        " dbo.tb_TAIKHOAN.PASSWORD, dbo.tb_TAIKHOAN.ADMIN\n" +
                        "FROM dbo.tb_KHACHSAN INNER JOIN\n" +
                        " dbo.tb_TAIKHOAN ON dbo.tb_KHACHSAN.MAKHACHSAN = dbo.tb_TAIKHOAN.MAKHACHSAN and ADMIN='false'";
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
                        rs.getBoolean(8)));
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
                return new TaiKhoan(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getBoolean(7));
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
    
    public void editTaiKhoan(String MAKHACHSAN, String HOTEN, String DIENTHOAI, String EMAIL, String PASSWORD, boolean ADMIN, int IDTAIKHOAN) {
        String query = "update tb_TAIKHOAN\n"
                + "set MAKHACHSAN = ?,\n"
                + "HOTEN = ?,\n"
                + "DIENTHOAI = ?,\n"
                + "EMAIL = ?,\n"
                + "PASSWORD= ?,\n"
                + "ADMIN = ?\n"
                + "where IDTAIKHOAN = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MAKHACHSAN);
            ps.setString(2, HOTEN);
            ps.setString(3, DIENTHOAI);
            ps.setString(4, EMAIL);
            ps.setString(5, PASSWORD);
            ps.setBoolean(6, ADMIN);
            ps.setInt(7, IDTAIKHOAN);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteTaiKhoan(String IDTAIKHOAN){
        String query = "delete from tb_TAIKHOAN where IDTAIKHOAN = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, IDTAIKHOAN);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
