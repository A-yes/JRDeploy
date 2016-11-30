package me.zingon.JRDeploy.controller;

import me.zingon.JRDeploy.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by ZTC on 11/30/2016.
 */
@Controller
@RequestMapping("/test")
public class TestController {
    @Autowired
    TestService testService;

    @RequestMapping("/a")
    @ResponseBody
    public Object a(){
        Map<String,String> m=new HashMap<>();
        m.put("a","aaa");
        return m;
    }

    @RequestMapping("/b")
    @ResponseBody
    public int b(){
        return testService.get();
    }

}
