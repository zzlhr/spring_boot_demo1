<html>
<head>
    <title>freemarker表格练习</title>
    <meta charset="UTF-8">
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container" style="width: 500px;">
    <h1 style="text-align: center">添加用户</h1>
    <form style="padding: 10px;" method="post" action="add.html">
        <div class="form-group">
            <label for="userName">用户名</label>
            <input type="text" name="userName" class="form-control" id="userName" placeholder="请输入用户名">
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码">
        </div>
        <button type="submit" class="btn btn-primary">添加</button>
    </form>
</div>
</body>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>