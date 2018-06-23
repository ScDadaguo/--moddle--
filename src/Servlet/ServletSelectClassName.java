package Servlet;


import Dao.ClassDao;
import Dao.DepartmentDao;
import entity.Class;
import entity.Department;
import entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ServletSelectClassName")
public class ServletSelectClassName extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        ClassDao classDao=new ClassDao();
//        List<Class> classList=null;
//        classList= classDao.getclasses();
//        request.setAttribute("classnameList",classList);
//        request.getRequestDispatcher("ClassName.jsp").forward(request,response);
        DepartmentDao departmentDao=new DepartmentDao();
        List<Department> departmentList=null;
        departmentList=departmentDao.getdepartments();
        request.setAttribute("departmentList",departmentList);
        String DepartmentID = request.getParameter("departmentID");
        ClassDao classDao = new ClassDao();
        List<Class> classnameList = null;
        classnameList = classDao.getclassname(Integer.parseInt(DepartmentID));
        List<Student> studentList = null;
        studentList = classDao.getstudents(Integer.parseInt(DepartmentID));

        request.setAttribute("classnameList", classnameList);
        request.setAttribute("studentList", studentList);

        request.getRequestDispatcher("ClassName.jsp").forward(request, response);
    }


}
