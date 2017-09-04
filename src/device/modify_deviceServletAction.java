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
public class modify_deviceServletAction extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        String deviceId = request.getParameter("device_id");
        String deviceName = request.getParameter("device_name");
        String deviceHost = request.getParameter("device_host");
        String deviceStatus = request.getParameter("device_status");
        String content = request.getParameter("content");
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
            //out.println("Connect Database Ok！！！<br>");
            String sql = "update device_file set device_id='" + deviceId+ "',device_name='" + deviceName + "',device_host='" + deviceHost + "',device_status='" + deviceStatus + "' ,content='" + content + "'where id=" + id;
            statement.executeUpdate(sql);
            //out.println(sql);
            statement.close();
            conn.close();
            System.out.println(sql);
            response.sendRedirect("/device.jsp");
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        String deviceId = request.getParameter("device_id");
        String deviceName = request.getParameter("device_name");
        String deviceHost = request.getParameter("device_host");
        String deviceStatus = request.getParameter("device_status");
        String content = request.getParameter("content");
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
            //out.println("Connect Database Ok！！！<br>");
            String sql = "update device_file set device_id='" + deviceId+ "',device_name='" + deviceName + "',device_host='" + deviceHost + "',device_status='" + deviceStatus + "' ,content='" + content + "'where id=" + id;
            statement.executeUpdate(sql);
            //out.println(sql);
            statement.close();
            conn.close();
            System.out.println(sql);
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
        }
    }
}
