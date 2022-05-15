/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.KhachSanVN;
import entity.Khachsan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bigbo
 */
public class objKhachSan {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Khachsan> getAllKhachSan() {
        List<Khachsan> list = new ArrayList<>();
        String query = "select * from tb_KHACHSAN";
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

    public KhachSanVN getKhachSanByID(String idKS) {
        String query = "select * from tb_KHACHSAN where MAKHACHSAN = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, idKS);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new KhachSanVN(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getInt(6), rs.getBoolean(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void editKhachSan(String TENKHACHSAN, String DIACHI, String GGMAP, String HINHANH, int HANG, boolean NGUNG, String MAKHACHSAN) {
        String query = "update tb_KHACHSAN\n"
                + "set TENKHACHSAN = ?,\n"
                + "DIACHI = ?,\n"
                + "GGMAP = ?,\n"
                + "HINHANH = ?,\n"
                + "HANG= ?,\n"
                + "NGUNG= ?\n"
                + "where MAKHACHSAN = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, TENKHACHSAN);
            ps.setString(2, DIACHI);
            ps.setString(3, GGMAP);
            ps.setString(4, HINHANH);
            ps.setInt(5, HANG);
            ps.setBoolean(6, NGUNG);
            ps.setString(7, MAKHACHSAN);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addKhachSan(String MAKHACHSAN, String TENKHACHSAN, String DIACHI, String GGMAP, String HINHANH, int HANG, boolean NGUNG) {
        String query = "INSERT tb_KHACHSAN\n"
                + "([MAKHACHSAN], [TENKHACHSAN], [DIACHI], [GGMAP], [HINHANH], [HANG], [NGUNG])"
                + "VALUES (?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MAKHACHSAN);
            ps.setString(2, TENKHACHSAN);
            ps.setString(3, DIACHI);
            ps.setString(4, GGMAP);
            ps.setString(5, HINHANH);
            ps.setInt(6, HANG);
            ps.setBoolean(7, NGUNG);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteKhachSan(String MAKHACHSAN){
        String query = "delete from tb_KHACHSAN where MAKHACHSAN = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MAKHACHSAN);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
