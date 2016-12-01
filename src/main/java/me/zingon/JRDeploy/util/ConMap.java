package me.zingon.JRDeploy.util;

import ch.ethz.ssh2.Connection;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by ZTC on 12/1/2016.
 */
public class ConMap {

    private static Map<String,Connection> ConMap=new ConcurrentHashMap<>();

    public static Connection getCon(String host_port){
        if(ConMap.containsKey(host_port))
            return ConMap.get(host_port);
        return null;
    }

    public static void putCon(String host_port,Connection con){
        ConMap.put(host_port,con);
    }

    public static void rmCon(String host_port){
        if(ConMap.containsKey(host_port))
            ConMap.remove(host_port);
    }
}
