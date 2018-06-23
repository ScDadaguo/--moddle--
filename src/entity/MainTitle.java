package entity;



/**
 * Created by Administrator on 2018/6/4.
 */
public class MainTitle {
    //主题实体类 外键老师 外键授课表
    private int mainTitleId;
    private  TeachClass teachClass;
    private Teacher teacher;
    private String title;
    private String body;
    private String createTime;

    public int getMainTitleId() {
        return mainTitleId;
    }

    public void setMainTitleId(int mainTitleId) {
        this.mainTitleId = mainTitleId;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
