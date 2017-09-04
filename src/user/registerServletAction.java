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
 * Created by asua-pc on 2017/5/22.
 */
public class registerServletAction extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String userId = request.getParameter("user_id");
        String password = request.getParameter("user_password");
        String username = request.getParameter("user_name");
        String usergender = request.getParameter("user_gender");
        String usertime = request.getParameter("user_time");
        String userrole = "Normal";
        System.out.println(userId+password+username+usergender+usertime+userrole);
        request.setCharacterEncoding("UTF-8");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
            response.sendRedirect("registerError.html");
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            String sql = "insert into user_file(user_id,user_password,user_name,user_gender,add_time,user_role) values('" + userId + "','" + password + "','" + username + "','" + usergender + "','" + usertime + "','" + userrole + "')";
            statement.executeUpdate(sql);
            System.out.println(sql);
            statement.close();
            conn.close();
            response.sendRedirect("login.html");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("registerError.html");
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String userId = request.getParameter("user_id");
        String password = request.getParameter("user_password");
        String username = request.getParameter("user_name");
        String usergender = request.getParameter("user_gender");
        request.setCharacterEncoding("UTF-8");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
            response.sendRedirect("registerError.html");
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            String sql = "insert into user_file(user_id,user_password,user_name,user_gender) values('" + userId + "','" + password + "','" + username + "','" + usergender + "')";
            statement.executeUpdate(sql);
            System.out.println(sql);
            statement.close();
            conn.close();
            response.sendRedirect("login.html");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("registerError.html");
        }
    }
}
