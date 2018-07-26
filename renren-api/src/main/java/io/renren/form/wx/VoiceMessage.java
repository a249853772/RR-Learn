package io.renren.form.wx;

/**
 * 语音消息
 * @author huhao
 */
public class VoiceMessage extends BaseMessage{

    private Voice Voice;

    public io.renren.form.wx.Voice getVoice() {
        return Voice;
    }

    public void setVoice(io.renren.form.wx.Voice voice) {
        Voice = voice;
    }
}
