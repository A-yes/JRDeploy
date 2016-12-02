package me.zingon.JRDeploy.dao;

import me.zingon.JRDeploy.model.JRDeploy;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by ZTC on 11/30/2016.
 */
public interface JRDeployDao {

    @Insert("insert into jrdeploy(uuid,name,profile,module,context_path,port,url,type,branch,host,user,host_port,password,jrd_path,jetty_path,deleted_flag) " +
            "values(#{uuid},#{name},#{profile},#{module},#{contextPath},#{port},#{url},#{type},#{branch},#{host},#{user},#{hostPort},#{password},#{jrdPath},#{jettyPath},#{deletedFlag})")
    int insert(JRDeploy jrDeploy);

    @Select("select *,host_port as hostPort,context_path as contextPath,jrd_path as jrdPath,jetty_path as jettyPath,deleted_flag as deletedFlag" +
            " from jrdeploy where uuid=#{uuid}")
    JRDeploy getById(@Param("uuid")String uuid);

    @Select("select *,host_port as hostPort,context_path as contextPath,jrd_path as jrdPath,jetty_path as jettyPath,deleted_flag as deletedFlag" +
            " from jrdeploy")
    List<JRDeploy> getList();
}
