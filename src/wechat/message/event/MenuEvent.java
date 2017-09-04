package wechat.message.event;

/**
 * Created by asua-pc on 2017/6/18.
 */
public class MenuEvent extends BaseEvent{
    // 事件KEY值，与自定义菜单接口中KEY值对应
    private String EventKey;

    public String getEventKey() {
        return EventKey;
    }

    public void setEventKey(String eventKey) {
        EventKey = eventKey;
    }
}
