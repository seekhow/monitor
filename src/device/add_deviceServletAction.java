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

public class add_deviceServletAction extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String deviceId = request.getParameter("device_id");
        String deviceName = request.getParameter("device_name");
        String deviceHost = request.getParameter("device_host");
        String deviceStatus = request.getParameter("device_status");
         String content = request.getParameter("content");

        String username=(String)request.getSession().getAttribute("sessionID");
        System.out.print(username);
        request.setCharacterEncoding("UTF-8");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
            response.sendRedirect("device.jsp");
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            String sql = "insert into device_file(device_id,device_name,device_host,device_status,content,user_name) values('" + deviceId + "','" + deviceName + "','" + deviceHost + "','" + deviceStatus + "','" + content + "','" + username + "')";
            System.out.print(sql);
            statement.executeUpdate(sql);
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
