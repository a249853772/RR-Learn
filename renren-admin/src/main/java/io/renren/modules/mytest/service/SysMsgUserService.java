package io.renren.modules.mytest.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.mytest.entity.SysMsgUserEntity;

import java.util.Map;

/**
 * 系统消息用户关系表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-12-27 11:32:11
 */
public interface SysMsgUserService extends IService<SysMsgUserEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

