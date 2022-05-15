/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author nguye
 */
public class Datphong {
    private int IDDATPHONG;
    private int IDKHACHHANG;
    private String GHICHU;
    private boolean TRANGTHAI;

    public Datphong() {
    }

    public Datphong(int IDDATPHONG, int IDKHACHHANG, String GHICHU, boolean TRANGTHAI) {
        this.IDDATPHONG = IDDATPHONG;
        this.IDKHACHHANG = IDKHACHHANG;
        this.GHICHU = GHICHU;
        this.TRANGTHAI = TRANGTHAI;
    }

    public int getIDDATPHONG() {
        return IDDATPHONG;
    }

    public void setIDDATPHONG(int IDDATPHONG) {
        this.IDDATPHONG = IDDATPHONG;
    }

    public int getIDKHACHHANG() {
        return IDKHACHHANG;
    }

    public void setIDKHACHHANG(int IDKHACHHANG) {
        this.IDKHACHHANG = IDKHACHHANG;
    }

    public String getGHICHU() {
        return GHICHU;
    }

    public void setGHICHU(String GHICHU) {
        this.GHICHU = GHICHU;
    }

    public boolean isTRANGTHAI() {
        return TRANGTHAI;
    }

    public void setTRANGTHAI(boolean TRANGTHAI) {
        this.TRANGTHAI = TRANGTHAI;
    }

    @Override
    public String toString() {
        return "Datphong{" + "IDDATPHONG=" + IDDATPHONG + ", IDKHACHHANG=" + IDKHACHHANG + ", GHICHU=" + GHICHU + ", TRANGTHAI=" + TRANGTHAI + '}';
    }
    
    


}
