package entity;


/**
 * Created by Administrator on 2018/6/4.
 */
public class LearnClass {
    //选课实体类  学生选的课程 外键约束 老师授课表  和学生表
    private int learnClassId;
    private TeachClass teachClass;
    private Student student;

    public int getLearnClassId() {
        return learnClassId;
    }

    public void setLearnClassId(int learnClassId) {
        this.learnClassId = learnClassId;
    }

    public TeachClass getTeachClass() {
        return teachClass;
    }

    public void setTeachClass(TeachClass teachClass) {
        this.teachClass = teachClass;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
