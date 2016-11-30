package me.zingon.JRDeploy.dao;

import org.apache.ibatis.annotations.Select;

/**
 * Created by ZTC on 11/30/2016.
 */
public interface TestDao {

    @Select("select count(*) from orders")
    public int get();
}
