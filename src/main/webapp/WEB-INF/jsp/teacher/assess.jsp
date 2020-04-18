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

        .ho:hover {
            background: #efb307a6;
            cursor: pointer;
        }
        tr{
            font-size: 15px;
        }
    </style>

</head>
<body>
<div class="container">
    <h2>综合测评</h2>
    <div class="panel panel-primary">
        <div class="panel-body">
            <table class="table">
                <caption class="name">&nbsp;<a class="btn btn-info glyphicon glyphicon-plus"
                                                           data-toggle="modal" data-target="#add">更新信息</a><br><br>
                    <form action="/teacher/findAllAssess" method="get">&nbsp;<input type="text" value="${uname}" class="searc"
                                                                              name="username" required
                                                                              placeholder="学号/姓名/班级">
                        <input type="submit" value="查询" class="btn btn-info">
                        <input type="button" class="btn btn-info" value="初始化" id="init">
                    </form>
                    <h5>注:最终成绩（S）=思想品德分（A）*10%+学业成绩分（B）*70%+素质素养分（C）*20%-其它操行减分（D）。</h5>
                </caption>
                <thead>
                <tr>
                    <th>No.</th>
                    <th>班级</th>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>学期</th>
                    <th>思想品德分</th>
                    <th>素质素养分</th>
                    <th>寝室操行减分</th>
                    <th>考勤减分</th>
                    <th>第一学期</th>
                    <th>第二学期</th>
                    <th>学年成绩</th>
                    <th>最终成绩</th>
                    <th>时长</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="assess" items="${list}" varStatus="status">
                    <tr class="ho">
                        <th>${status.index+1}</th>
                        <td>${assess.user.classno}</td>
                        <td>${assess.user.username}</td>
                        <td>${assess.user.name}</td>
                        <td>${assess.term}</td>
                        <td>${assess.morality}</td>
                        <td>${assess.quality}</td>
                        <td>${assess.conduct}</td>
                        <td>${assess.attend}</td>
                        <td>${assess.firsts}</td>
                        <td>${assess.seconds}</td>
                        <td>${assess.total}</td>
                        <td>${assess.finals}</td>
                        <td>${assess.duration}</td>
                        <td><a href="#" class="edit" data-toggle="modal" data-target="#edit">修改</a>
                            <input type="hidden" value="${assess.id}" class="aid">
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>
<!-- 批量添加窗口 -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="ma">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title text-center" id="myModalLabel2">
                    更新测评信息
                </h4>

            </div>
            <form class="form-group" action="/teacher/addAss" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="">学期</label>
                        <input class="form-control" type="text" id="pass" placeholder="请输入学期,参考格式2015-2016" name="term"
                               required="required">
                    </div>

                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="确定" id="con" onclick="alert('更新成功')">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消
                    </button>

                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div><!--批量添加窗口-->
<!-- 修改窗口 -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="ma2">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title text-center" id="myModalLabel">
                    修改测评信息
                </h4>
            </div>
            <form class="form-group" action="/teacher/updateAss" method="get">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="">思想品德分</label>
                        <input class="form-control" type="text" id="s1"  name="morality" required="required">
                    </div>
                    <div class="form-group">
                        <label for="">素质素养分</label>
                        <input class="form-control" type="text" id="s2"  name="quality" required="required">
                    </div>
                    <div class="form-group">
                        <label for="">寝室操行减分</label>
                        <input class="form-control" type="text"  id="s3"  name="conduct" required="required">
                    </div>
                    <div class="form-group">
                        <label for="">考勤减分</label>
                        <input class="form-control" type="text"  id="s4" name="attend" required="required">
                    </div>
                    <div class="form-group">
                        <label for="">时长</label>
                        <input class="form-control" type="text"  id="s5"  name="duration" required="required">
                    </div>
                    <input type="hidden" value="${uname}" name="username">
                    <input type="hidden" name="id" id="aaid">
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="确定" onclick="alert('修改成功!')">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消
                    </button>

                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div><!--批量添加窗口-->
</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $("#init").click(function () {
            window.location.href = "findAllAssess";
        });
        $(".edit").click(function () {
            var id=$(this).siblings(".aid").val();
            $.get("findByAId",{id:id},function (result) {
                $("#s1").val(result.morality);
                $("#s2").val(result.quality);
                $("#s3").val(result.conduct);
                $("#s4").val(result.attend);
                $("#s5").val(result.duration);
                $("#aaid").val(result.id);
            });
        })
    });
</script>
</html>