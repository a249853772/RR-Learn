package io.renren.modules.mytest.service.impl;

import io.renren.modules.mytest.dao.SysMsgUserDao;
import io.renren.modules.mytest.entity.SysMsgUserEntity;
import io.renren.modules.mytest.service.SysMsgUserService;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;



@Service("sysMsgUserService")
public class SysMsgUserServiceImpl extends ServiceImpl<SysMsgUserDao, SysMsgUserEntity> implements SysMsgUserService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<SysMsgUserEntity> page = this.selectPage(
                new Query<SysMsgUserEntity>(params).getPage(),
                new EntityWrapper<SysMsgUserEntity>()
        );

        return new PageUtils(page);
    }

}
