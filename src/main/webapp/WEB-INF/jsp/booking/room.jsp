<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/common.css">
    <style>
        .ho:hover{
            background: #efb307a6;
            cursor: pointer;
        }
        #cate{
            width: 20%;
            display:inline;
        }
        .test{
            position: relative;
            height: 20px;
        }
        .test ul{

            position: absolute;
            left: 50%;
            top: -30%;
            transform:translate(-50%,-50%);
        }
    </style>
</head>
<body>

<div class="container">
    <h2>预订房间</h2>

    <div class="panel panel-primary">

        <div class="panel-body">
            <table class="table" style="word-break:break-all; word-wrap:break-all;">
                <caption class="name">&nbsp;
                    <c:if test="${sessionScope.users.roleId==1||sessionScope.users.roleId==2}">
                        <a href="#"
                           class="btn btn-info glyphicon glyphicon-plus"  id="del2">批量删除</a>
                    </c:if>
                    <br><br>
                    <form action="/api/home/room/page/room" method="get">&nbsp;
                        <input type="text"  class="searc" name="roomName" value="${dto.roomName}" placeholder="房间名称">
                        <select id="cate" class="form-control" name="used">
                            <option value="1">空闲</option>
                            <option value="2">已入住</option>
                        </select>

                        入住时间：  <input type="datetime-local"  class="searc" name="intoStart" value="${dto.intoStart}" >
                        <input type="datetime-local"  class="searc" name="intoEnd" value="${dto.intoEnd}" >
                        <br>
                        <br>
                        离开时间：   <input type="datetime-local"  class="searc" name="leaveStart" value="${dto.leaveStart}" >
                        <input type="datetime-local"  class="searc" name="leaveEnd" value="${dto.leaveEnd}" >
                        <input type="submit" value="查询" class="btn btn-info">&nbsp;<input type="button" class="btn btn-info" value="初始化" id="init">
                    </form>

                </caption>
                <thead>
                <tr>
                    <th><input type="checkbox" class="checkbox1" id="all"></th>
                    <th>No.</th>
                    <th>房间名称</th>
                    <th>价格</th>
                    <th>所属民宿</th>
                    <th>房间状态</th>
                    <th>入住人账号</th>
                    <th>入住人姓名</th>
                    <th>入住时间</th>
                    <th>离开时间</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="booking" items="${page.list}" varStatus="status">
                    <tr class="ho">
                        <td><input type="checkbox" name="us" class="checkbox" value="${booking.id}"></td>
                        <td>${status.index+1}</td>
                        <td>${booking.roomResDTO.roomName}</td>
                        <td>${booking.roomResDTO.price}</td>
                        <td>${booking.roomResDTO.homeStayResDTO.houseName}</td>
                        <td>${booking.roomResDTO.usedStr}</td>
                        <td>${booking.usersResDTO.userCode}</td>
                        <td>${booking.usersResDTO.name}</td>
                        <td><fmt:formatDate value="${booking.intoTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td><fmt:formatDate value="${booking.leaveTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
    <%--分页实现--%>
    <c:if test="${page.pages>=1}">
        <p>每页${page.pageSize}条  当前页${page.size}条${page.pageNum}/${page.pages}页
            记录数${page.total}
        </p>
        <div class="test">
            <ul class="pagination">
                <c:if test="${page.isFirstPage==true}"><li><a>首页</a></li></c:if>
                <c:if test="${page.isFirstPage==false}">
                    <li><a href="/api/home/room/page/room?page=${page.firstPage}&roomName=${dto.roomName}&used=${dto.used}&intoStart=${dto.intoStart}&intoEnd=${dto.intoEnd}&leaveStart=${dto.leaveStart}&leaveEnd=${dto.leaveEnd}">首页</a></li></c:if>
                <c:if test="${page.hasPreviousPage==true}">
                    <li><a href="/api/home/room/page/room?page=${page.prePage}&roomName=${dto.roomName}&used=${dto.used}&intoStart=${dto.intoStart}&intoEnd=${dto.intoEnd}&leaveStart=${dto.leaveStart}&leaveEnd=${dto.leaveEnd}">&laquo;</a></li></c:if>
                <c:if test="${page.hasPreviousPage==false}">
                    <li><a>&laquo;</a></li></c:if>


                <c:forEach begin="1" end="${page.pages}" var="index">
                    <c:if test="${page.pageNum==index}"><li>
                        <a style="background-color: #337ab7;color:#fff">${index}</a></li>
                    </c:if>
                    <c:if test="${page.pageNum!=index}">
                        <li><a href="/api/home/room/page/room?page=${index}&roomName=${dto.roomName}&used=${dto.used}&intoStart=${dto.intoStart}&intoEnd=${dto.intoEnd}&leaveStart=${dto.leaveStart}&leaveEnd=${dto.leaveEnd}">${index}</a></li></c:if>
                </c:forEach>
                <c:if test="${page.hasNextPage==true}">
                    <li><a href="/api/home/room/page/room?page=${page.nextPage}&roomName=${dto.roomName}&used=${dto.used}&intoStart=${dto.intoStart}&intoEnd=${dto.intoEnd}&leaveStart=${dto.leaveStart}&leaveEnd=${dto.leaveEnd}">&raquo;</a></li></c:if>
                <c:if test="${page.hasNextPage==false}">
                    <li><a>&raquo;</a></li></c:if>
                <c:if test="${page.isLastPage==true}">
                    <li><a >末页</a></li></c:if>
                <c:if test="${page.isLastPage==false}">
                    <li><a href="/api/home/room/page/room?page=${page.lastPage}&roomName=${dto.roomName}&used=${dto.used}&intoStart=${dto.intoStart}&intoEnd=${dto.intoEnd}&leaveStart=${dto.leaveStart}&leaveEnd=${dto.leaveEnd}">末页</a></li></c:if>
            </ul>
        </div>
    </c:if>
</div>
<input type="hidden" value="${dto.used}" id="hidden">
</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $("#del2").click(function () {
            if (confirm("你确定要删除吗?")) {
                var arr = [];
                $("input[name='us']:checked").each(function (i) {//把所有被选中的复选框的值存入数组
                    arr[i] = $(this).val();
                });
                var ids=arr.join(",");
                $.get("/api/home/booking/delete/ids", {ids: ids}, function (result) {
                    alert("删除成功!");
                    window.location.reload();
                })
            }
        })
        $("#all").click(function () {

            if (this.checked == true) {
                for (var i = 0; i < $(".checkbox").length; i++)
                    $(".checkbox")[i].checked = true;
            } else {
                for (var i = 0; i < $(".checkbox").length; i++)
                    $(".checkbox")[i].checked = false;
            }

        });
        $(".checkbox").click(function () {
            var c = $(".checkbox").length;//选中的长度
            var a = $(".checkbox:checked").length;//选中的长度
            if (c == a) {
                $("#all").prop("checked", true);
            } else {
                $("#all").prop("checked", false);
            }

        });
        $("#cate ").val($("#hidden").val());
        $("#init").click(function () {
            window.location.href = "/api/home/room/page/room";
        });

    });
</script>
</html>