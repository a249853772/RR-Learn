package io.renren.modules.mytest.service;

import java.util.List;

/**
 * @author huhao
 * @param <T>
 */
public interface WebSocketContainer<T extends AbstractWebSocket> {
    /**
     *  获取socket容器
     * @return List<T>
     */
    List<T> getContainer();

    /**
     * 添加socket
     * @param t socket
     */
    void add(T t);

    /**
     * 移除socket
     * @param t socket
     */
    void remove(T t);

    /**
     * 获取socket数量
     * @return int
     */
    int getCount();
}
