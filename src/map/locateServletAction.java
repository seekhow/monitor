package map;

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
 * Created by asua-pc on 2017/5/25.
 */
public class locateServletAction extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deviceLongitude = request.getParameter("device_longitude");
        String deviceLatitude = request.getParameter("device_latitude");
        String deviceid = request.getParameter("device_id");
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
            String sql = "update device_file set Longitude='" + deviceLongitude + "',Latitude='" + deviceLatitude + "'where device_id=" + deviceid;
            statement.executeUpdate(sql);
            //out.println(sql);
            statement.close();
            conn.close();
            System.out.println(sql);
            response.sendRedirect("device.jsp");
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
            response.sendRedirect("device.jsp");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
