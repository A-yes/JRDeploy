package me.zingon.JRDeploy.controller;

import me.zingon.JRDeploy.model.JRDeploy;
import me.zingon.JRDeploy.service.JRDeployService;
import me.zingon.JRDeploy.service.SshService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.UUID;

//                       _oo0oo_
//                      o8888888o
//                      88" . "88
//                      (| -_- |)
//                      0\  =  /0
//                    ___/`---'\___
//                  .' \\|     |// '.
//                 / \\|||  :  |||// \
//                / _||||| -:- |||||- \
//               |   | \\\  -  /// |   |
//               | \_|  ''\---/''  |_/ |
//               \  .-\__  '-'  ___/-. /
//             ___'. .'  /--.--\  `. .'___
//          ."" '<  `.___\_<|>_/___.' >' "".
//         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//         \  \ `_.   \_ __\ /__ _/   .-` /  /
//     =====`-.____`.___ \_____/___.-`___.-'=====
//                       `=---='
//
//
//     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//
//               佛祖保佑         永无BUG
//
//
//
/**
 * Created by ZTC on 11/30/2016.
 */
@RequestMapping("/jrd")
@Controller
public class JRDeployController {

    @Autowired
    JRDeployService jrDeployService;

    @Autowired
    SshService sshService;

    @Value("${my.user.name}")
    String u;

    @Value("${my.user.password}")
    String p;

    @RequestMapping("/login.*")
    public String login(@RequestParam("user")String user,
                        @RequestParam("password")String password,
                        HttpServletRequest req){
        if(user.equals(u) && password.equals(p)) {
            req.getSession().setAttribute("user",user);
            return "redirect:/jrd/list.@-@";
        }
        else
            return "redirect:/";
    }

    @RequestMapping("/new.*")
    public String newJrd(JRDeploy jrDeploy){
        jrDeploy.setUuid(UUID.randomUUID().toString());
        jrDeployService.insert(jrDeploy);
        return "redirect:/jrd/detail.@-@?uuid="+jrDeploy.getUuid();
    }

    @RequestMapping("/list.*")
    public String list(Model model){
        model.addAttribute("javaWebDeployList", jrDeployService.getList());
        return "list";
    }

    @RequestMapping("/detail.*")
    public String detail(@RequestParam("uuid") String uuid, Model model){
        JRDeploy jrDeploy=jrDeployService.getById(uuid);
        model.addAttribute("detail",jrDeploy);
        return "detail";
    }

    @RequestMapping("/checkSsh.api")
    @ResponseBody
    public Object checkSsh(@RequestParam("host")String host,
                           @RequestParam("port")String port,
                           @RequestParam("user")String user,
                           @RequestParam("password")String password) {
        boolean ans=false;
        try {
            ans=sshService.checkSsh(host,port,user,password);
        }catch (IOException e){
            e.printStackTrace();
        }
        return ans;
    }

    @RequestMapping("/exec.api")
    @ResponseBody
    public String execCommand(@RequestParam("host")String host,
                              @RequestParam("port")String port,
                              @RequestParam("command")String command) throws IOException {
        return sshService.execCommand(host,port,command).replace("\r\n","<br/>");
    }

    @RequestMapping("/deploy.api")
    @ResponseBody
    public String deploy(@RequestParam("uuid") String uuid) throws IOException {
        JRDeploy jrDeploy=jrDeployService.getById(uuid);
        return sshService.deploy(jrDeploy).replace("\r\n","<br/>");
    }

    @RequestMapping("/start.api")
    @ResponseBody
    public String start(@RequestParam("uuid") String uuid) throws IOException {
        JRDeploy jrDeploy=jrDeployService.getById(uuid);
        return sshService.start(jrDeploy).replace("\r\n","<br/>");
    }

    @RequestMapping("/stop.api")
    @ResponseBody
    public String stop(@RequestParam("uuid")String uuid) throws IOException {
        JRDeploy jrDeploy=jrDeployService.getById(uuid);
        return sshService.stop(jrDeploy);
    }

    @RequestMapping("/isrunning.api")
    @ResponseBody
    public String isrunning(@RequestParam("uuid")String uuid) throws IOException {
        JRDeploy jrDeploy=jrDeployService.getById(uuid);
        return sshService.isRunning(jrDeploy);
    }



}
