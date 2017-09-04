package device;

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
 * Created by asua-pc on 2017/5/11.
 */
public class delete_deviceServletAction extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        //out.println(id);
        request.setCharacterEncoding("UTF-8");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
            response.sendRedirect("device.jsp");
        }
        try {
            Connection conn = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            //out.println("Connect Database Ok！！！<br>");
            String sql = "delete from device_file where device_id="+"\'"+id+"\'";
            //out.println(sql);
            statement.executeUpdate(sql);
            statement.close();
            conn.close();
            response.sendRedirect("device.jsp");
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
            response.sendRedirect("device.jsp");
        }

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        //out.println(id);
        request.setCharacterEncoding("UTF-8");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
            response.sendRedirect("device.jsp");
        }
        try {
            Connection conn = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            //out.println("Connect Database Ok！！！<br>");
            String sql = "delete from device_file where device_id="+"\'"+id+"\'";
            //out.println(sql);
            statement.executeUpdate(sql);
            statement.close();
            conn.close();
            response.sendRedirect("device.jsp");
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
            response.sendRedirect("device.jsp");
        }
    }
}
