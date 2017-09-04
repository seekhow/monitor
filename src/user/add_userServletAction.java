package user;

/**
 * Created by LJX on 2017/5/22.
 */

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;



public class add_userServletAction extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // String id = request.getParameter("id");
        String userId = request.getParameter("user_id");
        String userName = request.getParameter("user_name");
        String userGender = request.getParameter("user_gender");

        String userPassword = request.getParameter("user_password");
        String addTime = request.getParameter("add_time");
        request.setCharacterEncoding("UTF-8");
        System.out.print("1111");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
            response.sendRedirect("user.jsp");
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
    //        System.out.println("我的知识;"+deviceStatus);
            System.out.println("Connect Database Ok！！！");
            String sql = "insert into user_file(user_id,user_name,user_gender,user_password,add_time) values('" + userId + "','" + userName + "','" + userGender + "','" + userPassword + "','" + addTime + "')";
            statement.executeUpdate(sql);
            System.out.println(sql);
            System.out.println("关闭");
            System.out.println("跳转");
            statement.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
