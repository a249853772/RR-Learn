package io.renren.form.wx;

/**
 * 消息内容实体
 * @author
 */
public class MessageText extends BaseMessage{

    /**
     * 文本消息内容
     */
    private String Content;

    /**
     * 消息id，64位整型
     */
    private String MsgId;

    public MessageText(){

    }


    public MessageText(String toUserName, String fromUserName,
                       long createTime, String msgType, String content, String msgId) {
        super();
        ToUserName = toUserName;
        FromUserName = fromUserName;
        CreateTime = createTime;
        MsgType = msgType;
        Content = content;
        MsgId = msgId;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public String getMsgId() {
        return MsgId;
    }

    public void setMsgId(String msgId) {
        MsgId = msgId;
    }
}
