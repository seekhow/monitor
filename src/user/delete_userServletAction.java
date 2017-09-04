package user;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by asua-pc on 2017/5/12.
 */
public class delete_userServletAction extends HttpServlet {
    public void doGet (HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        String id = request.getParameter("id");System.out.print("1111");
        request.setCharacterEncoding("UTF-8");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
        }
        try {
            Connection conn = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            String sql = "delete from user_file where user_id="+"\'"+id+"\'";
            statement.executeUpdate(sql);
            statement.close();
            conn.close();
            response.sendRedirect("user.jsp");
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
            response.sendRedirect("user.jsp");
        }
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws  ServletException,IOException{
        String id = request.getParameter("id");System.out.print("1111");
        request.setCharacterEncoding("UTF-8");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
        }
        try {
            Connection conn = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            String sql = "delete from user_file where user_id="+"\'"+id+"\'";
            statement.executeUpdate(sql);
            statement.close();
            conn.close();
            response.sendRedirect("user.jsp");
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
            response.sendRedirect("user.jsp");
        }
    }
}
