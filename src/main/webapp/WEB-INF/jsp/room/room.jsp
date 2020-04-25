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
    <h2>房间管理</h2>

    <div class="panel panel-primary">

        <div class="panel-body">
            <table class="table" style="word-break:break-all; word-wrap:break-all;">
                <caption class="name">&nbsp;
                    <c:if test="${(sessionScope.users.roleId==1||sessionScope.users.roleId==2)&&dto.key==0}">
                        <a href="#"
                           class="btn btn-info glyphicon glyphicon-plus" data-toggle="modal"
                           data-target="#add" id="add2">添加</a>&nbsp;
                        <a href="#"
                           class="btn btn-info glyphicon "  id="del2">删除</a>
                        <a href="#"
                           class="btn btn-info glyphicon glyphicon-plus"data-toggle="modal"
                           data-target="#add3"  id="tui">退房</a>&nbsp;
                    </c:if>
                    <c:if test="${dto.homeId!=null}">
                    <a href="/api/home/home/stay/page" class="btn btn-info glyphicon">返回</a>
                    </c:if>
                    <br><br>
                    <form action="/api/home/room/room?homeId=${dto.homeId}&key=${key}" method="get">&nbsp;
                        <input type="text"  class="searc" name="roomName" value="${dto.roomName}" placeholder="房间名称">
                        <select id="cate" class="form-control" name="used">
                            <option value="1">空闲</option>
                            <option value="2">已入住</option>
                        </select>
                        <input type="hidden" value="${dto.key}" name="key">
                        <input type="hidden" value="${dto.homeId}" name="homeId">
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
                    <th>预订人账号</th>
                    <th>预订人</th>
                    <th>预订</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="roomResDTO" items="${page.list}" varStatus="status">
                    <tr class="ho">
                        <td><input type="checkbox" name="us" class="checkbox" value="${roomResDTO.id}"></td>
                        <td>${status.index+1}</td>
                        <td>${roomResDTO.roomName}</td>
                        <td>${roomResDTO.price}</td>
                        <td>${roomResDTO.homeStayResDTO.houseName}</td>
                        <td>${roomResDTO.usedStr}</td>
                        <td>${roomResDTO.usersResDTO.userCode}</td>
                        <td>${roomResDTO.usersResDTO.name}</td>
                        <td>
                            <c:if test="${roomResDTO.used==1}">
                                <a href="/api/home/booking/${roomResDTO.id}">预订</a>&nbsp;&nbsp;
                                
                            </c:if>
                            <c:if test="${(sessionScope.users.roleId==1||sessionScope.users.roleId==2)&&sessionScope.users.roleId==2&&dto.key==0}">
                            <a href="/api/home/room/update/info/${roomResDTO.id}">修改</a>&nbsp;&nbsp;

                        </c:if>

                        </td>
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
                    <li><a href="/api/home/room/room?homeId=${dto.homeId}&key=${dto.key}&page=${page.firstPage}&roomName=${dto.roomName}&used=${dto.used}&intoStart=${dto.intoStart}&intoEnd=${dto.intoEnd}&leaveStart=${dto.leaveStart}&leaveEnd=${dto.leaveEnd}">首页</a></li></c:if>
                <c:if test="${page.hasPreviousPage==true}">
                    <li><a href="/api/home/room/room?homeId=${dto.homeId}&key=${dto.key}&page=${page.prePage}&roomName=${dto.roomName}&used=${dto.used}&intoStart=${dto.intoStart}&intoEnd=${dto.intoEnd}&leaveStart=${dto.leaveStart}&leaveEnd=${dto.leaveEnd}">&laquo;</a></li></c:if>
                <c:if test="${page.hasPreviousPage==false}">
                    <li><a>&laquo;</a></li></c:if>


                <c:forEach begin="1" end="${page.pages}" var="index">
                    <c:if test="${page.pageNum==index}"><li>
                        <a style="background-color: #337ab7;color:#fff">${index}</a></li>
                    </c:if>
                    <c:if test="${page.pageNum!=index}">
                        <li><a href="/api/home/room/room?homeId=${dto.homeId}&key=${dto.key}&page=${index}&roomName=${dto.roomName}&used=${dto.used}&intoStart=${dto.intoStart}&intoEnd=${dto.intoEnd}&leaveStart=${dto.leaveStart}&leaveEnd=${dto.leaveEnd}">${index}</a></li></c:if>
                </c:forEach>
                <c:if test="${page.hasNextPage==true}">
                    <li><a href="/api/home/room/room?homeId=${dto.homeId}&key=${dto.key}&page=${page.nextPage}&roomName=${dto.roomName}&used=${dto.used}&intoStart=${dto.intoStart}&intoEnd=${dto.intoEnd}&leaveStart=${dto.leaveStart}&leaveEnd=${dto.leaveEnd}">&raquo;</a></li></c:if>
                <c:if test="${page.hasNextPage==false}">
                    <li><a>&raquo;</a></li></c:if>
                <c:if test="${page.isLastPage==true}">
                    <li><a >末页</a></li></c:if>
                <c:if test="${page.isLastPage==false}">
                    <li><a href="/api/home/room/room?homeId=${dto.homeId}&key=${dto.key}&page=${page.lastPage}&roomName=${dto.roomName}&used=${dto.used}&intoStart=${dto.intoStart}&intoEnd=${dto.intoEnd}&leaveStart=${dto.leaveStart}&leaveEnd=${dto.leaveEnd}">末页</a></li></c:if>
            </ul>
        </div>
    </c:if>
</div>

<!-- 添加窗口 -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title text-center" id="myModalLabel">
                    添加房间
                </h4>
            </div>
            <div class="modal-body" id="addUser">
                <form class="form-group" method="post" action="#" id="form" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="">名称</label>
                        <input type="text" class="form-control" name="roomName" placeholder="请输入房间名称"
                               id="time">
                    </div>
                    <div class="form-group">
                        <label for="">价格</label>
                        <input type="text" class="form-control" name="price" placeholder="请输入价格">
                    </div>
                    <div class="form-group">
                        <label for="">民宿</label>
                        <select id="t2" class="form-control" name="homeId">
                            <c:forEach var="r" items="${homes}" varStatus="status">
                                <option value="${r.id}" >${r.houseName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>
            </div>


            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="con">
                    确定
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="qu">取消
                </button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div><!--添加窗口-->

<!-- 添加窗口 -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="add3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title text-center" id="myModalLabel2">
                    退房窗口
                </h4>
            </div>
            <form class="form-group" method="get" action="/api/home/room/update" id="form2">
                <div class="modal-body" >


                    <div class="form-group">
                        <label for="">房间名称</label>
                        <select id="t" class="form-control" name="id">
                            <c:forEach var="r" items="${rooms}" varStatus="status">
                                <option value="${r.id}" >${r.roomName}</option>
                            </c:forEach>
                        </select>
                    </div>


                </div>


                <div class="modal-footer">
                    <input type="button" class="btn btn-primary" id="tui2" value="确定">
                    </button>
                    <button type="button" class="btn btn-default" id="qu2" data-dismiss="modal">取消
                    </button>

                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div><!--添加窗口-->
<input type="hidden" value="${dto.homeId}" id="hidden">
<input type="hidden" value="${dto.used}" id="hidden2">
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
                $.get("/api/home/room/delete/ids", {ids: ids}, function (result) {
                    alert("删除成功!");
                    var id=$("#hidden").val();
                    window.location.href="/api/home/room/room?key=${dto.key}&homeId="+id;
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
        $("#tui2").click(function () {
            var formObject = {};
            var formArray =$("#form2").serializeArray();
            $.each(formArray,function(i,item){
                formObject[item.name] = item.value;
            });
            console.log(formObject);
            $.ajax({
                type:"POST",
                url:"/api/home/room/update",
                data:JSON.stringify(formObject),
                dataType:"text",
                cache:false,
                contentType:"application/json",
                success:function (data) {
                    alert("退房成功!!");
                    $("#qu2").click();
                    window.location.reload();
                },
                error:function (data) {
                    console.log(data.responseText);
                    var json=JSON.parse(data.responseText);
                    console.log(json);
                    alert(json.message);
                }
            });
        });
        $("#cate ").val($("#hidden2").val());
        $("#init").click(function () {
            var id=$("#hidden").val();
            window.location.href="/api/home/room/room?key=${dto.key}&homeId="+id;
        });
        $("#con").click(function () {
            var formObject = {};
            var formArray =$("#form").serializeArray();
            $.each(formArray,function(i,item){
                formObject[item.name] = item.value;
            });
            console.log(formObject);
            $.ajax({
                type:"POST",
                url:"/api/home/room",
                data:JSON.stringify(formObject),
                dataType:"text",
                cache:false,
                contentType:"application/json",
                success:function (data) {
                    alert("添加成功!!");
                    var id=$("#hidden").val();
                    window.location.href="/api/home/room/room?key=${dto.key}&homeId="+id;
                },
                error:function (data) {
                    console.log(data.responseText);
                    var json=JSON.parse(data.responseText);
                    console.log(json);
                    alert(json.message);
                }
            });
        });
    });
</script>
</html>