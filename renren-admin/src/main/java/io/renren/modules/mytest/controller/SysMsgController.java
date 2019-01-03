package io.renren.modules.mytest.controller;

import java.util.*;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.mytest.entity.SysMsgEntity;
import io.renren.modules.mytest.service.SysMsgService;
import io.renren.modules.sys.entity.SysDictEntity;
import io.renren.modules.sys.service.SysDictService;
import io.renren.modules.sys.shiro.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 系统消息表
 *
 * @author huhao
 * @email sunlightcs@gmail.com
 * @date 2018-12-27 11:32:11
 */
@RestController
@RequestMapping("sys/sysmsg")
public class SysMsgController {
    @Autowired
    private SysMsgService sysMsgService;
    @Autowired
    private SysDictService sysDictService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("sys:sysmsg:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = sysMsgService.queryPage(params);

        return R.ok().put("page", page);
    }
    /**
     * 列表
     */
    @RequestMapping("/getMsgTree")
    @RequiresPermissions("sys:sysmsg:list")
    public List<R> getMsgTree(){
        List<R> rs = new ArrayList<>();
        List<SysMsgEntity> msgEntities = sysMsgService.selectList(new EntityWrapper<>());
        for (SysMsgEntity s:msgEntities
             ) {
            R r = new R();
            r.put("parentId",s.getMsgType());
            r.put("name",s.getTitle());
            r.put("id",s.getId());
            r.put("open",true);
            r.put("list",null);
            rs.add(r);
        }
        List<SysMsgEntity> msgTypes = sysMsgService.selectList(new EntityWrapper<SysMsgEntity>().groupBy("msg_type"));
        for (SysMsgEntity s: msgTypes
             ) {
            SysDictEntity dictEntity = sysDictService.selectById(s.getMsgType());
            R r = new R();
            r.put("parentId",0);
            r.put("name",dictEntity.getValue());
            r.put("id",dictEntity.getId());
            r.put("open",true);
            r.put("list",null);
            rs.add(r);
        }
        return rs;
    }



    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("sys:sysmsg:info")
    public R info(@PathVariable("id") Long id){
        SysMsgEntity sysMsg = sysMsgService.selectById(id);

        return R.ok().put("sysMsg", sysMsg);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:sysmsg:save")
    public R save(@RequestBody SysMsgEntity sysMsg){
        sysMsg.setCreatetime(new Date());
        sysMsg.setUploaderId(ShiroUtils.getUserId());
        sysMsgService.insert(sysMsg);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:sysmsg:update")
    public R update(@RequestBody SysMsgEntity sysMsg){
        sysMsg.setUpdatetime(new Date());
        ValidatorUtils.validateEntity(sysMsg);
        sysMsgService.updateAllColumnById(sysMsg);//全部更新
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:sysmsg:delete")
    public R delete(@RequestBody Long[] ids){
        sysMsgService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
