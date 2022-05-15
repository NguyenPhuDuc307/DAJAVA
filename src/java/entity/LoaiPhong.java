/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author bigbo
 */
public class LoaiPhong {
    private int IDLOAIPHONG;
    private String MAKHACHSAN;
    private String TENLOAIPHONG;
    private String MOTA;
    private String HINHANH;
    private Float GIAPHONG;
    private int SOLUONG;
    private boolean TRANGTHAI;
    private boolean NGUNG;

    public LoaiPhong() {
    }

    public LoaiPhong(int IDLOAIPHONG, String MAKHACHSAN, String TENLOAIPHONG, String MOTA, String HINHANH, Float GIAPHONG, int SOLUONG, boolean TRANGTHAI, boolean NGUNG) {
        this.IDLOAIPHONG = IDLOAIPHONG;
        this.MAKHACHSAN = MAKHACHSAN;
        this.TENLOAIPHONG = TENLOAIPHONG;
        this.MOTA = MOTA;
        this.HINHANH = HINHANH;
        this.GIAPHONG = GIAPHONG;
        this.SOLUONG = SOLUONG;
        this.TRANGTHAI = TRANGTHAI;
        this.NGUNG = NGUNG;
    }

    public int getIDLOAIPHONG() {
        return IDLOAIPHONG;
    }

    public void setIDLOAIPHONG(int IDLOAIPHONG) {
        this.IDLOAIPHONG = IDLOAIPHONG;
    }

    public String getMAKHACHSAN() {
        return MAKHACHSAN;
    }

    public void setMAKHACHSAN(String MAKHACHSAN) {
        this.MAKHACHSAN = MAKHACHSAN;
    }

    public String getTENLOAIPHONG() {
        return TENLOAIPHONG;
    }

    public void setTENLOAIPHONG(String TENLOAIPHONG) {
        this.TENLOAIPHONG = TENLOAIPHONG;
    }

    public String getMOTA() {
        return MOTA;
    }

    public void setMOTA(String MOTA) {
        this.MOTA = MOTA;
    }

    public String getHINHANH() {
        return HINHANH;
    }

    public void setHINHANH(String HINHANH) {
        this.HINHANH = HINHANH;
    }

    public Float getGIAPHONG() {
        return GIAPHONG;
    }

    public void setGIAPHONG(Float GIAPHONG) {
        this.GIAPHONG = GIAPHONG;
    }

    public int getSOLUONG() {
        return SOLUONG;
    }

    public void setSOLUONG(int SOLUONG) {
        this.SOLUONG = SOLUONG;
    }

    public boolean isTRANGTHAI() {
        return TRANGTHAI;
    }

    public void setTRANGTHAI(boolean TRANGTHAI) {
        this.TRANGTHAI = TRANGTHAI;
    }

    public boolean isNGUNG() {
        return NGUNG;
    }

    public void setNGUNG(boolean NGUNG) {
        this.NGUNG = NGUNG;
    }

    @Override
    public String toString() {
        return "LoaiPhong{" + "IDLOAIPHONG=" + IDLOAIPHONG + ", MAKHACHSAN=" + MAKHACHSAN + ", TENLOAIPHONG=" + TENLOAIPHONG + ", MOTA=" + MOTA + ", HINHANH=" + HINHANH + ", GIAPHONG=" + GIAPHONG + ", SOLUONG=" + SOLUONG + ", TRANGTHAI=" + TRANGTHAI + ", NGUNG=" + NGUNG + '}';
    }
}
