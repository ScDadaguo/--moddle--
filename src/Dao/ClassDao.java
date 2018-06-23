package Dao;

import entity.Class;
import entity.Student;
import entity.Ueser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
public class ClassDao  extends  SqlBean{

    public List<Class> getclassname(int departmentid) {
        String sql = "select classname,classid from class where departmentid=?";
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Class> classList = new ArrayList<Class>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,departmentid);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Class sc = new Class();
                sc.setClassName(rs.getString("classname"));
                sc.setClassId(rs.getInt("classid"));
                classList.add(sc);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            this.closeConnection(conn,pstmt,rs);
        }
        return classList;
    }

    public List<Student> getstudents(int departmentid) {
        String sql = "select ueserid,username,className,studentId,Class.classId\n" +
                "from Ueser,Class,Student,department\n" +
                "where class.classId=student.classId and student.userId=ueser.ueserid  and class.departmentId=department.departmentId\n" +
                "and department.departmentId=?\n" +
                "order by className";
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Student> studentList = new ArrayList<Student>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(departmentid));
            rs = pstmt.executeQuery();
            while (rs.next()){
                Ueser us = new Ueser();
                Class cl = new Class();
                Student sc = new Student();
                sc.setStudentId(rs.getInt("studentId"));
                cl.setClassName(rs.getString("classname"));
                cl.setClassId(rs.getInt("classId"));
                us.setId(rs.getString("ueserid"));
                us.setUeserName(rs.getString("userName"));
                sc.setAclass(cl);
                sc.setUeser(us);
                studentList.add(sc);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            this.closeConnection(conn,pstmt,rs);
        }
        return studentList;
    }
}
