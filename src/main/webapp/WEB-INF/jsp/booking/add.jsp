<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/common.css">
    <title>预订房间</title>
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
    <h2>预订房间</h2>
    <div class="panelbody">
    </div>
    <div class="panel">
        <div class="panel-body">
            <div class="form-group" id="box">
                <form action="/api/home/booking" id="form" method="post">
                    <div class="form-group">
                        <label>入住时间<input class="form-control text" type="text" name="intoTime" ></label>
                    </div>
                    <div class="form-group">
                        <label>离开时间<input class="form-control text" id="s2" type="text" name="endTime"></label>
                    </div>
                    <input type="hidden" name="roomId" value="${booking.roomId}">
                    <input type="hidden" name="usersId" value="${sessionScope.users.id}">
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="提交" id="con">
                        <a href="/api/home/room/page" class="btn btn-primary">返回</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
</html>