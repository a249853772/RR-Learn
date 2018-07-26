package io.renren.modules.mytest.service;

import org.springframework.stereotype.Component;

import javax.websocket.CloseReason;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/pushServer")
@Component
public class PushServer extends AbstractWebSocket<PushServer>{

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
