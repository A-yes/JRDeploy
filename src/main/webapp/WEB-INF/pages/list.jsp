<%--
  Created by IntelliJ IDEA.
  User: ZTC
  Date: 12/2/2016
  Time: 2:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>项目列表</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="input-field col s12 m6 offset-m2">
            <nav>
                <div class="nav-wrapper">
                    <div class="input-field" style="height: 100%">
                        <input id="java-web-deploy-search" type="search">
                        <label for="java-web-deploy-search">
                            <i class="material-icons" style="line-height: inherit;">search</i>
                        </label>
                    </div>
                </div>
            </nav>
        </div>
        <div class="input-field col s12 m4">
            <a class="waves-effect waves-light btn red lighten-2" href="${pageContext.request.contextPath}/new.@-@" style="line-height: 64px; height: 64px;">创建</a>
        </div>
    </div>
    <div id="java-web-deploy" class="row">
        <div class="col s12">
            <table class="hoverable">
                <thead>
                <tr>
                    <td>项目名称</td>
                    <td>UUID</td>
                    <td>contextPath</td>
                    <td>端口号</td>
                    <td>详情</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${javaWebDeployList}">
                    <tr>
                        <td>${item.name}</td>
                        <td>${item.uuid}</td>
                        <td>${item.contextPath}</td>
                        <td>${item.port}</td>
                        <td><a href="${pageContext.request.contextPath}/jrd/detail.@-@?uuid=${item.uuid}"
                               class="btn waves-effect waves-light red lighten-2">详情</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $("#java-web-deploy-search").on("input",function() {
            var val = $(this).val().toUpperCase();
            $("#java-web-deploy tbody tr").each(function() {
                var name = $(this).children().get(0).innerHTML.toUpperCase();
                var uuid = $(this).children().get(1).innerHTML.toUpperCase();
                var contextPath = $(this).children().get(2).innerHTML.toUpperCase();
                var port = $(this).children().get(3).innerHTML;
                if(name.indexOf(val) != -1 || uuid.indexOf(val) != -1
                        || contextPath.indexOf(val) != -1 || port.indexOf(val) != -1) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });
    });

</script>
</body>
</html>
