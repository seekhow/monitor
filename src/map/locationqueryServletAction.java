package map;

import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by asua-pc on 2017/5/25.
 */
public class locationqueryServletAction extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deviceid = request.getParameter("device_id");
        request.setCharacterEncoding("UTF-8");
        //开始查询数据库
        List jsonList = new ArrayList();
        try {
            System.out.println("1");
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            //构造sql语句，根据传递过来的查询条件参数，目前是deviceId和gpsTime
            String sql="select * from device_file where device_id='"+deviceid+"'order by device_id";
            System.out.println(sql);
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Map map = new HashMap();
                map.put("deviceID",rs.getString("device_id"));
                map.put("gps_time",rs.getString("gpstime"));
                map.put("recv_time",rs.getString("recvtime"));
                map.put("longitude",rs.getString("Longitude"));
                map.put("latitude",rs.getString("Latitude"));
                map.put("device_content",rs.getString("content"));
                jsonList.add(map);
            }
            statement.close();
            conn.close();
            System.out.println("数据库关闭了！！！");
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
        }
        //////////数据库查询完毕，得到了json数组jsonList//////////
        //下面开始构建返回的json
        JSONObject json=new JSONObject();
        try {
            json.put("aaData",jsonList);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        try {
            json.put("result_msg","ok");	//如果发生错误就设置成"error"等
        } catch (JSONException e) {
            e.printStackTrace();
        }
        try {
            json.put("result_code",0);	//返回0表示正常，不等于0就表示有错误产生，错误代码
        } catch (JSONException e) {
            e.printStackTrace();
        }
        System.out.println("最后构造得到的json是："+json.toString());
        response.setContentType("text/html; charset=UTF-8");
        try {
            response.getWriter().print(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("返回结果给调用页面了。");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
