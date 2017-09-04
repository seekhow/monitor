package wechat.pojo;

/**
 * Created by seekhow on 2017/7/4.
 */
public class WeixinGroup {
    // 分组id
    private int id;
    // 分组名称
    private String name;
    // 分组内的用户数
    private int count;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
