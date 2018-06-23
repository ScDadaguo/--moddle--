package entity;

public class UpFile {
//   上传文件名实体类 外键老师 外键授课表
    private String fileName;
//    private int teachClassId;
//    private int teacherId;
    private TeachClass teachClass;
    private Teacher teacher;
    private String createTime;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }


    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public TeachClass getTeachClass() {
        return teachClass;
    }

    public void setTeachClass(TeachClass teachClass) {
        this.teachClass = teachClass;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
}
