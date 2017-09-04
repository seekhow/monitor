package wechat.service;


import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import wechat.message.resp.TextMessage;
import wechat.util.MessageUtil;
import wechat.mysql.AddMessage;
import java.util.ArrayList;
import java.util.List;
import wechat.message.resp.Article;
import wechat.message.resp.NewsMessage;


/**
 * Created by asua-pc on 2017/6/18.
 */
public class CoreService {
    /**
     * 处理微信发来的请求
     *
     * @param
     * @return xml
     */

    public static String processRequest(HttpServletRequest request) {
        // xml格式的消息数据
        String respXml = null;
        // 默认返回的文本消息内容
        String respContent = "未知的消息类型！";
        //创建一个沟通数据库的对象
        AddMessage save = new AddMessage();
        try {
            // 调用parseXml方法解析请求消息
            Map<String, String> requestMap = MessageUtil.parseXml(request);
            // 发送方帐号
            String fromUserName = requestMap.get("FromUserName");
            // 开发者微信号
            String toUserName = requestMap.get("ToUserName");
            // 消息类型
            String msgType = requestMap.get("MsgType");

            // 回复文本消息
            TextMessage textMessage = new TextMessage();
            textMessage.setToUserName(fromUserName);
            textMessage.setFromUserName(toUserName);
            textMessage.setCreateTime(new Date().getTime());
            textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);

            // 文本消息
            if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
                respContent = "您发送的是文本消息！";
                String GetMessage=requestMap.get("Content");
                save.PostMessage("您发送的是文本消息",fromUserName,GetMessage);
            }
            // 图片消息
            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
                respContent = "您发送的是图片消息！";
                save.PostMessage("您发送的是文本消息",fromUserName,"某图片消息");
            }
            // 语音消息
            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {
                respContent = "您发送的是语音消息！";
                save.PostMessage("您发送的是语音消息",fromUserName,"某语音消息");
            }
            // 视频消息
            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VIDEO)) {
                respContent = "您发送的是视频消息！";
                save.PostMessage("您发送的是视频消息",fromUserName,"某视频消息");
            }
            // 地理位置消息
            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {
                respContent = "您发送的是地理位置消息！";
                save.PostMessage("您发送的是地理位置消息",fromUserName,"某地理位置消息");
            }
            // 链接消息
            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {
                respContent = "您发送的是链接消息！";
                save.PostMessage("您发送的是链接消息",fromUserName,"某链接消息");
            }
            // 事件推送
            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
                // 事件类型
                String eventType = requestMap.get("Event");
                // 关注
                if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
                    respContent = "谢谢您的关注！我们是基于XM01-基于GIS的车辆监控系统";
                }
                // 取消关注
                else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
                    // TODO 取消订阅后用户不会再收到公众账号发送的消息，因此不需要回复
                }
                // 扫描带参数二维码
                else if (eventType.equals(MessageUtil.EVENT_TYPE_SCAN)) {
                    // TODO 处理扫描带参数二维码事件
                }
                // 上报地理位置
                else if (eventType.equals(MessageUtil.EVENT_TYPE_LOCATION)) {
                    // TODO 处理上报地理位置事件
                }
                // 自定义菜单
                else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {
                    // TODO 处理菜单点击事件
                    String eventKey = requestMap.get("EventKey");
                    // 根据key值判断用户点击的按钮
                    if (eventKey.equals("Swords")) {
                        respContent = "这是三个拖延症做了一学期的一个东西，这个微信号我们做这个项目申请的微信公众号";
                    }
                }
            }
            // 设置文本消息的内容
            textMessage.setContent(respContent);
            // 将文本消息对象转换成xml
            respXml = MessageUtil.messageToXml(textMessage);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return respXml;
    }
}
