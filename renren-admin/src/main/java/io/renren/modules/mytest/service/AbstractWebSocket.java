package io.renren.modules.mytest.service;

import io.renren.modules.mytest.utils.ApplicationUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Lazy;

import javax.websocket.*;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

/**
 * @author huhao
 * @param <T>
 */
public abstract class AbstractWebSocket<T> {

    /**
     * 传入泛型的class对象
     */
     Class tClass ;

    AbstractWebSocket(){
        Type type = this.getClass().getGenericSuperclass();
        if(type instanceof ParameterizedType){
            ParameterizedType parameterizedType = (ParameterizedType)type;
            Type classType = parameterizedType.getActualTypeArguments()[0];
            if(classType instanceof Class){
                 tClass = (Class) classType;
            }
        }
    }

     protected  Logger logger = LoggerFactory.getLogger(AbstractWebSocket.class);


     private WebSocketContainer<AbstractWebSocket<T>> webSocketContainer;


     private WebSocketContainer<AbstractWebSocket<T>> getWebSocketContainer(){
        //从spring容器中获取所有socket容器类型的bean
        Map<String,WebSocketContainer> beans = ApplicationUtil.getBeans(WebSocketContainer.class);
        //遍历
        for(WebSocketContainer container : beans.values()){
            //获取socket容器的class对象
            Class containerClass = container.getClass();
            //获取socket容器的第一个接口
            Type interfaceType = containerClass.getGenericInterfaces()[0];
            //如果该接口是一个泛型参数化类型（即包含泛型）
            if(interfaceType instanceof ParameterizedType){
                //获取该接口所有泛型参数中的第一个泛型参数
              Type actualType = ((ParameterizedType) interfaceType).getActualTypeArguments()[0];
              if(actualType instanceof Class){
                  //若该泛型类型和当前所传入的泛型相同则返回该类型的socket容器
                  if(tClass.equals(actualType)){
                        return container;
                  }
              }
            }
        }
        return null;
     }



    /**
     * 与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    protected Session session;



    /**
     * 连接成功后调用的方法
     */
    protected abstract void connStartAndDo();

    /**
     * 接收到消息后调用的方法
     */
    protected abstract void getMsgAndDo(String message, Session session);

    /**
     * 关闭连接后调用的方法
     */
    protected abstract void connCloseAndDo(Session session, CloseReason reason);

    /**
     * 发生错误之后调用的方法
     * @param session
     * @param error
     */
    protected abstract void occurErrorAndDo(Session session, Throwable error);

    @OnOpen
    public void connServer(Session session){
        webSocketContainer = getWebSocketContainer();
        if(webSocketContainer==null){
            throw new RuntimeException("sys error");
        }
        this.session = session;
        webSocketContainer.getContainer().add(this);
        logger.info("当前"+this.getClass().getSimpleName()+"socket数:" + webSocketContainer.getCount());
        connStartAndDo();
    }

    @OnMessage
    public void getMsg(String message, Session session){
        getMsgAndDo(message, session);
    }

    @OnClose
    public void closeConn(Session session, CloseReason reason){
        webSocketContainer.remove(this);
        logger.info("有一连接关闭！当前在线"+this.getClass().getSimpleName()+"socket数为"
                + webSocketContainer.getCount());
        connCloseAndDo(session, reason);
    }

    @OnError
    public void error(Session session, Throwable error){
        logger.error("发生错误");
        error.printStackTrace();
        occurErrorAndDo(session, error);
    }
}
