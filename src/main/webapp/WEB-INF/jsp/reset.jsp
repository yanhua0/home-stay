<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/common.css">
    <title>修改密码</title>
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
            width: 214px;
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
    </style>
</head>
<body>
<div class="container">
    <h2>密码修改</h2>
    <div class="panelbody">

    </div>

    <div class="panel">
        <div class="panel-body">
            <div class="form-group" id="box">
                <form action="changePassword" id="form" method="post">
                    <div class="form-group">
                        <label>密码<input class="form-control text" type="password" id="nowPwd" name="pwd1"></label><span
                            class="info">请输入当前密码</span>
                        <div class="form" id="error"><i class="glyphicon glyphicon-info-sign"></i>&nbsp;密码输入错误！</div>
                    </div>
                    <div class="form-group">
                        <label>新密码<input class="form-control text" type="password"></label><span
                            class="info">请输入新密码</span>
                    </div>
                    <div class="form-group">
                        <label>确认密码<input class="form-control text" id="ds" type="password" name="pwd2"></label><span class="info"
                                                                                                                      id="info"></span>
                    </div>
                    <div class="form-group">
                        <input type="button" class="btn btn-primary" value="提交" id="but">
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
        $(".text").bind('input propertychange', function () {
            var length = $(this).val().length;
            if (length != 0) {
                $(this).css("border", "1px solid #ccc");
                $(this).parent().siblings("span").css("display", "none");
            }
        })
        $("#nowPwd").bind('input propertychange', function () {
            $.post("checkPwd", {password: $("#nowPwd").val()}, function (result) {
                if (result == false) {
                    $("#error").show(500);
                } else {
                    $("#error").hide(500);
                }
            })
        });
        $("#but").click(function() {
            var count = 0;//用于计算文本框为空的个数
            for (var i = 0; i < 3; i++) {
                if ($(".text")[i].value.length == 0) {
                    $(".text")[i].style.border = "1px solid red";
                    $(".info")[i].style.display = "inline";
                    count++;
                    if (i == 2) {
                        $("#info").html("请确认密码");
                    }

                }

            }
            if (count != 0) {
                return;
            }
            //判断两次的密码是否相同
            if ($(".text")[1].value != $(".text")[2].value) {
                $("#info").html("两次输入的密码不一致,请重新输入");
                $(".text")[2].style.border = "1px solid red";
                $(".info")[2].style.display = "inline";
                return;
            }

            if($("#error").css("display")=="block"){
                alert("当前密码错误!");
                return;
            }
            $("#form").submit();
        })
    })
</script>
</html>