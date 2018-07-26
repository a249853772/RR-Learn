package io.renren.utils;

/**
 * 消息封装工具类的基类
 * @author huhao
 */
public interface BaseMessageUtil<T> {
    /**
     * 将回复的信息对象转xml格式给微信
     * @param message
     * @return
     */
    public  abstract  String messageToxml(T message);

    /**
     * 回复的信息封装
     * @param fromUserName
     * @param toUserName
     * @return
     */
    public abstract  String initMessage(String fromUserName,String toUserName);


    /**
     * 回复的信息封装
     * @param fromUserName
     * @param toUserName
     * @param content
     * @return
     */
    public abstract  String initMessage(String fromUserName,String toUserName,String content);

}
