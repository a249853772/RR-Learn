package io.renren.modules.mytest.service;

import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PushSocketContainer implements WebSocketContainer<PushServer>{

    @Override
    public List<PushServer> getContainer() {
        return null;
    }

    @Override
    public void add(PushServer pushServer) {

    }

    @Override
    public void remove(PushServer pushServer) {

    }

    @Override
    public int getCount() {
        return 0;
    }
}
