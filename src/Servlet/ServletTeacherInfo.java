package Servlet;

import Dao.CourseDao;
import Dao.TeacherDao;
import entity.TeachClass;
import entity.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/ServletTeacherInfo")
public class ServletTeacherInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teachername = request.getParameter("name");
        TeacherDao teacherDao = new TeacherDao();
        //get a teacher instance from database
        Teacher teacher = teacherDao.getTeacherInfo(teachername);
        String teacherId=teacher.getUeser().getId();
        //get all teacher's class from database
        CourseDao courseDao = new CourseDao();
        List<TeachClass> teachClassList= courseDao.getAllTeachClass(teacherId);
//        System.out.println(teachClassList.get(1).getCourse().getName());
        HttpSession session = request.getSession();

        session.setAttribute("teacher",teacher);
        session.setAttribute("teachClassList",teachClassList);
//        System.out.println(teacher.getUeser().getName());
        request.getRequestDispatcher("TeacherInfo.jsp").forward(request,response);
    }
}
