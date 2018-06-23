package Dao;

import entity.Department;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/6/6.
 */
public class DepartmentDao extends SqlBean {
    public List<Department> getdepartments(){
        String sql = "select departengname,depimg,departmentName,content,departmentid from department ";
//        String sql="select COUNT(coursename)as countcoursename,departmentname,department.content,department.departmentid\n" +
//                "from Course,Class,department,teachClass\n" +
//                "where  department.departmentId=class.departmentId and class.classId = teachClass.classId and teachClass.courseId = course.courseId\n" +
//                "group by departmentname,department.content,department.departmentid";
        Connection conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Department> departmentList = new ArrayList<Department>();
        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            while (rs.next()){
                Department sc = new Department();
                sc.setDepartmentName(rs.getString("departmentName"));
                sc.setContent(rs.getString("content"));
                sc.setDepartmentId(rs.getInt("departmentid"));
                sc.setDepImg(rs.getString("depimg"));
                sc.setDepartEngName(rs.getString("departengname"));
//                sc.setCountcoursename(rs.getInt("countcoursename"));
                departmentList.add(sc);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            this.closeConnection(conn,pstmt,rs);
        }
        return departmentList;
    }


}
