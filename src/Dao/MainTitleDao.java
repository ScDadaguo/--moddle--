package Dao;

import entity.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MainTitleDao extends SqlBean {
    public int insert( MainTitle ojbmainTitle){
        String sql = "Insert maintitle Values (?,?,?,?,?)";
        List<Object> pValues = new ArrayList<Object>();
        pValues.add(ojbmainTitle.getTeachClass().getTeacherClassId());
        pValues.add(ojbmainTitle.getTeacher().getTeacherId());
        pValues.add(ojbmainTitle.getTitle());
        pValues.add(ojbmainTitle.getBody());
        pValues.add(ojbmainTitle.getCreateTime());

        int rows = 0;

        try {
            rows = this.executeUpdate(sql,pValues);
        } catch (Exception e){
            e.printStackTrace();
        }

        return rows;
    }
    public MainTitle prinArticle(String title){
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql="select *\n" +
                "from mainTitle,teacher,Ueser\n" +
                "where title=? and mainTitle.teacherId=teacher.teacherId and ueser.ueserid=teacher.userId";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,title);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                MainTitle mainTitle=new MainTitle();
                mainTitle.setTitle(rs.getString("title"));
                mainTitle.setBody(rs.getString("body"));
                mainTitle.setCreateTime(rs.getString("createtime"));
                Teacher teacher=new Teacher();
                teacher.setTeacherId(rs.getInt("teacherid"));
                Ueser ueser=new Ueser();

                ueser.setUeserName(rs.getString("username"));
                teacher.setUeser(ueser);
                mainTitle.setTeacher(teacher);
                mainTitle.setMainTitleId(rs.getInt("MainTitleId"));
                return mainTitle ;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeConnection(conn, pstmt, rs);
        }
        return null;
    }
    public List<MainTitle> getAllArticleTitle(String courseName){
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql="select *\n" +
                "from mainTitle,course,teachclass,teacher,ueser\n" +
                "where coursename=? and mainTitle.teachClassId=teachClass.teachClassId and course.courseId=teachClass.courseId and teacher.teacherid=maintitle.teacherid and ueser.ueserid=teacher.userid\n" +
                "order by mainTitle.createTime desc\n";
        List<MainTitle> allArticleTitlelist=new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,courseName);
            rs = pstmt.executeQuery();
            while (rs.next()){
                MainTitle mainTitle = new MainTitle();
                mainTitle.setTitle(rs.getString("title"));
                mainTitle.setCreateTime(rs.getString("createTime"));
                Ueser uese=new Ueser();
                uese.setUeserName(rs.getString("username"));
                Teacher teacher =new Teacher();
                teacher.setUeser(uese);
                mainTitle.setTeacher(teacher);
                allArticleTitlelist.add(mainTitle);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            this.closeConnection(conn,pstmt,rs);
        }
        return allArticleTitlelist;
    }
}
