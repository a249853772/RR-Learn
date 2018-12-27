package io.renren.modules.mytest.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.mytest.entity.SysMsgEntity;
import io.renren.modules.mytest.service.SysMsgService;
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
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-12-27 11:32:11
 */
@RestController
@RequestMapping("sys/sysmsg")
public class SysMsgController {
    @Autowired
    private SysMsgService sysMsgService;

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
