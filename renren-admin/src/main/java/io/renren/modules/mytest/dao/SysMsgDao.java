package io.renren.modules.mytest.dao;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import io.renren.modules.mytest.entity.SysMsgEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * 系统消息表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-12-27 11:32:11
 */
public interface SysMsgDao extends BaseMapper<SysMsgEntity> {

    /**
     * 有选择的查询list
     * @param page
     * @return
     */
    List<SysMsgEntity> selectListSelective(Page<SysMsgEntity> page);
	
}
