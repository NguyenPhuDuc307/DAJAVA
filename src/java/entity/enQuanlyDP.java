/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Timestamp;

/**
 *
 * @author nguye
 */
public class enQuanlyDP {
    private String GHICHU;
    private boolean TRANGTHAI;
    private int SONGUOIO;
    private Timestamp GIODAT ;    
    private Timestamp GIOTRA ;
    private Integer THANHTIEN;
    private String HOTEN;
    private String DIENTHOAI;
    private String TENLOAIPHONG;
    private int GIAPHONG;
    private int IDDATPHONG;
    private int IDDPCT;
    private String TENKHACHSAN;
    private int SOGIOHT;
    private Integer THANHTIENHT;
    private int QUAGIO;
    private String EMAIL;

    public enQuanlyDP() {
    }

    public enQuanlyDP(String GHICHU, boolean TRANGTHAI, int SONGUOIO, Timestamp GIODAT, Timestamp GIOTRA, Integer THANHTIEN, String HOTEN, String DIENTHOAI, String TENLOAIPHONG, int GIAPHONG, int IDDATPHONG, int IDDPCT, String TENKHACHSAN, int SOGIOHT, Integer THANHTIENHT, int QUAGIO, String EMAIL) {
        this.GHICHU = GHICHU;
        this.TRANGTHAI = TRANGTHAI;
        this.SONGUOIO = SONGUOIO;
        this.GIODAT = GIODAT;
        this.GIOTRA = GIOTRA;
        this.THANHTIEN = THANHTIEN;
        this.HOTEN = HOTEN;
        this.DIENTHOAI = DIENTHOAI;
        this.TENLOAIPHONG = TENLOAIPHONG;
        this.GIAPHONG = GIAPHONG;
        this.IDDATPHONG = IDDATPHONG;
        this.IDDPCT = IDDPCT;
        this.TENKHACHSAN = TENKHACHSAN;
        this.SOGIOHT = SOGIOHT;
        this.THANHTIENHT = THANHTIENHT;
        this.QUAGIO = QUAGIO;
        this.EMAIL = EMAIL;
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

    public int getSONGUOIO() {
        return SONGUOIO;
    }

    public void setSONGUOIO(int SONGUOIO) {
        this.SONGUOIO = SONGUOIO;
    }

    public Timestamp getGIODAT() {
        return GIODAT;
    }

    public void setGIODAT(Timestamp GIODAT) {
        this.GIODAT = GIODAT;
    }

    public Timestamp getGIOTRA() {
        return GIOTRA;
    }

    public void setGIOTRA(Timestamp GIOTRA) {
        this.GIOTRA = GIOTRA;
    }

    public Integer getTHANHTIEN() {
        return THANHTIEN;
    }

    public void setTHANHTIEN(Integer THANHTIEN) {
        this.THANHTIEN = THANHTIEN;
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

    public String getTENLOAIPHONG() {
        return TENLOAIPHONG;
    }

    public void setTENLOAIPHONG(String TENLOAIPHONG) {
        this.TENLOAIPHONG = TENLOAIPHONG;
    }

    public int getGIAPHONG() {
        return GIAPHONG;
    }

    public void setGIAPHONG(int GIAPHONG) {
        this.GIAPHONG = GIAPHONG;
    }

    public int getIDDATPHONG() {
        return IDDATPHONG;
    }

    public void setIDDATPHONG(int IDDATPHONG) {
        this.IDDATPHONG = IDDATPHONG;
    }

    public int getIDDPCT() {
        return IDDPCT;
    }

    public void setIDDPCT(int IDDPCT) {
        this.IDDPCT = IDDPCT;
    }

    public String getTENKHACHSAN() {
        return TENKHACHSAN;
    }

    public void setTENKHACHSAN(String TENKHACHSAN) {
        this.TENKHACHSAN = TENKHACHSAN;
    }

    public int getSOGIOHT() {
        return SOGIOHT;
    }

    public void setSOGIOHT(int SOGIOHT) {
        this.SOGIOHT = SOGIOHT;
    }

    public Integer getTHANHTIENHT() {
        return THANHTIENHT;
    }

    public void setTHANHTIENHT(Integer THANHTIENHT) {
        this.THANHTIENHT = THANHTIENHT;
    }

    public int getQUAGIO() {
        return QUAGIO;
    }

    public void setQUAGIO(int QUAGIO) {
        this.QUAGIO = QUAGIO;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    @Override
    public String toString() {
        return "enQuanlyDP{" + "GHICHU=" + GHICHU + ", TRANGTHAI=" + TRANGTHAI + ", SONGUOIO=" + SONGUOIO + ", GIODAT=" + GIODAT + ", GIOTRA=" + GIOTRA + ", THANHTIEN=" + THANHTIEN + ", HOTEN=" + HOTEN + ", DIENTHOAI=" + DIENTHOAI + ", TENLOAIPHONG=" + TENLOAIPHONG + ", GIAPHONG=" + GIAPHONG + ", IDDATPHONG=" + IDDATPHONG + ", IDDPCT=" + IDDPCT + ", TENKHACHSAN=" + TENKHACHSAN + ", SOGIOHT=" + SOGIOHT + ", THANHTIENHT=" + THANHTIENHT + ", QUAGIO=" + QUAGIO + ", EMAIL=" + EMAIL + '}';
    }
    
    

}