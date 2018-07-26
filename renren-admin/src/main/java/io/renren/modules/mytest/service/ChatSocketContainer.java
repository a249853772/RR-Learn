package io.renren.modules.mytest.service;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author huhao
 */
@Component
public class ChatSocketContainer implements WebSocketContainer<ChatServer> {

    private static final List<ChatServer> CHAT_SERVER_LIST = Collections.synchronizedList(new ArrayList<>());

    @Override
    public List<ChatServer> getContainer() {
        return CHAT_SERVER_LIST;
    }

    @Override
    public void add(ChatServer chatServer) {
        synchronized (CHAT_SERVER_LIST) {
            boolean flag = !CHAT_SERVER_LIST.contains(chatServer);
            if (flag) {
                CHAT_SERVER_LIST.add(chatServer);
            }
        }
    }


    @Override
    public void remove(ChatServer chatServer) {
        synchronized (CHAT_SERVER_LIST) {
            CHAT_SERVER_LIST.remove(chatServer);
        }
    }

    @Override
    public int getCount() {
        return CHAT_SERVER_LIST.size();
    }
}
