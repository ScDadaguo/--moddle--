package Dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
public class SqlBean {
    public  Connection conn;

    public Connection getConnection(){
        try {
            Context context=new InitialContext();
            DataSource ds=(DataSource)context.lookup("java:comp/env/jdbc/news");
            conn = ds.getConnection();
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public void closeConnection(Connection conn, PreparedStatement pstmt,
                                ResultSet rs) {
        try {
            if (conn != null){
                conn.close();}
            if (pstmt != null){
                pstmt.close();}
            if (rs != null){
                rs.close();}
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void closeConnection(Connection conn, CallableStatement cstmt,
                                ResultSet rs) {
        try {
            if (conn != null){
                conn.close();}
            if (cstmt != null){
                cstmt.close();}
            if (rs != null){
                rs.close();}
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void setValues(PreparedStatement pstmt, List<Object> paramValues)
            throws SQLException {
        for (int i = 0; i < paramValues.size(); i++) {
            pstmt.setObject(1 + i, paramValues.get(i));
        }
    }

    public int executeUpdate(String sql, List<Object> paramValues) {

        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        int rows = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            if (paramValues != null && paramValues.size() > 0) {
                setValues(pstmt, paramValues);
            }
            rows = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.closeConnection(conn, pstmt, null);
        }
        return rows;
    }
    public static void main(String[] args) {
        new SqlBean().getConnection();
    }

}
