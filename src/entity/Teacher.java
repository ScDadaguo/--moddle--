package entity;

/**
 * Created by Administrator on 2018/6/4.
 */
public class Teacher {
    //教师实体类 外键约束用户
    private int teacherId;
    private Ueser ueser;
    private Department department;

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public Ueser getUeser() {
        return ueser;
    }

    public void setUeser(Ueser ueser) {
        this.ueser = ueser;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
