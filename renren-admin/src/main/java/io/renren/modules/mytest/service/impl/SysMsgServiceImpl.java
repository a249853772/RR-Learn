package io.renren.modules.mytest.service.impl;

import io.renren.modules.mytest.dao.SysMsgDao;
import io.renren.modules.mytest.entity.SysMsgEntity;
import io.renren.modules.mytest.service.SysMsgService;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;



@Service("sysMsgService")
public class SysMsgServiceImpl extends ServiceImpl<SysMsgDao, SysMsgEntity> implements SysMsgService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
//        Page<SysMsgEntity> page = this.selectPage(
//                new Query<SysMsgEntity>(params).getPage(),
//                new EntityWrapper<SysMsgEntity>()
//        );
        Page<SysMsgEntity> page = new Query<SysMsgEntity>(params)
                .getPage();
        page.setRecords(this.baseMapper.selectListSelective(page));
        return new PageUtils(page);
    }

}
