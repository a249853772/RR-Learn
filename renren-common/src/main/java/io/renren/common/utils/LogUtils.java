package io.renren.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.MessageFormat;

/**
 * 日志工具
 *
 * @author wangKai
 * @version $Id: LogUtils.java, v 0.1 2017年5月4日 下午4:38:49 wangKai Exp $
 */
public class LogUtils {

    static Logger logger;
//    static org.apache.log4j.Logger logger;

    /**
     * info日志
     *
     * @param clazz
     * @param message
     * @param args
     */
    public static void info(Class<?> clazz, String message, Object... args) {
        logger = getLogger(clazz);

        if (logger != null) {
            if (logger.isInfoEnabled()) {
                logger.info(format(message, args));
            }
        }
    }

    /**
     * debug日志
     *
     * @param clazz
     * @param message
     * @param args
     */
    public static void debug(Class<?> clazz, String message, Object... args) {
        logger = getLogger(clazz);
        if (logger != null) {
            if (logger.isDebugEnabled()) {
                logger.debug(format(message, args));
            }
        }
    }

    /**
     * error日志
     *
     * @param clazz
     * @param message
     * @param ex
     * @param args
     */
    public static void error(Class<?> clazz, String message, Throwable ex, Object... args) {
        logger = getLogger(clazz);
        if (logger != null) {
            logger.error(format(message, args), ex);
        }
    }

    /**
     * warn日志
     *
     * @param clazz
     * @param message
     * @param args
     */
    public static void warn(Class<?> clazz, String message, Object... args) {
        logger = getLogger(clazz);
        if (logger != null) {
            logger.warn(format(message, args));
        }
    }

    /**
     * 格式化消息
     *
     * @param message
     * @param args
     * @return
     */
    protected static String format(String message, Object... args) {
        if (args != null && args.length > 0) {
            return new MessageFormat(message).format(args);
        }
        return message;
    }

    /**
     * slf4j
     *
     * @param clazz
     * @return
     */
    private static Logger getLogger(Class<?> clazz) {
        Logger loggerTemp = LoggerFactory.getLogger(clazz);
        return loggerTemp;
    }

    /**
     * log4j
     * @param clazz
     * @return
     */
//    private static org.apache.log4j.Logger getLogger(Class clazz){
//        return org.apache.log4j.Logger.getLogger(clazz);
//    }
}

