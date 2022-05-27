/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author nguye
 */
public class Khachsan {
    private String MAKHACHSAN;
    private String TENKHACHSAN;
    private String DIACHI;
    private String GGMAP;
    private String HINHANH;
    private String MOTA;
    private int HANG;
    private boolean NGUNG;

    public Khachsan() {
    }

    public Khachsan(String MAKHACHSAN, String TENKHACHSAN, String DIACHI, String GGMAP, String HINHANH, String MOTA, int HANG, boolean NGUNG) {
        this.MAKHACHSAN = MAKHACHSAN;
        this.TENKHACHSAN = TENKHACHSAN;
        this.DIACHI = DIACHI;
        this.GGMAP = GGMAP;
        this.HINHANH = HINHANH;
        this.MOTA = MOTA;
        this.HANG = HANG;
        this.NGUNG = NGUNG;
    }

    

    public String getMAKHACHSAN() {
        return MAKHACHSAN;
    }

    public void setMAKHACHSAN(String MAKHACHSAN) {
        this.MAKHACHSAN = MAKHACHSAN;
    }

    public String getTENKHACHSAN() {
        return TENKHACHSAN;
    }

    public void setTENKHACHSAN(String TENKHACHSAN) {
        this.TENKHACHSAN = TENKHACHSAN;
    }

    public String getDIACHI() {
        return DIACHI;
    }

    public void setDIACHI(String DIACHI) {
        this.DIACHI = DIACHI;
    }

    public String getGGMAP() {
        return GGMAP;
    }

    public void setGGMAP(String GGMAP) {
        this.GGMAP = GGMAP;
    }

    public String getHINHANH() {
        return HINHANH;
    }

    public void setHINHANH(String HINHANH) {
        this.HINHANH = HINHANH;
    }

    public String getMOTA() {
        return MOTA;
    }

    public void setMOTA(String MOTA) {
        this.MOTA = MOTA;
    }

    public int getHANG() {
        return HANG;
    }

    public void setHANG(int HANG) {
        this.HANG = HANG;
    }

    public boolean isNGUNG() {
        return NGUNG;
    }

    public void setNGUNG(boolean NGUNG) {
        this.NGUNG = NGUNG;
    }

    @Override
    public String toString() {
        return "Khachsan{" + "MAKHACHSAN=" + MAKHACHSAN + ", TENKHACHSAN=" + TENKHACHSAN + ", DIACHI=" + DIACHI + ", GGMAP=" + GGMAP + ", HINHANH=" + HINHANH + ", MOTA=" + MOTA + ", HANG=" + HANG + ", NGUNG=" + NGUNG + '}';
    }
}
