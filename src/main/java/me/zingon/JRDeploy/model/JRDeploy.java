package me.zingon.JRDeploy.model;

/**
 * Created by ZTC on 11/30/2016.
 */
public class JRDeploy {
    int id;
    String uuid;
    String name;
    String profile;
    String module;
    String contextPath;
    String port;
    String url;
    int type;
    String branch;
    String host;
    String hostPort;
    String password;
    String jrdPath;
    String jettyPath;
    int deletedFlag;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public String getContextPath() {
        return contextPath;
    }

    public void setContextPath(String contextPath) {
        this.contextPath = contextPath;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getHostPort() {
        return hostPort;
    }

    public void setHostPort(String hostPort) {
        this.hostPort = hostPort;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getJrdPath() {
        return jrdPath;
    }

    public void setJrdPath(String jrdPath) {
        this.jrdPath = jrdPath;
    }

    public String getJettyPath() {
        return jettyPath;
    }

    public void setJettyPath(String jettyPath) {
        this.jettyPath = jettyPath;
    }

    public int getDeletedFlag() {
        return deletedFlag;
    }

    public void setDeletedFlag(int deletedFlag) {
        this.deletedFlag = deletedFlag;
    }
}
