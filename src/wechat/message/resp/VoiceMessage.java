package wechat.message.resp;

/**
 * Created by asua-pc on 2017/6/18.
 */
public class VoiceMessage extends BaseMessage{
    private Voice Voice;

    public Voice getVoice() {
        return Voice;
    }

    public void setVoice(Voice voice) {
        Voice = voice;
    }
}
