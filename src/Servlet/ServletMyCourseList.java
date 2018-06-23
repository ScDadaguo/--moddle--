package Servlet;

import Dao.CourseDao;
import entity.LearnClass;
import entity.Student;
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

@WebServlet("/ServletMyCourseList")
public class ServletMyCourseList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Student student;
        Teacher teacher;
       Object obj= session.getAttribute("user");
       // try to find obj's type
        if(obj instanceof Student)
        {
            student = (Student) session.getAttribute("user");
            String userId=student.getUeser().getId();
            CourseDao courseDao =new CourseDao();
            List<LearnClass> learnClassList= courseDao.getAllMyCourse(userId);
            session.setAttribute("myCourseList",learnClassList);
            request.getRequestDispatcher("MyCourseList.jsp").forward(request,response);
        }

        if (obj instanceof Teacher){
            teacher=(Teacher)session.getAttribute("user");
            String userId=teacher.getUeser().getId();
            CourseDao courseDao =new CourseDao();
            List<TeachClass> teachClassList= courseDao.getAllTeachCourse(userId);
            session.setAttribute("myCourseList",teachClassList);
            //name must be same
            request.getRequestDispatcher("MyTeachCourseList.jsp").forward(request,response);
        }


        }

    }

