package Dao;

import entity.Department;
import entity.Teacher;
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
public class UeserDao extends SqlBean {
    public List<Ueser> getAllUer(){
        String sql = "Select * from Ueser";

        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Ueser> ueserList = new ArrayList<Ueser>();
        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                Ueser objUeser = new Ueser();
                objUeser.setUeserName(rs.getString("username"));


                ueserList.add(objUeser);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.closeConnection(conn, pstmt, rs);
        }
        return ueserList;
    }
    public Ueser getOneUser(String id){
        //get a teacher instance from database
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql ="select *\n" +
                "from Ueser\n" +
                "where ueserid=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Ueser ueser =new Ueser();
                ueser.setUeserName(rs.getString("username"));
                ueser.setId(rs.getString("ueserid"));
                ueser.setEmail(rs.getString("password"));
                ueser.setNickname(rs.getString("nickname"));
                ueser.setUeserImg(rs.getString("userimg"));
                return ueser;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeConnection(conn, pstmt, rs);
        }
        return null;
    }
    public Ueser updateImage(Ueser ueser,String imageName){
        String ueserId=ueser.getId();
        String sql="update ueser\n" +
                "set userimg=?\n" +
                "where ueserid=?";
        ResultSet rs = null;
        int rolls = 0;
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        List<Object> paramValues = new ArrayList<Object>();
        paramValues.add(imageName);
        paramValues.add(ueserId);
        try {
            pstmt = conn.prepareStatement(sql);
            if (paramValues != null && paramValues.size() > 0)
                this.setValues(pstmt, paramValues);
            rolls = pstmt.executeUpdate();
            if (rolls!=0){
                ueser.setUeserImg(imageName);

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

