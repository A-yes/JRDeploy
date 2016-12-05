<%--
  Created by IntelliJ IDEA.
  User: ZTC
  Date: 11/30/2016
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>新建部署</title>
</head>
<body>
<form id="form-new" method="post" action="${pageContext.request.contextPath}/jrd/new.@-@"
      style="flex: 1 0 auto;">
    <div class="container" style="padding-top: 20px;">

        <div class="row">
            <div class="col s12">
                <div class="card">
                    <div class="card-content">
                        <div class="row">
                            <div class="col s6">
                                <span class="card-title black-text">新建项目</span>
                            </div>
                            <div class="col s6">
                                <span class="card-title black-text">远端服务器</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <input type="text" id="input-name" name="name">
                                <label for="input-name">项目名称</label>
                            </div>
                            <div class="input-field col s4">
                                <input type="text" id="input-host" name="host">
                                <label for="input-host">服务器地址</label>
                            </div>
                            <div class="input-field col s2">
                                <input type="text" id="input-host-port" name="hostPort" value="22">
                                <label for="input-host-port">ssh端口</label>
                            </div>
                            <div class="input-field col s6">
                                <input type="text" id="input-profile" name="profile">
                                <label for="input-profile">Maven profile</label>
                            </div>
                            <div class="input-field col s3">
                                <input type="text" id="input-user" name="user">
                                <label for="input-user">用户名</label>
                            </div>
                            <div class="input-field col s3">
                                <input type="password" id="input-password" name="password">
                                <label for="input-password">服务器密码</label>
                            </div>
                            <div class="input-field col s6">
                                <input type="text" id="input-module" name="module">
                                <label for="input-module">Maven module</label>
                            </div>
                            <div class="input-field col s6">
                                <input type="text" id="input-jrdPath" name="jrdPath">
                                <label for="input-jrdPath">部署路径</label>
                            </div>
                            <div class="input-field col s6">
                                <input type="text" id="input-contextPath" name="contextPath">
                                <label for="input-contextPath">contextPath</label>
                            </div>
                            <div class="input-field col s6">
                                <input type="text" id="input-jettyPath" name="jettyPath">
                                <label for="input-jettyPath">Jetty start.jar 路径</label>
                            </div>
                            <div class="input-field col s6">
                                <input type="text" id="input-port" name="port">
                                <label for="input-port">部署Web端口号</label>
                            </div>
                            <div class="input-field col s6">
                                <input type="text" id="input-url" name="url">
                                <label for="input-url">SVN/GIT地址</label>
                            </div>
                            <div class="input-field col s6">
                                <input class="with-gap" name="type" type="radio" id="input-svn" checked="checked"
                                       value="1"/>
                                <label for="input-svn">SVN</label>
                                <input class="with-gap" name="type" type="radio" id="input-git" value="2"/>
                                <label for="input-git">GIT</label>
                            </div>
                            <div class="input-field col s6 input-field-branch" style="display: none;">
                                <input type="text" id="input-branch" name="branch">
                                <label for="input-branch">Git分支</label>
                            </div>
                        </div>
                    </div>
                    <div class="card-action">
                        <p>
                            <button id="ok" type="button" class="btn waves-light waves-effect white-text">提交</button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    $(document).ready(function() {
        $(".with-gap").change(function () {
            if(this.value == 2) {
                $(".input-field-branch").fadeIn();
            } else {
                $(".input-field-branch").fadeOut();
            }
        });

        $("#ok").click(function(){
            var name=$("#input-name").val().trim();
            var module=$("#input-module").val().trim();
            var contextPath=$("#input-contextPath").val().trim();
            var port=$("#input-port").val().trim();
            var url=$("#input-url").val().trim();
            var jrdPath=$("#input-jrdPath").val().trim();
            var jetty=$("#input-jettyPath").val().trim();

            var host=$("#input-host").val().trim();
            var hostPot=$("#input-host-port").val().trim();
            var user=$("#input-user").val().trim();
            var password=$("#input-password").val().trim();

            if(name==""){
                layer.msg("名称不能为空",{
                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                });
                return;
            }
            if(module==""){
                layer.msg("module不能为空",{
                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                });
                return;
            }
            if(contextPath==""){
                layer.msg("contextPath不能为空",{
                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                });
                return;
            }
            if(port==""){
                layer.msg("部署web端口号不能为空",{
                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                });
                return;
            }
            if(url==""){
                layer.msg("SVN/GIT地址不能为空",{
                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                });
                return;
            }
            if(jrdPath==""){
                layer.msg("部署路径不能为空",{
                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                });
                return;
            }
            if(jetty==""){
                layer.msg("jetty-start.jar不能为空",{
                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                });
                return;
            }
            var ii = layer.load();
            $.get("${pageContext.request.contextPath}/jrd/checkSsh.api", {
                        host : host,
                        port : hostPot,
                        user : user,
                        password : password
                    },function(data){
                        layer.close(ii);
                        if(data == true){
                            $('#form-new').submit();
                        }
                        else
                            layer.msg("远端服务器登陆失败！");
                    }
            );
        });
    });


</script>
</body>
</html>
