package Servlet;

import Dao.StudentDao;
import Dao.TeacherDao;
import entity.Student;
import entity.Teacher;
import entity.Ueser;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/6/6.
 */
@WebServlet("/ServletAlter")
public class ServletAlter extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");


        /*
        if id is equal 1 try to update my information
        else id is equal 2 try to change my password
        */
        if (id.equals("1")) {
            Student student = (Student) session.getAttribute("user");
            Ueser user = student.getUeser();
            String email = request.getParameter("email");
            String nickName = request.getParameter("nickname");
            StudentDao studentDao = new StudentDao();
            Ueser ueser = studentDao.update(user, email, nickName);
            if (ueser != null) {
                student.setUeser(user);
                session.removeAttribute("user");
                session.setAttribute("user", student);
                request.getRequestDispatcher("AlertSelf.jsp").forward(request, response);
//            Student student = (Student) session.getAttribute("user");
            } else {
                request.setAttribute("error", "修改错误");
            }
        } else if (id.equals("2")) {
            Student student = (Student) session.getAttribute("user");
            Ueser user = student.getUeser();
            String oldpassword = request.getParameter("oldpassword");
            String newpassword = request.getParameter("password");
            if (oldpassword.equals(student.getUeser().getPassword())) {
                StudentDao studentDao = new StudentDao();
                Ueser ueser = studentDao.changeMyPassWord(user, newpassword);
                if (ueser != null) {
                    student.setUeser(ueser);
                    session.removeAttribute("user");
                    session.setAttribute("user", student);
                    request.getRequestDispatcher("ChangePassWordDone.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "修改失败");
                }

            } else {
                request.setAttribute("error", "修改错误");
            }
        }else  if (id.equals("3")){
            // if id equals "3" is mean to change teacher's information
            Teacher teacher = (Teacher) session.getAttribute("user");
            Ueser ueser=teacher.getUeser();
            String email = request.getParameter("email");
            String nickName = request.getParameter("nickname");

            TeacherDao teacherDao = new TeacherDao();
            Ueser user = teacherDao.update(ueser,email,nickName);

            if (ueser != null) {
                teacher.setUeser(user);
                session.removeAttribute("user");
                session.setAttribute("user", teacher);
                request.getRequestDispatcher("AlterTeacherSelf.jsp").forward(request, response);
//            Student student = (Student) session.getAttribute("user");
            } else {
                request.setAttribute("error", "修改错误");
            }
        }else if (id.equals("4")) {
            Teacher teacher = (Teacher) session.getAttribute("user");
            Ueser user = teacher.getUeser();
            String oldpassword = request.getParameter("oldpassword");
            String newpassword = request.getParameter("password");
            if (oldpassword.equals(teacher.getUeser().getPassword())) {
                StudentDao studentDao = new StudentDao();
                Ueser ueser = studentDao.changeMyPassWord(user, newpassword);
                if (ueser != null) {
                    teacher.setUeser(ueser);
                    session.removeAttribute("user");
                    session.setAttribute("user", teacher);
                    request.getRequestDispatcher("ChangePassWordDone.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "修改失败");
                }

            } else {
                request.setAttribute("error", "修改错误");
            }
        }
    }
}
