<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/common.css">
    <title>添加用户信息</title>
    <style>
        h1 {
            color: #337ab7;
            font-size: 15px;
            font-weight: bolder;
            float: none;
            text-shadow: 0 1px 0 #fff;
            position: relative;
            border-bottom: 1px solid #337ab7;
            line-height: 40px;
        }

        .form-group {
            color: #666;
            font-size: 14px;
            font-weight: normal;
        }

        .btn {
            width: 107px;
        }

        #box {
            padding-left: 12%;
        }

        .info {
            color: red;
            margin-left: 2px;
            display: none;
            -webkit-transition: all 1.25s ease;
            -o-transition: all 1.25s ease;
            transition: all 1.25s ease;
        }

        .panel-body {

            border-left: 1px solid #337ab7;
            border-top: 1px solid #337ab7;
            border-right: 1px solid #337ab7;
            border-bottom: 1px solid #337ab7;
        }

        .text{
            width: 214px;
        }
        .s{ width: 20px;
            cursor: pointer;
        }
        select{
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>修改用户信息</h2>
    <div class="panelbody">
    </div>
    <div class="panel">
        <div class="panel-body">
            <div class="form-group" id="box">
                <form action="/api/home/users/update" id="form" method="post">
                    <input type="hidden" name="id" value="${user.id}">
                    <div class="form-group">
                        <label>用户名</label>
                        <input class="form-control text" type="text"  name="userCode" required value="${user.userCode}" readonly>
                    </div>
                    <div class="form-group">
                        <label>姓名</label>
                        <input class="form-control text" type="text"  name="name"  value="${user.name}">
                    </div>

                    <div class="form-group">
                        <label>角色名</label>
                        <br>
                        <select name="roleId" id="sel" class="form-control text">
                            <option value="1">管理员</option>
                            <option value="2">房主</option>
                            <option value="3">租户</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>邮箱</label>
                        <input class="form-control text" type="text"  name="email"  value="${user.email}">
                    </div>
                    <div class="form-group">
                        <label>手机号</label>
                        <input class="form-control text" type="text"  name="phone"  value="${user.phone}">
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="提交" id="but" onclick="alert('修改成功')">
                        <a href="/api/home/users/info" class="btn btn-primary">返回</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
</html>