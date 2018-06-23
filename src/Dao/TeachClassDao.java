package Dao;

import entity.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TeachClassDao extends SqlBean{
//    由知道teacherid和teacherclassid 在这三个表中TeachClass,course,teacher得到所有信息
    public TeachClass getTeacherClass(int teacherId,String courseName){
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql="select *\n" +
                "from Course,teachClass,teacher\n" +
                "where course.courseId=teachClass.courseId and teacher.teacherId=teachClass.teacherId\n" +
                "and teacher.teacherId=? and course.coursename=?  ";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,teacherId);
            pstmt.setString(2,courseName);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Course course=new Course();
                course.setId(rs.getInt("courseId"));
                course.setCourseName(rs.getString("courseName"));
                Teacher teacher =new Teacher();
                teacher.setTeacherId(rs.getInt("teacherId"));
                TeachClass teachClass=new TeachClass();
                teachClass.setTeacherClassId(rs.getInt("teachclassid"));
                teachClass.setTeacher(teacher);
                teachClass.setCourse(course);
                return teachClass;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeConnection(conn, pstmt, rs);
        }
        return null;

    }
}
