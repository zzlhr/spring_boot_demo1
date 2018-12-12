<html>
<head>
    <title>freemarker表格练习</title>
    <meta charset="UTF-8">
</head>
<body>
<div>用户表格</div>
<div>
    <table>
        <thead>
        <tr>
            <th>用户id</th>
            <th>用户名</th>
            <th>用户昵称</th>
            <th>性别</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
             <#list user as u>
             <tr>
                 <td>${u.id}</td>
                 <td>${u.userName}</td>
                 <td>${u.nickName}</td>
                 <td>
                         <#if u.sex == 1>男</#if>
                         <#if u.sex == 2>女</#if>
                 </td>

             </tr>
             </#list>

        </tbody>

    </table>
</div>
</body>
</html>