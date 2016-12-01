
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
                    <span class="card-title red-text">项目信息</span>
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
                    </p>
                </div>
            </div>
        </div>
        <div class="col s6">
            <div class="card">
                <div class="card-content">
                    <span class="card-title grey-text">服务器信息</span>
                    <p class="service-status"><B>Host : </B>${detail.host}</p>
                    <p class="service-status"><B>Port : </B>${detail.hostPort}</p>
                    <p class="service-status"><B>User : </B>${detail.user}</p>
                    <p class="service-status" hidden><B>PassWord : </B>${detail.password}</p>
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
                        <span class="grey-text">获取中...</span>
                    </p>
                </div>
                <div class="card-action">
                    <a href="#" class="btn-showlog" data-wsurl="ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/log?uuid=${detail.uuid}&type=javaweb">查看日志</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("#btn-deploy").click(function(){
            var uuid=$("#text-uuid").text();
            $.get("${pageContext.request.contextPath}/jrd/deploy.api",{
                uuid : uuid
            },function (data){
                layer.alert(data);
            });
        });
    });



    function execCommand(host,port,command){
        $.get("${pageContext.request.contextPath}/jrd/exec.api",
                {
                    host : host,
                    port : port,
                    command : command
                },
                function(data){
                    layer.alert(data);
                }
        );
    }
</script>
</body>
</html>
