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
        .jiage {
            position: relative;
        }

        .ming {
            width: 200px;
        }

        em {
            font-size: 22px;
            font-style: normal;
            color: red;
            position: relative;
            top: -28px;
            left: 15px;
        }

        .ming a {
            color: #3c3c3c;
            font-size: 15px;
        }

        a {
            text-decoration: none;
            z-index: 10000000000;
        }

        a:hover {
            text-decoration: underline;
        }

        .ho:hover {
            background: #efb307a6;
            cursor: pointer;
        }

        .table ul li {
            list-style: none;
            float: left;
            margin-left: 15px;
            border-right: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            border-top: 1px solid #ddd;
        }

        .table ul li:hover {
            border: 0;
            border: 1px solid red;
        }

        .table ul {
            margin-left: -25px;
        }

        img {
            width: 200px;
            height: 200px;
        }

        .test {
            position: relative;
            height: 20px;
        }

        .test ul {

            position: absolute;
            left: 50%;
            top: -30%;
            transform: translate(-50%, -50%);
        }
    </style>


</head>
<body>
<div class="container">
    <h2>民宿查询</h2>
    <div class="panel panel-primary">
        <div class="panel-body">
            <div class="table">
                <caption class="name">&nbsp;<a href="#"
                                               class="btn btn-info glyphicon glyphicon-plus" data-toggle="modal"
                                               data-target="#add">添加</a><br><br>
                    <form action="/api/home/home/stay/page" method="get">&nbsp;<input type="text"
                                                                                      value="${house.houseName}"
                                                                                      class="searc" name="houseName"
                                                                                      placeholder="民宿名称">&nbsp;<input
                            type="text" value="${house.city}"
                            class="searc" name="city"
                            placeholder="所在城市">
                        &nbsp;<input type="text" value="${house.address}"
                                     class="searc" name="address"
                                     placeholder="地址">
                        <input type="submit" value="查询" class="btn btn-info">
                        <input type="button" class="btn btn-info" value="初始化" id="init">
                    </form>
                </caption>
                <ul>
                    <c:forEach var="page" items="${page.list}" varStatus="status">
                        <li>
                            <div class="item1">
                                <div><a href="#"><img src="${page.picture}" alt="加载中..."></a></div>
                                <div class="ming"><a href="#">${page.houseName}</a></div>
                                <div class="jiage"><h5>地址：${page.address}</h5><h5>城市：${page.city}</h5></div>
                            </div>
                            <input type="hidden" value="${page.id}" class="home">
                        </li>
                    </c:forEach>
                </ul>
            </div>

        </div>

    </div>
    <%--分页实现--%>
    <c:if test="${page.pages>=1}">
        <p>每页${page.pageSize}条 当前页${page.size}条${page.pageNum}/${page.pages}页
            记录数${page.total}
        </p>
        <div class="test">
            <ul class="pagination">
                <c:if test="${page.isFirstPage==true}">
                    <li><a>首页</a></li>
                </c:if>
                <c:if test="${page.isFirstPage==false}">
                    <li>
                        <a href="/api/home/home/stay/page?page=${page.firstPage}&address=${house.address}&houseName=${house.houseName}">首页</a>
                    </li>
                </c:if>
                <c:if test="${page.hasPreviousPage==true}">
                    <li>
                        <a href="/api/home/home/stay/page?page=${page.prePage}&address=${house.address}&houseName=${house.houseName}">&laquo;</a>
                    </li>
                </c:if>
                <c:if test="${page.hasPreviousPage==false}">
                    <li><a>&laquo;</a></li>
                </c:if>


                <c:forEach begin="1" end="${page.pages}" var="index">
                    <c:if test="${page.pageNum==index}">
                        <li>
                            <a style="background-color: #337ab7;color:#fff">${index}</a></li>
                    </c:if>
                    <c:if test="${page.pageNum!=index}">
                        <li>
                            <a href="/api/home/home/stay/page?page=${index}&address=${house.address}&houseName=${house.houseName}">${index}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <c:if test="${page.hasNextPage==true}">
                    <li>
                        <a href="/api/home/home/stay/page?page=${page.nextPage}&address=${house.address}&houseName=${house.houseName}">&raquo;</a>
                    </li>
                </c:if>
                <c:if test="${page.hasNextPage==false}">
                    <li><a>&raquo;</a></li>
                </c:if>
                <c:if test="${page.isLastPage==true}">
                    <li><a>末页</a></li>
                </c:if>
                <c:if test="${page.isLastPage==false}">
                    <li>
                        <a href="/api/home/home/stay/page?page=${page.lastPage}&address=${house.address}&houseName=${house.houseName}">末页</a>
                    </li>
                </c:if>
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
                    添加民宿
                </h4>
            </div>
            <div class="modal-body" id="addUser">
                <form class="form-group" method="post" action="#" id="form" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="">名称</label>
                        <input type="text" class="form-control" name="houseName" placeholder="请输入民宿名称"
                               id="time">
                    </div>
                    <div class="form-group">
                        <label for="">地址</label>
                        <input type="text" class="form-control" name="address" placeholder="请输入地址">
                    </div>
                    <div class="form-group">
                        <label for="">描述</label>
                        <input type="password" class="form-control" name="description" placeholder="请输入描述">
                    </div>
                    <div class="form-group">
                        <label for="">图片</label>
                        <input type="file" class="form-control" name="file">
                    </div>
                    <div class="form-group">
                        <label for="">城市</label>
                        <input type="text" class="form-control" name="city">
                    </div>
                    <div class="form-group">
                        <label for="">所属人账号</label>
                        <input type="text" class="form-control" name="userCode" placeholder="请输入账号">
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
</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $("#init").click(function () {
            window.location.href = "page";
        });
        $(".table ul li").click(function () {
            var child=$(this).children(".home")[0].value;
            window.location.href="/api/home/room/page?homeId="+child;
        });
        $("#con").click(function () {
            var form = new FormData(document.getElementById("form"));

            $.ajax({
                type: "POST",
                url: "/api/home/home/stay",
                data: form,
                processData: false,
                contentType: false,
                dataType: "text",
                cache: false,

                success: function (data) {
                    alert("添加成功!!");
                    $("#qu").click();

                },
                error: function (data) {
                    console.log(data.responseText);
                    var json = JSON.parse(data.responseText);
                    console.log(json);
                    alert(json.message);
                }
            });

        });
    });
</script>
</html>
l