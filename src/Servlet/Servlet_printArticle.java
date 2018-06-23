package Servlet;

import Dao.CommentDao;
import Dao.MainTitleDao;


import entity.MainTitle;
import entity.Topic;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
@WebServlet("/Servlet_printArticle")
public class Servlet_printArticle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//       从enter拿到超链接中的title 然后根据sql title得到text 再利用printservelt 重新打印
        String title = request.getParameter("title");
        MainTitle mainTitle=null;
        MainTitleDao mainTitleDao=new MainTitleDao();
        mainTitle=mainTitleDao.prinArticle(title);
        HttpSession session = request.getSession();
        session.setAttribute("mainTitle",mainTitle);
        List<Topic> commentList=null;
        CommentDao commentDao=new CommentDao();

        commentList=commentDao.getAllComment(mainTitle.getMainTitleId());
        for (int i = 0; i <commentList.size() ; i++) {
            int topicId=commentList.get(i).getTopicId();

            List<Topic> replyList=commentDao.getReply(topicId);

            commentList.get(i).setReply(replyList);
        }



        session.setAttribute("commentList",commentList);
        request.getRequestDispatcher("articleComment.jsp").forward(request,response);






////——————————————————————————————————————————
//        try {
//            text=futextDao.gettext(title);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

//        ——————————————————————————————————————————
//        futextList=futextDao.getfutext();
//        Futext futext = futextList.get(futextList.size() - 1);
//        System.out.println(futext.getText());
//        if(text.getText()!=null){
//            request.setAttribute("futext",text);
//            System.out.println("该链接下有内容");
//        }
//        else {
//            request.setAttribute("futext",futext);
//        }
//        String user=request.getParameter("user");
//        if(user.equals("student")){
//            if (text.getHtml()!=null){
//                request.getRequestDispatcher("index_student_ALL.jsp").forward(request,response);
//            }else {
//                request.getRequestDispatcher("index_student.jsp").forward(request,response);
//            }
//
//        }else{
//            request.getRequestDispatcher("index.jsp").forward(request,response);
//        }

    }
}
