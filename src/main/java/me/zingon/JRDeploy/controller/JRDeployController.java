package me.zingon.JRDeploy.controller;

import me.zingon.JRDeploy.model.JRDeploy;
import me.zingon.JRDeploy.service.JRDeployService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by ZTC on 11/30/2016.
 */
@RequestMapping("/jrd")
@Controller
public class JRDeployController {

    @Autowired
    JRDeployService jrDeployService;

    @RequestMapping("/new.*")
    public String newJrd(JRDeploy jrDeploy){
        jrDeployService.insert(jrDeploy);
        return "redirect:/new.@-@";
    }

    @RequestMapping("/detail.*")
    public String detail(@RequestParam("id") int id, Model model){
        model.addAttribute("detail",jrDeployService.getById(id));
        return "detail";
    }


}
