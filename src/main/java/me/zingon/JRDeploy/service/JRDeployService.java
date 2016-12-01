package me.zingon.JRDeploy.service;

import me.zingon.JRDeploy.dao.JRDeployDao;
import me.zingon.JRDeploy.model.JRDeploy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

/**
 * Created by ZTC on 11/30/2016.
 */
@Service
public class JRDeployService {

    @Autowired
    JRDeployDao jrDeployDao;

    public int insert(JRDeploy jrDeploy){
        if(jrDeploy.getProfile().equals(""))
            jrDeploy.setProfile("null");
        if(jrDeploy.getBranch().equals(""))
            jrDeploy.setBranch("null");
        jrDeploy.setContextPath(jrDeploy.getContextPath().replace("/",""));
        return jrDeployDao.insert(jrDeploy);
    }

    public JRDeploy getById(String uuid){
        return jrDeployDao.getById(uuid);
    }


}
