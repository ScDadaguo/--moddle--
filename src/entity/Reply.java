package entity;

/**
 * Created by Administrator on 2018/6/4.
 */
public class Reply {
    //回贴实体类 外键
    private int replyId;
    private Topic topic;
    private Ueser ueser;
    private String title;
    private String body;
    private String createTime;

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
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
}
