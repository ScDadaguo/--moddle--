package Servlet;

import Dao.CourseDao;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/Servlet_search")
public class Servlet_search extends HttpServlet {
//    static  List<String> datas=new ArrayList<String>();
//    static {
//
//        datas.add("ajax");
//        datas.add("ajax post");
//        datas.add("语文");
//        datas.add("bill");
//        datas.add("james");
//        datas.add("jerry");
//    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        首先获得客户端发送来的keyword
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String keyword =request.getParameter("keyword");
//        获得关键之后进行处理，得到关联数据
        List<String> listdata=getData(keyword);
//        for (int i = 0; i <listdata.size() ; i++) {
//            System.out.println(listdata.get(i));
//        }
        HttpSession session =request.getSession();
        session.setAttribute("listdata",listdata);
//        返回json格式
        System.out.println(JSONArray.fromObject(listdata));
//        获得一个输出流
        response.getWriter().write(JSONArray.fromObject(listdata).toString());




    }

//    获得关联数据的方法
    public List<String> getData(String keyword){
        List<String> list=new ArrayList<String>();
        List<String> datas=null;
        CourseDao courseDao=new CourseDao();
        datas=courseDao.searchCousenName();
        for (String data:datas){
            if (data.contains(keyword)){
                list.add(data);
            }
        }
        return list;
    }
}
