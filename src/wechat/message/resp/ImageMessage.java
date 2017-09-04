package wechat.message.resp;

/**
 * Created by asua-pc on 2017/6/18.
 */
public class ImageMessage extends BaseMessage{
    private Image Image;

    public Image getImage() {
        return Image;
    }

    public void setImage(Image image) {
        Image = image;
    }
}
