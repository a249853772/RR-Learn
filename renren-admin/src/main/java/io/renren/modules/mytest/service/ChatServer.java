package io.renren.modules.mytest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatServer")
@Component
public class ChatServer extends AbstractWebSocket<ChatServer>{



    @Override
    protected void connStartAndDo() {
        
    }

    @Override
    protected void getMsgAndDo(String message, Session session) {

    }

    @Override
    protected void connCloseAndDo(Session session, CloseReason reason) {

    }

    @Override
    protected void occurErrorAndDo(Session session, Throwable error) {

    }

}
