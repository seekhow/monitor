package wechat.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by asua-pc on 2017/6/20.
 */
public class AddMessage {
    public void PostMessage(String answer, String username,String content)  {
        String i_answer = answer;
        String i_content = content;
        String i_username = username;

        System.out.print(i_answer+" "+i_content+" "+i_username);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            String sql = "insert into message_file(answer,content,user_name) values('" + i_answer + "','" + i_content + "','" + i_username + "')";
            System.out.print(sql);
            statement.executeUpdate(sql);
            statement.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }
}
