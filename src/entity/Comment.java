package entity;

import javax.xml.crypto.Data;
import java.util.Date;

public class Comment {
    private int topicid;
    private String title;
    private String body;
    private String createTime;
    private Ueser ueser;
    private MainTitle mainTitle;


    public int getTopicid() {
        return topicid;
    }

    public void setTopicid(int topicid) {
        this.topicid = topicid;
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

    public Ueser getUeser() {
        return ueser;
    }

    public void setUeser(Ueser ueser) {
        this.ueser = ueser;
    }

    public MainTitle getMainTitle() {
        return mainTitle;
    }

    public void setMainTitle(MainTitle mainTitle) {
        this.mainTitle = mainTitle;
    }
}
