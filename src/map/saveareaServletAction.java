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
 * Created by asua-pc on 2017/5/31.
 */
public class saveareaServletAction extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String points=request.getParameter("points");
        String layerId=request.getParameter("layer_id");
        String description=request.getParameter("description");
        System.out.println("points:"+points);
        System.out.println("layerId:"+layerId);
        System.out.println("description:"+description);
        String action="save_data";
        List jsonList = new ArrayList();
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            System.out.println("Connect Ok！！！");
            //构造sql语句，根据传递过来的查询条件参数，目前是deviceId和gpsTime
            String sql="insert into gis_feature(points,layer_id,description) values('"+points+"','"+layerId+"','"+description+"')";
            System.out.println(sql);
            statement.executeUpdate(sql);
            statement.close();
            conn.close();
            System.out.println("close");
        } catch (SQLException sqlexception) {
            System.out.println("error");
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
            json.put("action",action);
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
        System.out.println(json.toString());
        response.setContentType("application/json; charset=UTF-8");
        try {
            response.getWriter().print(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("OK");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String points=request.getParameter("points");
        String layerId=request.getParameter("layer_id");
        String description=request.getParameter("description");
        System.out.println("points:"+points);
        System.out.println("layerId:"+layerId);
        System.out.println("description:"+description);
        //说明：本例子需要引入json.jar包和jdbc包，拷贝到Tomcat的common/lib下重启Tomcat或者应用的WEB-INF/lib下
        //开始链接数据库
        String action="save_data";
        List jsonList = new ArrayList();
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            System.out.println("Connect Ok！！！");
            //构造sql语句，根据传递过来的查询条件参数，目前是deviceId和gpsTime
            String sql="insert into gis_feature(points,layer_id,description) values('"+points+"','"+layerId+"','"+description+"')";
            System.out.println(sql);
            statement.executeUpdate(sql);
            statement.close();
            conn.close();
            System.out.println("close");
        } catch (SQLException sqlexception) {
            System.out.println("error");
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
            json.put("action",action);
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
        System.out.println(json.toString());
        response.setContentType("application/json; charset=UTF-8");
        try {
            response.getWriter().print(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("OK");
    }
}
