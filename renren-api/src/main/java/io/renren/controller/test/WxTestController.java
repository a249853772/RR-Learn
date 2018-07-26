package io.renren.controller.test;

import io.renren.common.utils.R;
import io.renren.utils.ImageMessageUtil;
import io.renren.utils.MessageUtil;
import io.renren.utils.SignUtil;
import io.renren.utils.TextMessageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
@RequestMapping("/wx")
public class WxTestController {

    protected Logger logger = LoggerFactory.getLogger(WxTestController.class);

    @GetMapping("conn")
    public String connWxServer(HttpServletRequest request){

        // 微信加密签名.
        String signature = request.getParameter("signature");
        // 时间戳.
        String timestamp = request.getParameter("timestamp");
        // 随机数.
        String nonce = request.getParameter("nonce");
        // 随机字符串.
        String echostr = request.getParameter("echostr");
        logger.info("开始请求校验," +
                "signature="+signature
                +"timestamp"+timestamp
                +"nonce"+nonce
                +"echostr"+echostr
        );
        if(SignUtil.checkSignature(signature, timestamp, nonce)){
            logger.info("校验成功");
            return echostr;
        }
        return "null";
    }

    @PostMapping("conn")
    public String getMsgAndDo(HttpServletRequest request){
        //将微信请求xml转为map格式，获取所需的参数
        Map<String,String> map = MessageUtil.xmlToMap(request);
        String toUserName = map.get("ToUserName");
        String fromUserName = map.get("FromUserName");
        String msgType = map.get("MsgType");
        String content = map.get("Content");
        //处理文本类型，实现输入1，回复相应的封装的内容
        String message="";
        if("text".equals(msgType)){
            TextMessageUtil textMessage = new TextMessageUtil();
            if("1".equals(content)){
                message = textMessage.initMessage(fromUserName, toUserName);
            }else if(XJJ.equals(content)){
                ImageMessageUtil util = new ImageMessageUtil();
                message = util.initMessage(fromUserName, toUserName);
            }else {
                message = textMessage.initMessage(fromUserName, toUserName,content);
            }
        }


        logger.debug("返回消息报文: message={}",message);
        return message;
    }

    private static String XJJ= "x";
}
