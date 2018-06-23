package entity;

public class Department {
    private  int departmentId;
    private  String departmentName;
    private  String content;
    private int countcoursename;
    private String depImg;
    private String departEngName;

    public String getDepartEngName() {
        return departEngName;
    }

    public void setDepartEngName(String departEngName) {
        this.departEngName = departEngName;
    }

    public String getDepImg() {
        return depImg;
    }

    public void setDepImg(String depImg) {
        this.depImg = depImg;
    }

    public int getCountcoursename() {
        return countcoursename;
    }

    public void setCountcoursename(int countcoursename) {
        this.countcoursename = countcoursename;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
