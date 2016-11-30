<%--
  Created by IntelliJ IDEA.
  User: ZTC
  Date: 11/30/2016
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>详情</title>
</head>
<body>
<div class="container" style="padding-top: 20px; width: 90%;flex: 1 0 auto;">
    <div class="row">
        <div class="col s12">
            <div class="card">
                <div class="card-content">
                    <span class="card-title red-text">${detail.name}</span>
                    <p>名称：${detail.name}</p>
                    <p>UUID：<span id="text-uuid">${detail.uuid}</span></p>
                    <p>Maven profile：${detail.profile}</p>
                    <p>Maven module：${detail.module}</p>
                    <p>contextPath：${detail.contextPath}</p>
                    <p>端口号：${detail.port}</p>
                    <c:if test="${detail.type == 1}">
                        <p>SVN地址：${detail.url}</p>
                    </c:if>
                    <c:if test="${detail.type == 2}">
                        <p>GIT地址：${detail.url}</p>
                        <p>GIT分支：${detail.branch}</p>
                    </c:if>
                </div>
                <div class="card-action">
                    <p>
                        <a class="btn waves-light waves-effect white-text" id="btn-deploy">部署</a>
                        <a class="btn waves-light waves-effect white-text" id="btn-restart">重启</a>
                        <a class="btn waves-light waves-effect white-text" id="btn-stop">停止</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col s12 m6 l4">
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

<footer class="page-footer" style="padding-top: 0; margin-top: 40px;">
    <div class="footer-copyright">
        <div class="container">
            Copyright © 2016 <a class="grey-text text-lighten-4" href="http://xxgblog.com" target="_blank">http://xxgblog.com</a>. All rights reserved.
            <a class="grey-text text-lighten-4 right" href="https://github.com/wucao/JDeploy" target="_blank">GitHub</a>
        </div>
    </div>
</footer>

<div id="loader-modal" class="modal" style="background-color: transparent; box-shadow: none;">
    <div class="modal-content">
        <div class="spinner">
            <div class="cube1"></div>
            <div class="cube2"></div>
        </div>
    </div>
</div>

<div id="layer-modal" class="modal modal-fixed-footer">
    <div class="modal-content" style="background-color: black; color: #ccc; font-size: 0.9em;">
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">关闭</a>
    </div>
</div>

<div id="alert-modal" class="modal">
    <div class="modal-content">
        <p class="grey-text">提示</p>
        <p class="text-alert"></p>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">关闭</a>
    </div>
</div>

</body>
</html>
