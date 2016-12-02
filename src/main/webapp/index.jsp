<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>

<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/materialize.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer.js"></script>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/materialize.min.css"  media="screen,projection"/>

</head>
<body>
<script type="text/javascript">
    $(document).ready(function(){
        layer.open({
            type: 1,
            skin: 'layui-layer-demo', //样式类名
            closeBtn: 0, //不显示关闭按钮
            anim: 2,
            shadeClose: true, //开启遮罩关闭
            area: ['500px', '300px'],
            content: '<form id="form-new" method="post" action="${pageContext.request.contextPath}/jrd/login.@-@">\n    <div class="container"> \n        <div class="row">\n            <div class="col s12">\n                <div class="card">\n                    <div class="card-content">\n                        <div class="row">\n                            <div class="input-field col s6">\n                                <input type="text" id="input-name" name="user">\n                                <label for="input-name">用户名</label>\n                            </div>\n                            <div class="input-field col s6">\n                                <input type="password" id="input-password" name="password">\n                                <label for="input-name">密码</label>\n                            </div>\n                        </div>\n                    </div>\n                    <div class="card-action" align="center"> \n                            <button id="ok" type="submit" class="btn waves-light waves-effect white-text">提交</button>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</form>'
         });
    });
</script>

</body>
</html>
