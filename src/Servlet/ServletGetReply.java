package Servlet;

import Dao.CommentDao;
import entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/ServletGetReply")
public class ServletGetReply extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String commentJson=readJSONString(request);
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        System.out.println(commentJson);
        String userIdPattern = "id\":(\\d+),\"body\":\"(.*?)\",\"mainTitleId\":(\\d+),\"toName\":\"(.*?)\",\"topicId\":\"(\\d+)\"}";
        Pattern r = Pattern.compile(userIdPattern);
        Matcher m = r.matcher(commentJson);

        if (m.find( )) {

            String userId=m.group(1) ;
            String body= m.group(2);
            String mainTitleId=m.group(3);
            String touserId=m.group(4);
            String toTopicId=m.group(5);
            MainTitle mainTitle=new MainTitle();
            mainTitle.setMainTitleId(Integer.parseInt(mainTitleId));
            HttpSession session =request.getSession();
            Object obj= session.getAttribute("user");
            Ueser ueser=getUeser(obj,request.getSession());
            Topic comment=new Topic();
            comment.setMainTitlel(mainTitle);
            comment.setUeser(ueser);
            comment.setBody(body);
            CommentDao commentDao =new CommentDao();
            comment.setToUserId(touserId);
            comment.setTopicId(Integer.parseInt(toTopicId));
            Date day=new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String createTime= df.format(day);
            comment.setCreateTime(createTime);
            commentDao.insertReply(comment);
            String topicId=Integer.toString(commentDao.getLastCommentId(comment).getTopicId());
//            System.out.println(topicId);

            response.setContentType("text/json");

            String jsonString = "{\"userId\":\""+ueser.getId()+"\",\"body\":\""+body+"\",\"crateTime\":\""+createTime
                    +"\",\"mainTitleId\":\""+mainTitleId+"\",\"topicId\":\""+topicId+"\",\"toTopicId\":\""+toTopicId+"\",\"touserId\":\""+touserId+"\"}";
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
            PrintWriter writer = response.getWriter();
            writer.append(jsonString);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public String readJSONString(HttpServletRequest request){
        StringBuffer json = new StringBuffer();
        String line = null;
        try {
            BufferedReader reader = request.getReader();
            while((line = reader.readLine()) != null) {
                json.append(line);
            }
        }
        catch(Exception e) {
            System.out.println(e.toString());
        }
        return json.toString();
    }
    public Ueser getUeser(Object obj, HttpSession session) {
        Student student;
        Teacher teacher;
        if (obj instanceof Student) {
            student = (Student) session.getAttribute("user");
            return student.getUeser();
        }

        else  {
            teacher = (Teacher) session.getAttribute("user");
            return teacher.getUeser();

        }
    }
}
