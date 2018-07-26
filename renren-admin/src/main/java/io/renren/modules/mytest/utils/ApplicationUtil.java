package io.renren.modules.mytest.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * @author huhao
 */
@Component
public class ApplicationUtil implements ApplicationContextAware {

    private static ApplicationContext applicationContext;

    /**
     *  加载Spring配置文件时，如果Spring配置文件中所定义的Bean类实现了ApplicationContextAware接口，会自动调用该方法
     * @param applicationContext
     * @throws BeansException
     */
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        ApplicationUtil.applicationContext = applicationContext;
    }

    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }


    /**
     * 获取Spring Bean
     * @param name
     * @return
     * @throws BeansException
     */
    public static Object getBean(String name) throws BeansException {
        return applicationContext.getBean(name);
    }


    /**
     * 获取Spring Bean
     * @param tClass
     * @param <T>
     * @return
     */
    public static<T> Object getBean(Class<T> tClass) {
        return applicationContext.getBean(tClass);
    }


    public static <T>Map<String,T> getBeans(Class<T> tClass){
        return applicationContext.getBeansOfType(tClass);
    }
}
