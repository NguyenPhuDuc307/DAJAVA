package entity;

public class TaikhoanFull {
    private int IDTAIKHOAN;
    private String MAKHACHSAN;
    private String TENKHACHSAN;
    private String HOTEN;
    private String DIENTHOAI;
    private String EMAIL;
    private String PASSWORD;
    private boolean ADMIN;
    private String HINHANH;
    private String HINHANHKS;

    public TaikhoanFull() {
    }

    public TaikhoanFull(int IDTAIKHOAN, String MAKHACHSAN, String TENKHACHSAN, String HOTEN, String DIENTHOAI, String EMAIL, String PASSWORD, boolean ADMIN, String HINHANH, String HINHANHKS) {
        this.IDTAIKHOAN = IDTAIKHOAN;
        this.MAKHACHSAN = MAKHACHSAN;
        this.TENKHACHSAN = TENKHACHSAN;
        this.HOTEN = HOTEN;
        this.DIENTHOAI = DIENTHOAI;
        this.EMAIL = EMAIL;
        this.PASSWORD = PASSWORD;
        this.ADMIN = ADMIN;
        this.HINHANH = HINHANH;
        this.HINHANHKS = HINHANHKS;
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

    public String getTENKHACHSAN() {
        return TENKHACHSAN;
    }

    public void setTENKHACHSAN(String TENKHACHSAN) {
        this.TENKHACHSAN = TENKHACHSAN;
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

    public boolean isADMIN() {
        return ADMIN;
    }

    public void setADMIN(boolean ADMIN) {
        this.ADMIN = ADMIN;
    }

    public String getHINHANH() {
        return HINHANH;
    }

    public void setHINHANH(String HINHANH) {
        this.HINHANH = HINHANH;
    }

    public String getHINHANHKS() {
        return HINHANHKS;
    }

    public void setHINHANHKS(String HINHANHKS) {
        this.HINHANHKS = HINHANHKS;
    }

    @Override
    public String toString() {
        return "TaikhoanFull{" + "IDTAIKHOAN=" + IDTAIKHOAN + ", MAKHACHSAN=" + MAKHACHSAN + ", TENKHACHSAN=" + TENKHACHSAN + ", HOTEN=" + HOTEN + ", DIENTHOAI=" + DIENTHOAI + ", EMAIL=" + EMAIL + ", PASSWORD=" + PASSWORD + ", ADMIN=" + ADMIN + ", HINHANH=" + HINHANH + ", HINHANHKS=" + HINHANHKS + '}';
    }
    

}