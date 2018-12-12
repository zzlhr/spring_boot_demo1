<html>
<head>
    <title>freemarker表格练习</title>
    <meta charset="UTF-8">
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 style="text-align: center">用户表格</h1>
    <div style="padding: 10px;">
        <a href="add.html" class="btn btn-primary">添加</a>
    </div>
    <div>
        <table class="table table-striped table-bordered table-hover table-condensed">
            <thead>
            <tr>
                <th>用户id</th>
                <th>用户名</th>
                <th>密码</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <#list users as user>
                <tr>
                <td>${user.uid}</td>
                <td>${user.userName}</td>
                <td>${user.password}</td>
                <td>${user.createTime}</td>
                <td>
                    <a href="/deleteUser?uid=${user.uid}">删除</a>
                    <a onclick="updateModal(${user.uid}, '${user.userName}', '${user.password}')">修改</a>
                </td>
                </tr>
            </#list>
            </tbody>
        </table>
        <div id="updateUserModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">修改用户</h4>
                    </div>
                    <div class="modal-body">
                        <form id="up-form" style="padding: 10px;" method="post" action="update.html">
                            <input id="up-uid" class="hidden" type="text" name="uid" value="">
                            <div class="form-group">
                                <label for="userName">用户名</label>
                                <input type="text" name="userName" class="form-control" id="userName"
                                       placeholder="请输入用户名">
                            </div>
                            <div class="form-group">
                                <label for="password">密码</label>
                                <input type="text" name="password" class="form-control" id="password"
                                       placeholder="请输入密码" value="">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary" onclick="submit()">保存</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </div>
</div>
</body>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    function updateModal(uid, userName, password) {
        console.log(uid)
        $('#up-uid').val(uid);
        $('#userName').val(userName);
        $('#password').val(password);
        $('#updateUserModal').modal('show');
    }

    function submit() {
        $('#up-form').submit();
    }
</script>
</html>