package entity;

import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
public class Topic {
    //话题实体类 外键 主题  学生
    private int topicId;
    private MainTitle mainTitlel;
    private Ueser ueser;
    private String title;
    private String body;
    private String createTime;
    private String toUserId;
    private List<Topic> reply;


    public int getTopicId() {
        return topicId;
    }

    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }

    public MainTitle getMainTitlel() {
        return mainTitlel;
    }

    public void setMainTitlel(MainTitle mainTitlel) {
        this.mainTitlel = mainTitlel;
    }

    public Ueser getUeser() {
        return ueser;
    }

    public void setUeser(Ueser ueser) {
        this.ueser = ueser;
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

    public String getToUserId() {
        return toUserId;
    }

    public void setToUserId(String toUserId) {
        this.toUserId = toUserId;
    }

    public List<Topic> getReply() {
        return reply;
    }

    public void setReply(List<Topic> reply) {
        this.reply = reply;
    }
}
