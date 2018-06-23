package Servlet;

import Dao.CommentDao;

import entity.MainTitle;
import entity.Topic;
import entity.Ueser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/Servlet_insertComment")
public class Servlet_insertComment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        int mainTitleId= Integer.parseInt(request.getParameter("mainTitleId"));
        String userid =request.getParameter("userid");
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime= df.format(day);
        String body =request.getParameter("title");
        String title =request.getParameter("title");
        MainTitle mainTitle=new MainTitle();
        mainTitle.setMainTitleId(mainTitleId);
        Ueser ueser =new Ueser();
        ueser.setId(userid);
        Topic comment=new Topic();
        comment.setMainTitlel(mainTitle);
        comment.setUeser(ueser);
        comment.setBody(body);
        comment.setCreateTime(createTime);
        comment.setTitle(title);
        CommentDao commentDao=new CommentDao();
        commentDao.insertComment(comment);
        System.out.println("评论插入数据库成功");

        List<Topic> commentList=null;
        commentList=commentDao.getAllComment(mainTitleId);
        Topic comment1=commentList.get(commentList.size()-1);
        HttpSession session=request.getSession();
        session.setAttribute("commentList",comment1);
        request.getRequestDispatcher("articleComment.jsp").forward(request,response);








    }
}
