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
    </style>
</head>
<body>
<div class="container">
    <h2>修改民宿信息</h2>
    <div class="panelbody">
    </div>
    <div class="panel">
        <div class="panel-body">
            <div class="form-group" id="box">
                <form action="" id="form" method="post">
                    <div class="form-group">
                        <label>民宿名称<input class="form-control text" type="text" required name="houseName" value="${booking.roomResDTO.homeStayResDTO.houseName}" ></label>
                    </div>
                    <div class="form-group">
                        <label>房间名称<input class="form-control text"  type="text" required name="roomName" value="${booking.roomResDTO.roomName}"></label>
                    </div>
                    <div class="form-group">
                        <label>价格<input class="form-control text" id="s2" type="text"  required name="price" value="${booking.roomResDTO.price}"></label>
                    </div>
                    <div class="form-group">
                        <label><img src="${booking.roomResDTO.homeStayResDTO.picture}"  style="width: 200px;height: 200px"><input required class="form-control text"  type="file" name="file"></label>
                    </div>
                    <div class="form-group">
                        <label>城市<input class="form-control text" required  type="text" name="city" value="${booking.roomResDTO.homeStayResDTO.city}"></label>
                    </div>
                    <div class="form-group">
                        <label>民宿所属人账号<input class="form-control text"  type="text" name="userCode" required value="${booking.roomResDTO.homeStayResDTO.userCode}"></label>
                    </div>
                    <input type="hidden" name="roomId" value="${booking.roomId}">
                    <input type="hidden" name="usersId" value="${sessionScope.users.id}">
                    <div class="form-group">
                        <input type="button" class="btn btn-primary" value="提交" id="con">
                        <a href="/api/home/room/page" class="btn btn-primary">返回</a>
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
        $("#con").click(function () {
            var form = new FormData(document.getElementById("form"));

            $.ajax({
                type: "POST",
                url: "/api/home/booking/update",
                data: form,
                processData: false,
                contentType: false,
                dataType: "text",
                cache: false,
                success: function (data) {
                    alert("修改成功!!");
                    window.location.reload();

                },
                error: function (data) {
                    console.log(data.responseText);
                    var json = JSON.parse(data.responseText);
                    console.log(json);
                    alert(json.message);
                }
            });
        });
    })
</script>
</html>