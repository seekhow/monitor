package wechat.message.req;

/**
 * Created by asua-pc on 2017/6/18.
 */
public class ImageMessage extends BaseMessage{
    private String PicUrl;

    public String getPicUrl() {
        return PicUrl;
    }

    public void setPicUrl(String picUrl) {
        PicUrl = picUrl;
    }
}
