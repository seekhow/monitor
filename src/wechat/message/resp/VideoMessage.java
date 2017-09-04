package wechat.message.resp;

/**
 * Created by asua-pc on 2017/6/18.
 */
public class VideoMessage extends BaseMessage{
    // 视频
    private Video Video;

    public Video getVideo() {
        return Video;
    }

    public void setVideo(Video video) {
        Video = video;
    }
}
