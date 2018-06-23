package Servlet;

import Dao.CourseDao;
import Dao.DepartmentDao;
import entity.Course;
import entity.Department;
import entity.Ueser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ServletSelectCourseName")
public class ServletSelectCourseName extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String ClassID = request.getParameter("ClassID");

        CourseDao courseDao = new CourseDao();
        List<Course> coursenameList =null;
        coursenameList = courseDao.getCourseName(Integer.parseInt(ClassID));
//        UeserDao ueserDao = new UeserDao();
        List<Ueser> uesernameList = null;
        uesernameList = courseDao.getUeserName(Integer.parseInt(ClassID));
        DepartmentDao departmentDao=new DepartmentDao();
        List<Department> departmentList=null;
        departmentList=departmentDao.getdepartments();
        request.setAttribute("departmentList",departmentList);
        request.setAttribute("coursenameList",coursenameList);
        request.setAttribute("uesernameList",uesernameList);
        request.getRequestDispatcher("CourseName.jsp").forward(request,response);






    }
}
