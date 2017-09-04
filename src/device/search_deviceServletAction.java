package device;

import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by asua-pc on 2017/5/11.
 */
public class search_deviceServletAction extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
      doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List jsonList = new ArrayList();
        String device_id = request.getParameter("device_id");
        String username=(String)request.getSession().getAttribute("sessionID");
        String userrole=(String)request.getSession().getAttribute("sessionRole");
        try {
            System.out.println("1");
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();

            System.out.println(device_id);
            String sql="";
            if (userrole.equals("Manager")) {
                sql="select * from device_file where device_id like '%" + device_id + "%'";
            }else {
                sql = "select * from device_file where device_id like '%" + device_id + "%'and user_name like '" + username + "' ";
            }
            System.out.println(sql);
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                List list = new ArrayList();
                list.add(rs.getString("device_id"));
                list.add(rs.getString("device_name"));
                list.add(rs.getString("device_host"));
                list.add(rs.getString("device_status"));
                list.add(rs.getString("content"));
                list.add(rs.getString("id"));
                jsonList.add(list);
            }
            statement.close();
            conn.close();

        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
        }

        JSONObject json=new JSONObject();
        try {
            json.put("aaData",jsonList);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        try {
            json.put("result_msg","ok");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        try {
            json.put("result_code",0);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        System.out.println(json.toString());
        response.setContentType("text/html; charset=UTF-8");
        try {
            response.getWriter().print(json);
            response.getWriter().flush();
            response.getWriter().close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
