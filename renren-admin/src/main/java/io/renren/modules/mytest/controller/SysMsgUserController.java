package io.renren.modules.mytest.controller;

import java.util.Arrays;
import java.util.Map;

import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.mytest.entity.SysMsgUserEntity;
import io.renren.modules.mytest.service.SysMsgUserService;
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
 * 系统消息用户关系表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-12-27 11:32:11
 */
@RestController
@RequestMapping("sys/sysmsguser")
public class SysMsgUserController {
    @Autowired
    private SysMsgUserService sysMsgUserService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("sys:sysmsguser:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = sysMsgUserService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("sys:sysmsguser:info")
    public R info(@PathVariable("id") Long id){
        SysMsgUserEntity sysMsgUser = sysMsgUserService.selectById(id);

        return R.ok().put("sysMsgUser", sysMsgUser);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:sysmsguser:save")
    public R save(@RequestBody SysMsgUserEntity sysMsgUser){
        sysMsgUserService.insert(sysMsgUser);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:sysmsguser:update")
    public R update(@RequestBody SysMsgUserEntity sysMsgUser){
        ValidatorUtils.validateEntity(sysMsgUser);
        sysMsgUserService.updateAllColumnById(sysMsgUser);//全部更新
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:sysmsguser:delete")
    public R delete(@RequestBody Long[] ids){
        sysMsgUserService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
