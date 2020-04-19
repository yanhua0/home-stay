<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <title>Insert title here</title>
</head>
<body>
<form class="form-group" method="post" action="/api/home/home/stay" id="form" enctype="multipart/form-data">
    <div class="form-group">
        <label for="">名称</label>
        <input type="text" class="form-control" name="houseName">
    </div>
    <div class="form-group">
        <label for="">地址</label>
        <input type="text" class="form-control" name="address"  placeholder="请输入地址">
    </div>
    <div class="form-group">
        <label for="">描述</label>
        <input type="password" class="form-control" name="description"  placeholder="请输入描述">
    </div>
    <div class="form-group">
        <label for="">图片</label>
        <input type="file" class="form-control" name="file">
    </div>
    <div class="form-group">
        <label for="">所属人账号</label>
        <input type="text" class="form-control" name="userCode" placeholder="请输入账号">
    </div>
    <input type="submit">
</form>
<a href="/index/download">下载</a>
</body>
</html>