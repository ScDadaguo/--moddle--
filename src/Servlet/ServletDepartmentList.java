package Servlet;

import Dao.DepartmentDao;
import entity.Department;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/6/6.
 */
@WebServlet("/ServletDepartmentList")
public class ServletDepartmentList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session=request.getSession();
        DepartmentDao departmentDao=new DepartmentDao();
        List<Department> departmentList=null;
        departmentList=departmentDao.getdepartments();
        request.setAttribute("departmentList",departmentList);
        request.getRequestDispatcher("Department.jsp").forward(request,response);

    }
}
