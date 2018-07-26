package io.renren.modules.mytest.service;


import org.jboss.logging.Message;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

//@ServerEndpoint("/websocket/{user}")

/**
 * @ServerEndpoint("/echo") 的 annotation 注释端点表示
 * 将 WebSocket 服务端运行在 ws://[Server 端 IP 或域名]:[Server 端口]/websockets/echo 的访问端点
 * @author huhao
 */
@ServerEndpoint(value = "/websocket")
@Component
public class WebSocketServer {

    /**
     * 静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
     */
    private static int onlineCount = 0;

    /**
     * concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
     */
    private static CopyOnWriteArraySet<WebSocketServer> webSocketSet = new CopyOnWriteArraySet<WebSocketServer>();

    /**
     * 与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    private Session session;

    private static Logger logger = LoggerFactory.getLogger(WebSocketServer.class);

    /**
     * 连接建立成功调用的方法
     * 在这个端点一个新的连接建立时被调用。
     * @param session  表明两个 WebSocket 端点对话连接的另一端，可以理解为类似 HTTPSession 的概念。
     */
    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        //加入set中
        webSocketSet.add(this);
        //在线数加1
        addOnlineCount();
        logger.info("有新连接加入！当前在线人数为" + getOnlineCount());
        try {
            sendMessage("连接成功,当前在线人数为"+ getOnlineCount());
        } catch (IOException e) {
            logger.error("webSocket IO异常");
        }
    }


    /**
     * 连接关闭调用的方法
     * @param reason 参数 closeReason 可封装更多细节，如为什么一个 WebSocket 连接关闭。
     */
    @OnClose
    public void onClose(Session session, CloseReason reason) {
        //从set中删除
        webSocketSet.remove(this);
        //在线数减1
        subOnlineCount();
        logger.info("有一连接关闭！当前在线人数为" + getOnlineCount());
    }


    /**
     * 收到客户端消息后调用的方法
     * @onMessage 注解的 Java 方法用于接收传入的 WebSocket 信息.
     * 这个信息可以是文本格式，也可以是二进制格式。
     *
     * @param message 客户端发送过来的消息*/
    @OnMessage
    public void onMessage(String message, Session session) {
        logger.info("来自客户端的消息:" + message);

        //群发消息
        for (WebSocketServer item : webSocketSet) {
            try {
                item.sendMessage(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }



    /**
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        logger.error("发生错误");
        error.printStackTrace();
    }



    public void sendMessage(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);
    }

    /**
     * 群发自定义消息
     * */
    public static void sendInfo(String message) throws IOException {
        logger.info(message);
        for (WebSocketServer item : webSocketSet) {
            try {
                item.sendMessage(message);
            } catch (IOException e) {
                continue;
            }
        }
    }


    public static synchronized int getOnlineCount() {
        return onlineCount;
    }



    public static synchronized void addOnlineCount() {
        WebSocketServer.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        WebSocketServer.onlineCount--;
    }


}
