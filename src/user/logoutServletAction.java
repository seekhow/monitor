package user;

import org.apache.tools.ant.taskdefs.condition.Http;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by seekhow.cn on 2017/5/22.
 */
public class logoutServletAction extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        if(session==null){
            response.sendRedirect("login.html");
            return;
        }
        session.invalidate();
        response.sendRedirect("login.html");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        if(session==null){
            response.sendRedirect("login.html");
            return;
        }
        session.invalidate();
        response.sendRedirect("login.html");
    }
}