package entity;

/**
 * Created by Administrator on 2018/6/4.
 */
public class TeachClass {
    //教师授课实体类 外键 分别是teacher course
    private int teacherClassId;
    private  Teacher teacher;
    private Course course;

    public int getTeacherClassId() {
        return teacherClassId;
    }

    public void setTeacherClassId(int teacherClassId) {
        this.teacherClassId = teacherClassId;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }






}
