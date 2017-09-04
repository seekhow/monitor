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

/**
 * Created by asua-pc on 2017/5/11.
 */
public class modify_userServletAction extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        // String id = request.getParameter("id");
        String userId = request.getParameter("user_id");
        String userName = request.getParameter("user_name");
        String userGender = request.getParameter("user_gender");

        String userPassword = request.getParameter("user_password");
        String addTime = request.getParameter("add_time");
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
            System.out.println("Connect Database Ok！！！<br>");
            String sql = "update user_file set user_id='" + userId+ "',user_name='" + userName + "',user_gender='" + userGender + "',user_password='" + userPassword + "' ,add_time='" + addTime + "'where id=" + id;
            statement.executeUpdate(sql);
            //out.println(sql);
            statement.close();
            conn.close();
            System.out.println(sql);
            response.sendRedirect("user.jsp");
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
        }
    }
}
