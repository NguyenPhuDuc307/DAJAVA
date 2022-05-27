/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.math.BigInteger;
import java.sql.Timestamp;

/**
 *
 * @author nguye
 */
public class DatphongCT {
    private int MALOAIPHONG;
    private int IDDATPHONG;
    private int SONGUOIO;
    private Timestamp GIODAT ;    
    private Timestamp GIOTRA ;
    private BigInteger THANHTIEN;

    public DatphongCT() {
    }

    public DatphongCT(int MALOAIPHONG, int IDDATPHONG, int SONGUOIO, Timestamp GIODAT, Timestamp GIOTRA, BigInteger THANHTIEN) {
        this.MALOAIPHONG = MALOAIPHONG;
        this.IDDATPHONG = IDDATPHONG;
        this.SONGUOIO = SONGUOIO;
        this.GIODAT = GIODAT;
        this.GIOTRA = GIOTRA;
        this.THANHTIEN = THANHTIEN;
    }

    public int getMALOAIPHONG() {
        return MALOAIPHONG;
    }

    public void setMALOAIPHONG(int MALOAIPHONG) {
        this.MALOAIPHONG = MALOAIPHONG;
    }

    public int getIDDATPHONG() {
        return IDDATPHONG;
    }

    public void setIDDATPHONG(int IDDATPHONG) {
        this.IDDATPHONG = IDDATPHONG;
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

    public BigInteger getTHANHTIEN() {
        return THANHTIEN;
    }

    public void setTHANHTIEN(BigInteger THANHTIEN) {
        this.THANHTIEN = THANHTIEN;
    }

    @Override
    public String toString() {
        return "DatphongCT{" + "MALOAIPHONG=" + MALOAIPHONG + ", IDDATPHONG=" + IDDATPHONG + ", SONGUOIO=" + SONGUOIO + ", GIODAT=" + GIODAT + ", GIOTRA=" + GIOTRA + ", THANHTIEN=" + THANHTIEN + '}';
    }

    
    
}
