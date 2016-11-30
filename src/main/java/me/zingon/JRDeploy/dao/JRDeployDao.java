package me.zingon.JRDeploy.dao;

import me.zingon.JRDeploy.model.JRDeploy;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * Created by ZTC on 11/30/2016.
 */
public interface JRDeployDao {

    @Insert("insert into jrdeploy(uuid,name,profile,module,context_path,port,type,branch,host,host_port,password,jrd_path,jetty_path,deleted_flag) " +
            "values(#{uuid},#{name},#{profile},#{module},#{contextPath},#{port},#{type},#{branch},#{host},#{hostPort},#{password},#{jrdPath},#{jettyPath},#{deletedFlag})")
    int insert(JRDeploy jrDeploy);

    @Select("select * from jrdeploy where id=#{id}")
    JRDeploy getById(@Param("id")int id);
}
