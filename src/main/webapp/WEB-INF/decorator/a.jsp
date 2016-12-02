<%--
  Created by IntelliJ IDEA.
  User: ZTC
  Date: 11/30/2016
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<!doctype html>
<html>
<head>
    <title><sitemesh:write property='title'/></title>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/materialize.min.css"  media="screen,projection"/>

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <sitemesh:write property='head' />
</head>
<body style="font-family: 'Roboto', 'Droid Sans Fallback', '微软雅黑';min-height: 100vh;display: flex;flex-direction: column;">
<nav>
    <div class="nav-wrapper">
        <a href="${pageContext.request.contextPath}/jrd/list.@-@" class="brand-logo center">JavaWeb远程自动化部署平台</a>
    </div>
</nav>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/materialize.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer.js"></script>
<sitemesh:write property='body' />
<footer class="page-footer" style="padding-top: 0; margin-top: 40px;">
    <div class="footer-copyright">
        <div class="container">
            Copyright © 2016 <a class="grey-text text-lighten-4" href="http://blog.csdn.net/A__yes" target="_blank">http://blog.csdn.net/A__yes</a>. All rights reserved.
            <a class="grey-text text-lighten-4 right" href="https://git.oschina.net/A_yes/JRDeploy" target="_blank">Git.Oschina</a>
        </div>
    </div>
</footer>
</body>
</html>
