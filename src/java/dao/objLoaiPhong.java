/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.LoaiPhong;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bigbo
 */
public class objLoaiPhong {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<LoaiPhong> getAllLoaiPhong(String mks) {
        List<LoaiPhong> list = new ArrayList<>();
        String query = "select * from tb_LOAIPHONG where MAKHACHSAN = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, mks);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new LoaiPhong(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getFloat(6), rs.getInt(7), rs.getBoolean(8), rs.getBoolean(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public LoaiPhong getLoaiPhongByID(String idLP) {
        String query = "select * from tb_LOAIPHONG where IDLOAIPHONG = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, idLP);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new LoaiPhong(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getFloat(6), rs.getInt(7), rs.getBoolean(8), rs.getBoolean(9));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void editLoaiPhong(String TENLOAIPHONG, String MOTA, String HINHANH, String GIAPHONG, String SOLUONG, boolean TRANGTHAI, boolean NGUNG, String IDLOAIPHONG) {
        String query = "update tb_LOAIPHONG\n"
                + "set TENLOAIPHONG = ?,\n"
                + "MOTA = ?,\n"
                + "HINHANH = ?,\n"
                + "GIAPHONG = ?,\n"
                + "SOLUONG= ?,\n"
                + "TRANGTHAI = ?,\n"
                + "NGUNG= ?\n"
                + "where IDLOAIPHONG = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, TENLOAIPHONG);
            ps.setString(2, MOTA);
            ps.setString(3, HINHANH);
            ps.setString(4, GIAPHONG);
            ps.setString(5, SOLUONG);
            ps.setBoolean(6, TRANGTHAI);
            ps.setBoolean(7, NGUNG);
            ps.setString(8, IDLOAIPHONG);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void addLoaiPhong(String TENLOAIPHONG, String MOTA, String HINHANH, String GIAPHONG, String SOLUONG, boolean TRANGTHAI, boolean NGUNG, String MAKHACHSAN){
        String query = "INSERT tb_LOAIPHONG\n"
                + "([TENLOAIPHONG], [MOTA], [HINHANH], [GIAPHONG], [SOLUONG], [TRANGTHAI], [NGUNG], [MAKHACHSAN])"
                + "VALUES (?,?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, TENLOAIPHONG);
            ps.setString(2, MOTA);
            ps.setString(3, HINHANH);
            ps.setString(4, GIAPHONG);
            ps.setString(5, SOLUONG);
            ps.setBoolean(6, TRANGTHAI);
            ps.setBoolean(7, NGUNG);
            ps.setString(8, MAKHACHSAN);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteLoaiPhong(String IDLOAIPHONG){
        String query = "delete from tb_LOAIPHONG where IDLOAIPHONG = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, IDLOAIPHONG);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
