package io.renren.modules.mytest.service.impl;

import io.renren.modules.mytest.dao.SysMsgUserDao;
import io.renren.modules.mytest.entity.SysMsgEntity;
import io.renren.modules.mytest.entity.SysMsgUserEntity;
import io.renren.modules.mytest.service.SysMsgService;
import io.renren.modules.mytest.service.SysMsgUserService;
import io.renren.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;



@Service("sysMsgUserService")
public class SysMsgUserServiceImpl extends ServiceImpl<SysMsgUserDao, SysMsgUserEntity> implements SysMsgUserService {

    @Autowired
    SysUserService sysUserService;
    @Autowired
    SysMsgService sysMsgService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<SysMsgUserEntity> page = this.selectPage(
                new Query<SysMsgUserEntity>(params).getPage(),
                new EntityWrapper<SysMsgUserEntity>()
        );
        for (SysMsgUserEntity mu:page.getRecords()
             ) {
            if(mu.getSysMsgId()!=null){
                mu.setMsgTitle(sysMsgService.selectById(mu.getSysMsgId()).getTitle());
            }
            if(mu.getSysUserId()!=null){
                mu.setUserName(sysUserService.selectById(mu.getSysUserId()).getUsername());
            }
        }

        return new PageUtils(page);
    }

}
