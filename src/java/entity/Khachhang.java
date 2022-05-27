/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ASUS
 */
public class Khachhang {
    private int IDKHACHHANG;
    private String HOTEN;
    private String DIENTHOAI;
    private String EMAIL;
    private String PASSWORD;
    private String HINHANH;
    private boolean XACNHAN;

    public Khachhang() {
    }

    public Khachhang(int IDKHACHHANG, String HOTEN, String DIENTHOAI, String EMAIL, String PASSWORD, String HINHANH, boolean XACNHAN) {
        this.IDKHACHHANG = IDKHACHHANG;
        this.HOTEN = HOTEN;
        this.DIENTHOAI = DIENTHOAI;
        this.EMAIL = EMAIL;
        this.PASSWORD = PASSWORD;
        this.HINHANH = HINHANH;
        this.XACNHAN = XACNHAN;
    }

    public int getIDKHACHHANG() {
        return IDKHACHHANG;
    }

    public void setIDKHACHHANG(int IDKHACHHANG) {
        this.IDKHACHHANG = IDKHACHHANG;
    }

    public String getHOTEN() {
        return HOTEN;
    }

    public void setHOTEN(String HOTEN) {
        this.HOTEN = HOTEN;
    }

    public String getDIENTHOAI() {
        return DIENTHOAI;
    }

    public void setDIENTHOAI(String DIENTHOAI) {
        this.DIENTHOAI = DIENTHOAI;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public String getPASSWORD() {
        return PASSWORD;
    }

    public void setPASSWORD(String PASSWORD) {
        this.PASSWORD = PASSWORD;
    }

    public String getHINHANH() {
        return HINHANH;
    }

    public void setHINHANH(String HINHANH) {
        this.HINHANH = HINHANH;
    }

    public boolean isXACNHAN() {
        return XACNHAN;
    }

    public void setXACNHAN(boolean XACNHAN) {
        this.XACNHAN = XACNHAN;
    }

    @Override
    public String toString() {
        return "Khachhang{" + "IDKHACHHANG=" + IDKHACHHANG + ", HOTEN=" + HOTEN + ", DIENTHOAI=" + DIENTHOAI + ", EMAIL=" + EMAIL + ", PASSWORD=" + PASSWORD + ", HINHANH=" + HINHANH + ", XACNHAN=" + XACNHAN + '}';
    }

    
    
}