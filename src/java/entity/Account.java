/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ASUS
 */
public class Account {
    private int IDTAIKHOAN;
    private String MAKHACHSAN;
    private String HOTEN;
    private String DIENTHOAI;
    private String EMAIL;
    private String PASSWORD;
    private int ADMIN;

    public Account() {
    }

    public Account(int IDTAIKHOAN, String MAKHACHSAN, String HOTEN, String DIENTHOAI, String EMAIL, String PASSWORD, int ADMIN) {
        this.IDTAIKHOAN = IDTAIKHOAN;
        this.MAKHACHSAN = MAKHACHSAN;
        this.HOTEN = HOTEN;
        this.DIENTHOAI = DIENTHOAI;
        this.EMAIL = EMAIL;
        this.PASSWORD = PASSWORD;
        this.ADMIN = ADMIN;
    }

    public int getIDTAIKHOAN() {
        return IDTAIKHOAN;
    }

    public void setIDTAIKHOAN(int IDTAIKHOAN) {
        this.IDTAIKHOAN = IDTAIKHOAN;
    }

    public String getMAKHACHSAN() {
        return MAKHACHSAN;
    }

    public void setMAKHACHSAN(String MAKHACHSAN) {
        this.MAKHACHSAN = MAKHACHSAN;
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

    public int getADMIN() {
        return ADMIN;
    }

    public void setADMIN(int ADMIN) {
        this.ADMIN = ADMIN;
    }

    @Override
    public String toString() {
        return "Account{" + "IDTAIKHOAN=" + IDTAIKHOAN + ", MAKHACHSAN=" + MAKHACHSAN + ", HOTEN=" + HOTEN + ", DIENTHOAI=" + DIENTHOAI + ", EMAIL=" + EMAIL + ", PASSWORD=" + PASSWORD + ", ADMIN=" + ADMIN + '}';
    }

    
    
    
}
