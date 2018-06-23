package Dao;



import entity.TeachClass;
import entity.Teacher;
import entity.UpFile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UpFileDao extends SqlBean {
    public List<UpFile> getfilename(){
        String  sql="select filename,teachClass.teachclassid,teacher.teacherid,createtime from upFile,teachclass,teacher where upFile.teacherid=teacher.teacherid and upfile.teachclassid=teachclass.teachclassid";
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<UpFile> upFileList = new ArrayList<UpFile>();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){

                TeachClass teachClass=new TeachClass();
                Teacher teacher=new Teacher();
                teacher.setTeacherId(rs.getInt("TeacherId"));
                teachClass.setTeacherClassId(rs.getInt("teachclassid"));
                UpFile upFile = new UpFile();
                upFile.setFileName(rs.getString("filename"));
                upFile.setCreateTime(rs.getString("createTime"));
                upFile.setTeachClass(teachClass);
                upFile.setTeacher(teacher);
                upFileList.add(upFile);

            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn,pstmt,rs);
        }
        return upFileList;
    }
    public int insert( UpFile objUpFile){
        String sql = "Insert upfile Values (?,?,?,?)";
        List<Object> pValues = new ArrayList<Object>();
        pValues.add(objUpFile.getFileName());
        pValues.add(objUpFile.getTeachClass().getTeacherClassId());
        pValues.add(objUpFile.getTeacher().getTeacherId());
        pValues.add(objUpFile.getCreateTime());
        int rows = 0;

        try {
            rows = this.executeUpdate(sql,pValues);
        } catch (Exception e){
            e.printStackTrace();
        }

        return rows;
    }

//    public int delete( UpFile upFile){
//        String sql = "Delete list where filename=?";
//        List<Object> pValues = new ArrayList<Object>();
//        pValues.add(upFile());
//        int rows = 0;
//
//        try {
//            rows = this.executeUpdate(sql,pValues);
//        } catch (Exception e){
//            e.printStackTrace();
//        }
//
//        return rows;
//    }



}
