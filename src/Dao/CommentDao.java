package Dao;


import entity.MainTitle;
import entity.Topic;
import entity.Ueser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDao  extends  SqlBean{
    public Topic getLastCommentId(Topic topic){
        String sql ="select topicId\n" +
                "from topic\n" +
                "where createTime=? and body=?";
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,topic.getCreateTime());
            pstmt.setString(2,topic.getBody());
            rs = pstmt.executeQuery();
            while (rs.next()){
                topic.setTopicId(rs.getInt("topicid"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            this.closeConnection(conn,pstmt,rs);
        }
        return topic;

    }




    public int insertReply(Topic comment){
        String sql = "insert topic(mainTitleId,userid,body,touserid,replyTopicId)\n" +
                "values(?,?,?,?,?)";
        List<Object> pValues = new ArrayList<Object>();
        pValues.add(comment.getMainTitlel().getMainTitleId());
        pValues.add(comment.getUeser().getId());
        pValues.add(comment.getBody());
        pValues.add(comment.getToUserId());
        pValues.add(comment.getTopicId());

        int rows = 0;

        try {
            rows = this.executeUpdate(sql,pValues);
        } catch (Exception e){
            e.printStackTrace();
        }

        return rows;
    }
    public int insertComment(Topic comment){
        String sql = "insert topic(mainTitleId,userid,body)\n" +
                "values(?,?,?)";
        List<Object> pValues = new ArrayList<Object>();
        pValues.add(comment.getMainTitlel().getMainTitleId());
        pValues.add(comment.getUeser().getId());

        pValues.add(comment.getBody());

        int rows = 0;

        try {
            rows = this.executeUpdate(sql,pValues);
        } catch (Exception e){
            e.printStackTrace();
        }

        return rows;
    }
    public List<Topic> getAllComment(int mainTitleId ){
        String sql="\n" +
                "select *\n" +
                "from topic,ueser where maintitleid= ? and ueser.ueserid=topic.userid and replyTopicId is NULL  \n" +
                "order  by topic.createTime desc ";
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Topic> commentList=new ArrayList<Topic>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,mainTitleId);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Topic topic=new Topic();
                MainTitle mainTitle=new MainTitle();
                mainTitle.setMainTitleId(rs.getInt("MainTitleId"));
                Ueser ueser=new Ueser();
                ueser.setId(rs.getString("userid"));
                ueser.setUeserName(rs.getString("username"));
                ueser.setNickname(rs.getString("nickname"));
                ueser.setUeserImg(rs.getString("UserImg"));
                topic.setMainTitlel(mainTitle);
                topic.setUeser(ueser);
                topic.setTopicId(rs.getInt("topicid"));
                topic.setToUserId(rs.getString("touserId"));
                topic.setBody(rs.getString("body"));
                topic.setCreateTime(rs.getString("createtime"));

                commentList.add(topic);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            this.closeConnection(conn,pstmt,rs);
        }
        return commentList;
    }
    public List<Topic> getReply(int topicId ){
        String sql="select *\n" +

                "from topic,ueser where replyTopicId=?  and ueser.ueserid=topic.userid \n" +
                "order  by topic.createTime desc ";
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Topic> commentList=new ArrayList<Topic>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,topicId);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Topic topic=new Topic();
                MainTitle mainTitle=new MainTitle();
                mainTitle.setMainTitleId(rs.getInt("MainTitleId"));
                Ueser ueser=new Ueser();
                ueser.setId(rs.getString("userid"));
                ueser.setUeserName(rs.getString("username"));
                ueser.setNickname(rs.getString("nickname"));
                ueser.setUeserImg(rs.getString("userimg"));
                topic.setMainTitlel(mainTitle);
                topic.setUeser(ueser);
                topic.setTopicId(rs.getInt("topicid"));
                topic.setToUserId(rs.getString("touserId"));
                topic.setBody(rs.getString("body"));
                topic.setCreateTime(rs.getString("createtime"));
                commentList.add(topic);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            this.closeConnection(conn,pstmt,rs);
        }
        return commentList;
    }

}
