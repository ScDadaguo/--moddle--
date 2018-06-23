package Servlet;

import Dao.MainTitleDao;
import Dao.TeachClassDao;
import entity.MainTitle;
import entity.TeachClass;
import entity.Teacher;
import org.eclipse.jdt.internal.compiler.batch.Main;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/Servlet_insertArticle")
public class Servlet_insertArticle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession();
//        得到teacherid，courseName
        Teacher teacher= (Teacher) session.getAttribute("user");
        int teacherId=teacher.getTeacherId();
        String courseName=request.getParameter("courseName");
//        利用teacherClassDao来得到整个teacherClass完整3张表的信息
        TeachClassDao teachClassDao=new TeachClassDao();
        TeachClass teachClass=null;
        teachClass=teachClassDao.getTeacherClass(teacherId,courseName);


        String title = request.getParameter("h1");
        String body = request.getParameter("paras");

//        String user = request.getParameter("user");

        int num=0;
//        拿出本地实时时间
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        MainTitle mainTitle = new MainTitle();
        mainTitle.setTitle(title);
        mainTitle.setBody(body);
        mainTitle.setCreateTime(df.format(day));
        TeachClass teachClass1=new TeachClass();
        teachClass1.setTeacherClassId(teachClass.getTeacherClassId());
        Teacher teacher1=new Teacher();
        teacher1.setTeacherId(teachClass.getTeacher().getTeacherId());
        mainTitle.setTeachClass(teachClass1);
        mainTitle.setTeacher(teacher1);
        MainTitleDao mainTitleDao=new MainTitleDao();
        mainTitleDao.insert(mainTitle);
//        int num = 0;
        System.out.println("插入数据库成功");
        String articleTitle=mainTitle.getTitle();
        request.getRequestDispatcher("/Servlet_printArticle?title="+articleTitle).forward(request,response);
    }
}
