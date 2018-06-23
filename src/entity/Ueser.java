package entity;

/**
 * Created by Administrator on 2018/6/4.
 */
public class Ueser {
    private String id;
    private String ueserName;
    private String nickname;
    private String password;
    private String email;
    private String createTime;
    private String ueserImg;

    public String getUeserImg() {
        return ueserImg;
    }

    public void setUeserImg(String ueserImg) {
        this.ueserImg = ueserImg;
    }

    public String getUeserName() {
        return ueserName;
    }

    public void setUeserName(String ueserName) {
        this.ueserName = ueserName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
