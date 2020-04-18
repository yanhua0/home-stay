<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/common.css">
    <title>添加成绩信息</title>
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

        #error {
            color: red;
            display: none;
        }

        #error2 {
            color: red;
            display: none;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>添加成绩信息</h2>
    <div class="panelbody">
    </div>
    <div class="panel">
        <div class="panel-body">
            <div class="form-group" id="box">
                <form action="/teacher/addG" id="form" method="post">
                    <div class="form-group">
                        <label>学号<input class="form-control text" type="text" id="s1" name="username"></label><span
                            class="info">请输入学生学号</span>
                        <div class="form" id="error"><i class="glyphicon glyphicon-info-sign"></i>&nbsp;学生学号错误</div>
                    </div>
                    <div class="form-group">
                        <label>学期<input class="form-control text" type="text" name="term" placeholder="格式参考20151"></label>
                    </div>
                    <div class="form-group">
                        <label>课程编号<input class="form-control text" id="s2" type="text" name="no"></label>
                        <div class="form" id="error2"><i class="glyphicon glyphicon-info-sign"></i>&nbsp;课程编号错误</div>
                    </div>
                    <div class="form-group">
                        <label>分数<input class="form-control text" id="ds" type="text" name="result"></label>
                    </div>
                    <div class="form-group">
                        <input type="button" class="btn btn-primary" value="提交" id="but">
                        <a href="/teacher/findAllGra" class="btn btn-primary">返回</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script>
    $(function () {
        $("#but").click(function () {
            $("#error").hide();
            $("#error2").hide();
            var uname = $("#s1").val();
            var no = $("#s2").val();
            if(uname.length==0||no.length==0){
                return false;
            }
            $.get("findByUnameAndNo", {username: uname, no: no}, function (re) {
                if (re == 0) {
                    $("#error").show();
                    $("#error2").show();
                } else if (re == 1) {
                    $("#error2").show();
                } else if (re == 2) {
                    $("#error").show();
                } else if (re == 3) {
                    alert("添加成功!")
                    $("#form").submit();
                }
            })
        });

    })
</script>
</html>