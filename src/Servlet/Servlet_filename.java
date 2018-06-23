package Servlet;



import Dao.UpFileDao;
import entity.UpFile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/Servlet_filename")
public class Servlet_filename extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UpFile> upFileList=null;
        UpFileDao upFileDao=new UpFileDao();
        upFileList=upFileDao.getfilename();
        request.setAttribute("upFileList",upFileList);
        request.getRequestDispatcher("enter.jsp").forward(request,response);

    }
}
