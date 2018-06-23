package Dao;

import entity.*;
import entity.Class;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
public class StudentDao extends SqlBean {
    public Student login(Ueser user) {
        String id = user.getId();
        String passWord = user.getPassword();
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "Select * \n" +
                "from Ueser,Student,class,department \n" +
                "where ueserid=? and password=? and Ueser.ueserId=Student.userId and Student.classid=class.classid and class.departmentId=department.departmentId";
        List<Object> paramValues = new ArrayList<Object>();
        paramValues.add(id);
        paramValues.add(passWord);
        try {
            pstmt = conn.prepareStatement(sql);
            if (paramValues != null && paramValues.size() > 0)
                this.setValues(pstmt, paramValues);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Student student1 = new Student();
                Class aclass = new Class();
                Ueser ueser = new Ueser();
                Department department = new Department();
                aclass.setClassId(rs.getInt("classId"));
                aclass.setClassName(rs.getString("className"));
                department.setDepartmentId(rs.getInt("departmentId"));
                department.setDepartmentName(rs.getString("departmentName"));
                department.setContent(rs.getString("content"));
                ueser.setCreateTime(rs.getString("createTime"));
                ueser.setPassword(rs.getString("password"));
                ueser.setEmail(rs.getString("email"));
                ueser.setId(rs.getString("ueserid"));
                ueser.setUeserImg(rs.getString("userimg"));
                ueser.setUeserName(rs.getString("username"));
                ueser.setNickname(rs.getString("nickname"));
                aclass.setDepartment(department);
                student1.setUeser(ueser);
                student1.setAclass(aclass);
                student1.setStudentId(rs.getInt("studentId"));
                return student1;
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

    public  Ueser changeMyPassWord(Ueser ueser,String newPassWord){
        //change password
        String ueserid = ueser.getId();
        ResultSet rs = null;
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        int rolls = 0;
        String sql = "update ueser \n" +
                "set password=?\n" +
                "where ueserid=?";
        List<Object> paramValues = new ArrayList<Object>();
        paramValues.add(newPassWord);

        paramValues.add(ueserid);
        try {
            pstmt = conn.prepareStatement(sql);
            if (paramValues != null && paramValues.size() > 0)
                this.setValues(pstmt, paramValues);
            rolls = pstmt.executeUpdate();
            if (rolls!=0){
                ueser.setPassword(newPassWord);
                return ueser;
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



