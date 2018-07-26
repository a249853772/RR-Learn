package io.renren.utils;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 消息处理工具
 * @author huhao
 */
public class MessageUtil {

    private static Logger logger = LoggerFactory.getLogger(MessageUtil.class);

    public static Map<String,String> xmlToMap(HttpServletRequest request){
        Map<String,String> map = new HashMap<>(16);
        SAXReader saxReader = new SAXReader();
        InputStream inputStream = null;
        try {
            inputStream = request.getInputStream();
            Document doc = saxReader.read(inputStream);
            Element element = doc.getRootElement();
            List<Element> elements = element.elements();
            for(Element ele : elements){
                map.put(ele.getName(),ele.getText());
            }
        }catch (IOException e){
            logger.error("获取输入流异常",e);
        }catch (DocumentException e){
            logger.error("数据异常",e);
        }finally {
            try {
                if(inputStream!=null){
                    inputStream.close();
                }
            }catch (IOException e){
                logger.error("IO流异常",e);
            }
        }
        logger.debug("请求报文Map={}",map);
        return map;
    }
}
