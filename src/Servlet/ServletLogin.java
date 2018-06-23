package Servlet;

import Dao.StudentDao;
import Dao.TeacherDao;
import Dao.UeserDao;
import entity.Student;
import entity.Teacher;
import entity.Ueser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2018/6/4.
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");//防止乱码
        String identity=request.getParameter("radio");
        String id=request.getParameter("id");
        UeserDao ueserDao=new UeserDao();
        Ueser oneUeser=null;
        oneUeser=ueserDao.getOneUser(id);
        session.setAttribute("oneUeser",oneUeser);


        String passWord=request.getParameter("password");
        if (identity.equals("student")){
            Ueser ueser=new Ueser();
            StudentDao studentDao =new StudentDao();
            ueser.setId(id);
            ueser.setPassword(passWord);
            Student student=studentDao.login(ueser);
            if (student != null){

                session.setAttribute("user",student);
                System.out.println("学生登陆成功");
                request.getRequestDispatcher("StudentPersonalPage.jsp").forward(request,response);
//                response.sendRedirect("PersonalPage.jsp");
            }else {
                request.getRequestDispatcher("Login.jsp").forward(request,response);
            }
        }
        if (identity.equals("teacher")){
            Ueser ueser=new Ueser();
            TeacherDao teacherDao=new TeacherDao();
            ueser.setId(id);
            ueser.setPassword(passWord);
            Teacher teacher=teacherDao.login(ueser);
            if (teacher != null){
                session.setAttribute("user",teacher);
                System.out.println("教师登入成功");
                request.getRequestDispatcher("TeacherPersonalPage.jsp").forward(request,response);
            }else {
                request.getRequestDispatcher("Login.jsp").forward(request,response);
            }
        }

    }
}
