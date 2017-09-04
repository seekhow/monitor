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
public class readareaServletAction extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String featureId=request.getParameter("feature_id");
        String points=request.getParameter("points");
        String layerId=request.getParameter("layer_id");
        System.out.println("featureId："+featureId);
        System.out.println("points："+points);
        System.out.println("layerId："+layerId);
        List jsonList = new ArrayList();
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            System.out.println("Ok！！！");
            //构造sql语句，根据传递过来的查询条件参数，目前是deviceId和gpsTime
            String sql="select * from gis_feature ";
            //String sql="select * from gis_feature where layer_id='"+layerId+"'";
            System.out.println(sql);
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Map map = new HashMap();
                map.put("device",rs.getString("device"));
                map.put("points",rs.getString("points"));
                map.put("layer_id",rs.getString("layer_id"));
                map.put("description",rs.getString("description"));
                map.put("image_url",rs.getString("image_url"));
                jsonList.add(map);
            }
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
        String featureId=request.getParameter("feature_id");
        String points=request.getParameter("points");
        String layerId=request.getParameter("layer_id");
        System.out.println("featureId:"+featureId);
        System.out.println("points:"+points);
        System.out.println("layerId:"+layerId);
        //说明：本例子需要引入json.jar包和jdbc包，拷贝到Tomcat的common/lib下重启Tomcat或者应用的WEB-INF/lib下
        //开始链接数据库
        List jsonList = new ArrayList();
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            System.out.println("Ok!");
            //构造sql语句，根据传递过来的查询条件参数，目前是deviceId和gpsTime
            String sql="select * from gis_feature";
            System.out.println(sql);
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Map map = new HashMap();
                map.put("device",rs.getString("device"));
                map.put("points",rs.getString("points"));
                map.put("layer_id",rs.getString("layer_id"));
                map.put("description",rs.getString("description"));
                map.put("image_url",rs.getString("image_url"));
                jsonList.add(map);
            }
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
