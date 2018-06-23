package entity;

/**
 * Created by Administrator on 2018/6/4.
 */
public class Student {

    //学生实体类 外键约束班级
    private int studentId;

    private  Ueser ueser;
    private  Class aclass;

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public Ueser getUeser() {
        return ueser;
    }

    public void setUeser(Ueser ueser) {
        this.ueser = ueser;
    }

    public Class getAclass() {
        return aclass;
    }

    public void setAclass(Class aclass) {
        this.aclass = aclass;
    }




}
