package Dao;

import entity.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDao extends SqlBean {


    //this DAO is use to get course what is teacher teach and student learn
    public List<LearnClass> getAllMyCourse(String userId) {
        /*

        Procedure:getAllMyCourse
        Function:get all my course by stored procedure(存储过程)

        CREATE PROCEDURE getAllMyCourse
        @userId varchar(20)
        as
        BEGIN
        select *
        from Student,learnClass,teachClass,Course,teacher,Ueser
        where student.studentId=learnClass.studentId and learnClass.teachClassId=teachClass.teachClassId and teachClass.courseId=course.courseId
        and teacher.teacherId=teachClass.teacherId and teacher.userId=Ueser.ueserid
        and student.userId=@userId
        end
         */
        List<LearnClass> learnClassList = new ArrayList<LearnClass>();
        CallableStatement c = null;
        Connection conn = this.getConnection();
        ResultSet rs = null;
        try {

            c = conn.prepareCall("{call getAllMyCourse(?)}");
            c.setString(1, userId);
            rs = c.executeQuery();
            while (rs.next()) {
                LearnClass learnClass=new LearnClass();
                Teacher teacher = new Teacher();
                TeachClass teachClass = new TeachClass();
                Course course = new Course();
                Ueser ueser = new Ueser();
                Department department =new Department();
                department.setDepartmentId(rs.getInt("Departmentid"));
                teachClass.setTeacherClassId(rs.getInt("TeacherId"));
                course.setContent(rs.getString("Content"));
                course.setCourseImg(rs.getString("CourseImg"));
                course.setStartTime(rs.getDate("StartTime"));
                course.setEndTime(rs.getDate("EndTime"));
                course.setCourseName(rs.getString("courseName"));
                course.setId(rs.getInt("courseId"));
                teacher.setDepartment(department);
                teacher.setTeacherId(rs.getInt("TeacherId"));
                ueser.setEmail(rs.getString("Email"));
                ueser.setId(rs.getString("ueserid"));
                ueser.setUeserName(rs.getString("username"));
                ueser.setNickname(rs.getString("nickname"));
                ueser.setCreateTime(rs.getString("CreateTime"));
                teacher.setUeser(ueser);
                teachClass.setTeacher(teacher);
                teachClass.setCourse(course);
                learnClass.setLearnClassId(rs.getInt("learnclassId"));
                learnClass.setTeachClass(teachClass);

                learnClassList.add(learnClass);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeConnection(conn, c, rs);
        }

        return learnClassList;
    }
    public List<TeachClass> getAllTeachClass(String userId) {
        /*
        Views:teachClassViews
        Function:this view is get all teacher's class

        alter view teachClassViews
        as
        select teacher.teacherId,departmentid,teachClassId,classId,teachClass.courseId,userId,content,courseImg,startTime,endTime,course.coursename
        from teacher,teachClass,Course
        where teacher.teacherId=teachClass.teacherId and Course.courseId=teachClass.courseId
        */
        List<TeachClass> teachClassList = new ArrayList<TeachClass>();
        String sql="select *\n" +
                "from teachClassViews\n" +
                "where userid = ?";
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Object> paramValues = new ArrayList<Object>();
        paramValues.add(userId);
        try {

            pstmt = conn.prepareStatement(sql);
            if (paramValues != null && paramValues.size() > 0)
                this.setValues(pstmt, paramValues);
            rs = pstmt.executeQuery();
            while (rs.next()){
                TeachClass teachClass = new TeachClass();
                Course course = new Course();
                course.setId(rs.getInt("courseId"));
                course.setCourseName(rs.getString("coursename"));
                course.setEndTime(rs.getDate("EndTime"));
                course.setStartTime(rs.getDate("StartTime"));
                course.setContent(rs.getString("Content"));
                course.setCourseImg(rs.getString("courseImg"));
                teachClass.setCourse(course);
                teachClass.setTeacherClassId(rs.getInt("teacherId"));
                teachClassList.add(teachClass);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeConnection(conn, pstmt, rs);
        }

        return teachClassList;
    }
    public List<Course> getCourseName(int classid) {
        /*
        String sql = "select name \n" +
                "from Course,teachClass,Class\n" +
                "where Course.courseId=teachClass.courseId and teachClass.classId=class.classId\n" +
                "and class.classId=? order by starttime desc";
        String sql = "select name,starttime \n" +
                "from Course,teachClass,Class\n" +
                "where Course.courseId=teachClass.courseId and teachClass.classId=class.classId \n" +
                "and class.classId=? order by starttime desc";

        */
        String sql="select courseImg,coursename,username,starttime,content\n" +
                "from Ueser,Course,teachClass,teacher,class\n" +
                "where course.courseId=teachClass.courseId and teachClass.teacherId=teacher.teacherId and teacher.userId = Ueser.ueserid and teachClass.classId=class.classId\n" +
                "\tand class.classId=? order by starttime desc";

        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Course> coursenameList = new ArrayList<Course>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,classid);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Course sc = new Course();
//                Ueser us = new Ueser();
                sc.setCourseName(rs.getString("courseName"));
                sc.setStartTime(rs.getDate("startTime"));
                sc.setContent(rs.getString("content"));
                sc.setCourseImg(rs.getString("courseimg"));
//                us.setUeserName(rs.getString("ueserName"));
                coursenameList.add(sc);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            this.closeConnection(conn,pstmt,rs);
        }
        return coursenameList;

    }
    public List<String> searchCousenName() {

        String sql="select * FROM course";

        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<String> coursenameList = new ArrayList<String>();
        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            while (rs.next()){

//                Ueser us = new Ueser();
                String sc=rs.getString("courseName");

                coursenameList.add(sc);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            this.closeConnection(conn,pstmt,rs);
        }
        return coursenameList;

    }
    public List<Ueser> getUeserName(int classid) {
        /*
        String sql = "select name \n" +
                "from Course,teachClass,Class\n" +
                "where Course.courseId=teachClass.courseId and teachClass.classId=class.classId\n" +
                "and class.classId=? order by starttime desc";
        String sql = "select name,starttime \n" +
                "from Course,teachClass,Class\n" +
                "where Course.courseId=teachClass.courseId and teachClass.classId=class.classId \n" +
                "and class.classId=? order by starttime desc";
        */
        String sql="select coursename,username,starttime\n" +
                "from Ueser,Course,teachClass,teacher,class\n" +
                "where course.courseId=teachClass.courseId and teachClass.teacherId=teacher.teacherId and teacher.userId = Ueser.ueserid and teachClass.classId=class.classId\n" +
                "\tand class.classId=? order by starttime desc";
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Ueser> uesernameList = new ArrayList<Ueser>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,classid);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Ueser us = new Ueser();

                us.setUeserName(rs.getString("userName"));
                uesernameList.add(us);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            this.closeConnection(conn,pstmt,rs);
        }
        return uesernameList;

    }
    public List<TeachClass> getAllTeachCourse(String userId) {
        /*

        Procedure:getAllTeachCourse
        Function:get all my teached course by stored procedure(存储过程)

        CREATE PROCEDURE getAllTeachCourse
        @userId varchar(20)
        as
        BEGIN
        select *
        from learnClass,teachClass,Course,teacher,Ueser
        where  learnClass.teachClassId=teachClass.teachClassId and teachClass.courseId=course.courseId
        and teacher.teacherId=teachClass.teacherId and teacher.userId=Ueser.ueserid
        and teacher.userId=@userId
        end
         */
        List<TeachClass> teachClassList = new ArrayList<TeachClass>();
        CallableStatement c = null;
        Connection conn = this.getConnection();
        ResultSet rs = null;
        try {

            c = conn.prepareCall("{call getAllTeachCourse(?)}");
            c.setString(1, userId);
            rs = c.executeQuery();
            while (rs.next()) {

                Teacher teacher = new Teacher();
                TeachClass teachClass = new TeachClass();
                Course course = new Course();
                Ueser ueser = new Ueser();
                Department department =new Department();
                department.setDepartmentId(rs.getInt("Departmentid"));
                teachClass.setTeacherClassId(rs.getInt("TeacherId"));
                course.setContent(rs.getString("Content"));
                course.setCourseImg(rs.getString("CourseImg"));
                course.setStartTime(rs.getDate("StartTime"));
                course.setEndTime(rs.getDate("EndTime"));
                course.setCourseName(rs.getString("courseName"));
                course.setId(rs.getInt("courseId"));
                teacher.setDepartment(department);
                teacher.setTeacherId(rs.getInt("TeacherId"));
                ueser.setEmail(rs.getString("Email"));
                ueser.setId(rs.getString("ueserid"));
                ueser.setUeserName(rs.getString("username"));
                ueser.setNickname(rs.getString("nickname"));
                ueser.setCreateTime(rs.getString("CreateTime"));
                teacher.setUeser(ueser);
                teachClass.setTeacher(teacher);
                teachClass.setCourse(course);


                teachClassList.add(teachClass);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeConnection(conn, c, rs);
        }

        return teachClassList;
    }
}
