package Servlet;

import Dao.MainTitleDao;
import entity.MainTitle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/Servlet_printAllArticleTitle")
public class Servlet_printAllArticleTitle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        如果是登陆状态，就可以直接进去
//        HttpSession session = request.getSession();
//        session.getAttribute("")
        String courseName=  request.getParameter("courseName");

        List<MainTitle> allArticleTitlelist=null;
        MainTitleDao mainTitleDao=new MainTitleDao();
        allArticleTitlelist=mainTitleDao.getAllArticleTitle(courseName);
        request.setAttribute("allArticleTitlelist",allArticleTitlelist);
        request.getRequestDispatcher("enter.jsp").forward(request,response);


    }
}
