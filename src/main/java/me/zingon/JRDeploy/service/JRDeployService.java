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
        jrDeploy.setUuid(UUID.randomUUID().toString());
        return jrDeployDao.insert(jrDeploy);
    }

    public JRDeploy getById(int id){
        return jrDeployDao.getById(id);
    }


}
