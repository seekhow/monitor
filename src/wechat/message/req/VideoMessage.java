package wechat.message.req;

/**
 * Created by asua-pc on 2017/6/18.
 */
public class VideoMessage extends BaseMessage{
    // 视频消息媒体id
    private String MediaId;
    // 视频消息缩略图的媒体id
    private String ThumbMediaId;

    public String getMediaId() {
        return MediaId;
    }

    public void setMediaId(String mediaId) {
        MediaId = mediaId;
    }

    public String getThumbMediaId() {
        return ThumbMediaId;
    }

    public void setThumbMediaId(String thumbMediaId) {
        ThumbMediaId = thumbMediaId;
    }
}
