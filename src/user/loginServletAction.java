package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class loginServletAction extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String user_id = request.getParameter("userid");
        String pass_word = request.getParameter("userpassword");
        try {
            System.out.println("2222");
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();

            System.out.println(user_id);
            String sql = "select * from user_file where user_id='" + user_id + "'" + "&&user_password='" + pass_word + "'";

            System.out.println(sql);
            ResultSet rs = statement.executeQuery(sql);
            if (rs.next()) {
                String role = rs.getString("user_role");
                System.out.println(role);
                statement.close();
                conn.close();
                request.getSession().setAttribute("sessionID", user_id);
                request.getSession().setAttribute("sessionPassword", pass_word);
                request.getSession().setAttribute("sessionRole", role);
                request.getSession().setMaxInactiveInterval(300);
                if (role.equals("Normal")) {
                    response.sendRedirect("user_oneshow.jsp");
                }
                if (role.equals("Manager")) {
                    response.sendRedirect("user.jsp");
                }
            } else {
                response.sendRedirect("login.html");
            }
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = request.getParameter("userid");
        String pass_word = request.getParameter("userpassword");
        try {
            System.out.println("2222");
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();

            System.out.println(user_id);
            String sql = "select * from user_file where user_id='" + user_id + "'" + "&&user_password='" + pass_word + "'";

            System.out.println(sql);
            ResultSet rs = statement.executeQuery(sql);
            if (rs.next()) {
                String role = rs.getString("user_role");
                System.out.println(role);
                statement.close();
                conn.close();
                request.getSession().setAttribute("sessionID", user_id);
                request.getSession().setAttribute("sessionPassword", pass_word);
                request.getSession().setAttribute("sessionRole", role);
                request.getSession().setMaxInactiveInterval(60);
                if (role.equals("Normal")) {
                    response.sendRedirect("user_oneshow.jsp");
                }
                if (role.equals("Manager")) {
                    response.sendRedirect("user.jsp");
                }
            } else {
                response.sendRedirect("login.html");
            }
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
        }
    }
}