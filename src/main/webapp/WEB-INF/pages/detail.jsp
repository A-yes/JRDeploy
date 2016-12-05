
<%--
  Created by IntelliJ IDEA.
  User: ZTC
  Date: 11/30/2016
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>详情</title>
</head>
<body>
<div class="container" style="padding-top: 20px; width: 90%;flex: 1 0 auto;">
    <div class="row">
        <div class="col s6">
            <div class="card">
                <div class="card-content">
                    <span class="card-title grey-text">项目信息</span>
                    <p><B>名称：</B>${detail.name}</p>
                    <p><B>UUID：</B><span id="text-uuid">${detail.uuid}</span></p>
                    <p><B>Maven profile：</B>${detail.profile}</p>
                    <p><B>Maven module：</B>${detail.module}</p>
                    <p><B>contextPath：</B>${detail.contextPath}</p>
                    <p><B>端口号：</B>${detail.port}</p>
                    <c:if test="${detail.type == 1}">
                        <p><B>SVN地址：</B>${detail.url}</p>
                    </c:if>
                    <c:if test="${detail.type == 2}">
                        <p><B>GIT地址：</B>${detail.url}</p>
                        <p><B>GIT分支：</B>${detail.branch}</p>
                    </c:if>
                </div>
                <div class="card-action">
                    <p>
                        <button class="btn waves-light waves-effect white-text" id="btn-deploy">部署</button>
                        <button class="btn waves-light waves-effect white-text" id="btn-start">运行</button>
                        <button class="btn waves-light waves-effect white-text" id="btn-stop">停止</button>
                    </p>
                </div>
            </div>
        </div>
        <div class="col s6">
            <div class="card">
                <div class="card-content">
                    <span class="card-title grey-text">服务器信息</span>
                    <p class="service-status"><B>Host : </B><span id="text-host">${detail.host}</span></p>
                    <p class="service-status"><B>Port : </B><span id="text-hostPost">${detail.hostPort}</span></p>
                    <p class="service-status"><B>User : </B><span id="text-user">${detail.user}</span></p>
                    <p class="service-status" hidden><B>PassWord : </B><span id="text-password">${detail.password}</span></p>
                    <p class="service-status"><B>部署路径 : </B>${detail.jrdPath}</p>
                    <p class="service-status"><B>Jetty start.jar路径 : </B>${detail.jettyPath}</p>
                </div>
            </div>
            <div class="card">
                <div class="card-content">
                    <span class="card-title grey-text">运行状态</span>
                    <p class="service-status">
                        <span class="green-text" style="display: none;">正在运行</span>
                        <span class="red-text" style="display: none;">已停止</span>
                        <span class="yellow-text" style="display: none;">点击左侧任一按钮登陆</span>
                        <span class="blue-grey-text">获取中...</span>
                    </p>
                </div>
                <div class="card-action">
                    <button class="btn waves-light waves-effect white-text" id="btn-running">刷新状态</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        isrunning();

        $("#btn-deploy").click(function(){
            var uuid=$("#text-uuid").text();
            var l = layer.load();
            $.get("${pageContext.request.contextPath}/jrd/deploy.api?a="+Math.random(),{
                uuid : uuid
            },function (data){
                layer.close(l);
                if(data.indexOf("login")>0) {
                    login();
                    return;
                }
                isrunning();
                layer.alert(data,{
                    area: ['800px','400px']
                });
            });
        });

        $("#btn-start").click(function(){
            var l = layer.load();
            var uuid=$("#text-uuid").text();
            $.get("${pageContext.request.contextPath}/jrd/start.api?a="+Math.random(),{
                uuid : uuid
            },function (data){
                layer.close(l);
                if(data.indexOf("login")>0) {
                    login();
                    return;
                }
                isrunning();
                layer.alert(data);
            });
        });

        $("#btn-stop").click(function(){
            var uuid=$("#text-uuid").text();
            $.get("${pageContext.request.contextPath}/jrd/stop.api?a="+Math.random(),{
                uuid : uuid
            },function (data){
                if(data.indexOf("login")>0) {
                    login();
                    return;
                }
                isrunning();
                layer.alert(data);
            });
        });

        $("#btn-running").click(function(){
            isrunning();
        });
    });

    function login(){
        layer.prompt({title: '输入服务器密码，并确认', formType: 1}, function(pass, index){
            var host=$("#text-host").text();
            var hostPort=$("#text-hostPost").text();
            var user=$("#text-user").text();
            var passwd=$("#text-password").text();
            var l = layer.load();
            $.get("${pageContext.request.contextPath}/jrd/checkSsh.api?a="+Math.random(),{
                host : host,
                port :hostPort,
                user :user,
                password : pass
            },function (data){
                if(data == true){
                    layer.close(index);
                    layer.msg("登陆成功！");
                }
                else
                    layer.msg("密码错误！");
                layer.close(l);
            });

        });

    }


    function isrunning(){
        var uuid=$("#text-uuid").text();
        $.get("${pageContext.request.contextPath}/jrd/isrunning.api?a="+Math.random(),
                {
                    uuid : uuid
                },
                function(data){
                    $(".blue-grey-text").show();
                    $(".green-text").hide();
                    $(".red-text").hide();
                    $(".yellow-text").hide();
                    if(data == "true")
                        $(".green-text").show();
                    else if(data == "false")
                        $(".red-text").show();
                    else
                        $(".yellow-text").show();
                    $(".blue-grey-text").hide();
                }
        );
    }
</script>
</body>
</html>
