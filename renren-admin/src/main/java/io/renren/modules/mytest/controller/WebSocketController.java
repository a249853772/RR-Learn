package io.renren.modules.mytest.controller;

import io.renren.common.utils.R;
import io.renren.modules.mytest.service.WebSocketServer;
import io.renren.modules.sys.shiro.ShiroUtils;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/sys/webSocket")
public class WebSocketController {


    @RequestMapping(value="/pushVideoListToWeb",method= RequestMethod.POST,consumes = "application/json")
    public @ResponseBody
    R pushVideoListToWeb(@RequestBody Map<String,Object> param) {
        Map<String, Object> result = new HashMap<>(1);
        try {
            WebSocketServer.sendInfo(ShiroUtils.getUserEntity().getUsername()+":"+ param.get("Msg"));
            result.put("operationResult", true);
        } catch (IOException e) {
            result.put("operationResult", false);
        }
        return R.ok(result);
    }

    }
