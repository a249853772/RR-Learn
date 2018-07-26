package io.renren.utils;

import com.thoughtworks.xstream.XStream;
import io.renren.form.wx.MessageText;

public class TextMessageUtil implements BaseMessageUtil<MessageText>{

    @Override
    public String messageToxml(MessageText message) {
        XStream xstream  = new XStream();
        xstream.alias("xml", message.getClass());
        return xstream.toXML(message);
    }

    @Override
    public String initMessage(String fromUserName, String toUserName) {
        MessageText text = new MessageText();
        text.setToUserName(fromUserName);
        text.setFromUserName(toUserName);
        text.setContent("欢迎加入油坊桥的年轻人");
        text.setCreateTime(System.currentTimeMillis());
        text.setMsgType("text");
        return  messageToxml(text);
    }


    @Override
    public String initMessage(String fromUserName, String toUserName, String content) {
        MessageText text = new MessageText();
        text.setToUserName(fromUserName);
        text.setFromUserName(toUserName);
        text.setContent("你输入的内容是："+content);
        text.setCreateTime(System.currentTimeMillis());
        text.setMsgType("text");
        return messageToxml(text);
    }
}
