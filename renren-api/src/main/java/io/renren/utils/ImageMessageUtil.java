package io.renren.utils;

import com.thoughtworks.xstream.XStream;
import io.renren.form.wx.Image;
import io.renren.form.wx.ImageMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;

public class ImageMessageUtil implements BaseMessageUtil<ImageMessage>{

    Logger logger = LoggerFactory.getLogger(ImageMessageUtil.class);

    private static  String MSG_TYPE = "image";

    @Override
    public String messageToxml(ImageMessage message) {
        XStream xtream = new XStream();
        xtream.alias("xml", message.getClass());
        //xtream.alias("Image", new Image().getClass());
        return xtream.toXML(message);
    }

    @Override
    public String initMessage(String fromUserName, String toUserName) {
        Image image = new Image();
        image.setMediaId(getmediaId());
        ImageMessage message = new ImageMessage();
        message.setFromUserName(toUserName);
        message.setToUserName(fromUserName);
        message.setCreateTime(System.currentTimeMillis());
        message.setMsgType(MSG_TYPE);
        message.setImage(image);
        return messageToxml(message);

    }

    /**
     * 获取Media
     * @return
     */
    public String getmediaId(){
        String path = "C:/Users/Administrator/Documents/WeChat Files/hh249853772/HDHeadImage/1c6daf568c3fa3d314d26bc706c357e8_1.jpg";
        String accessToken = WeiXinUtil.getAccess_Token();
        String mediaId = null;
        try {
            mediaId = WxUploadUtil.upload(path, accessToken, "image");

        } catch (KeyManagementException | NoSuchAlgorithmException
                | NoSuchProviderException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        logger.debug("获取到的mediaId={}",mediaId);
        return mediaId;
    }


    @Override
    public String initMessage(String fromUserName, String toUserName, String content) {
        return null;
    }
}
