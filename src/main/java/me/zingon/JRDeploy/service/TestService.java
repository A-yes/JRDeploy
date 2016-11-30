package me.zingon.JRDeploy.service;

import me.zingon.JRDeploy.dao.TestDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ZTC on 11/30/2016.
 */
@Service
public class TestService {
    @Autowired
    TestDao testDao;


    public int get(){
        return testDao.get();
    }
}
