package Dao;

import entity.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
public class TeacherDao extends SqlBean {
    public Teacher getTeacherInfo(String teacherName){
        //get a teacher instance from database
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select *\n " +
        "from teacher,Ueser,department\n" +
                "where teacher.userId=ueser.ueserid and department.departmentId=teacher.departmentid and ueser.username=?";
        List<Object> paramValues = new ArrayList<Object>();
        paramValues.add(teacherName);
        try {
            pstmt = conn.prepareStatement(sql);
            if (paramValues != null && paramValues.size() > 0)
                this.setValues(pstmt, paramValues);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Teacher teacher = new Teacher();
                Ueser ueser = new Ueser();
                Department department =new Department();
                department.setDepartmentId(rs.getInt("Departmentid"));
                teacher.setTeacherId(rs.getInt("teacherid"));
                teacher.setDepartment(department);
                ueser.setCreateTime(rs.getString("createTime"));
                ueser.setPassword(rs.getString("password"));
                ueser.setUeserImg(rs.getString("userimg"));
                ueser.setEmail(rs.getString("email"));
                ueser.setId(rs.getString("ueserid"));
                ueser.setUeserImg(rs.getString("userimg"));
                ueser.setUeserName(rs.getString("username"));
                ueser.setNickname(rs.getString("nickname"));
                teacher.setUeser(ueser);
                return teacher;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeConnection(conn, pstmt, rs);
        }
        return null;
    }

    public Teacher login(Ueser user) {
        String id = user.getId();
        String passWord = user.getPassword();
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select *\n" +
                "from teacher,Ueser,teachClass,course\n" +
                "where ueserid=? and password=? and teacher.userId=Ueser.ueserid and teachClass.teacherId=teacher.teacherId and course.courseId=teachClass.courseId\n";
        List<Object> paramValues = new ArrayList<Object>();
        paramValues.add(id);
        paramValues.add(passWord);
        try {
            pstmt = conn.prepareStatement(sql);
            if (paramValues != null && paramValues.size() > 0)
                this.setValues(pstmt, paramValues);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Teacher teacher =new Teacher();
                Ueser ueser = new Ueser();
                TeachClass teachClass=new TeachClass();
                Course course=new Course();
                ueser.setCreateTime(rs.getString("createTime"));
                ueser.setPassword(rs.getString("password"));
                ueser.setEmail(rs.getString("email"));
                ueser.setId(rs.getString("ueserid"));
                ueser.setUeserName(rs.getString("username"));
                ueser.setNickname(rs.getString("nickname"));
                ueser.setUeserImg(rs.getString("userimg"));
                teacher.setTeacherId(rs.getInt("teacherid"));
                teacher.setUeser(ueser);
                course.setId(rs.getInt("courseId"));
                course.setCourseName(rs.getString("coursename"));
                course.setEndTime(rs.getDate("EndTime"));
                course.setStartTime(rs.getDate("StartTime"));
                course.setContent(rs.getString("Content"));
                course.setCourseImg(rs.getString("courseImg"));

                teachClass.setCourse(course);
                teachClass.setTeacherClassId(rs.getInt("teachClassId"));
                teachClass.setTeacher(teacher);


                return teacher;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeConnection(conn, pstmt, rs);
        }
        return null;
    }

    public Ueser update(Ueser user,String email,String nickName) {
        String ueserid = user.getId();
        ResultSet rs = null;
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        int rolls = 0;
        String sql = "update ueser \n" +
                "set email=?,nickname=?\n" +
                "where ueserid=?";
        List<Object> paramValues = new ArrayList<Object>();
        paramValues.add(email);
        paramValues.add(nickName);
        paramValues.add(ueserid);
        try {
            pstmt = conn.prepareStatement(sql);
            if (paramValues != null && paramValues.size() > 0)
                this.setValues(pstmt, paramValues);
            rolls = pstmt.executeUpdate();
            if (rolls!=0){
                user.setEmail(email);
                user.setNickname(nickName);
                return user;
            }else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeConnection(conn, pstmt, rs);
        }
        return null;
    }


}
