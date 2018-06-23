package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/ServletShowImage")
public class ServletShowImage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userImg=request.getParameter("userImg");
        System.out.println(userImg);
//        String name=request.getParameter("name");
        String oldpath=this.getServletContext().getRealPath("/").replace("out\\artifacts\\Moddle_war_exploded\\","");
        String path=oldpath+"web\\images\\"+userImg;
//        String path="C:\\Users\\a\\Desktop\\WZBC_moodle\\web\\images\\"+userImg;
        FileInputStream fis=null;
        OutputStream os=response.getOutputStream();

        //if can't find images ,just use default images
        try{
            fis=new FileInputStream(path);
            byte[] bytes=new byte[fis.available()];
            fis.read(bytes);
            os.write(bytes);

        }catch(Exception e){
            fis=new FileInputStream(oldpath+"web\\images\\defult.jpg");
            byte[] bytes=new byte[fis.available()];
            fis.read(bytes);
            os.write(bytes);
        }finally {

            os.close();
            fis.close();
        }
    }
}
