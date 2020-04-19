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
    <h2>房主和租户信息</h2>

    <div class="panel panel-primary">

        <div class="panel-body">
            <table class="table" style="word-break:break-all; word-wrap:break-all;">
                <caption class="name">&nbsp;
                    <form action="/api/home/users/info" method="get">&nbsp;
                        <input type="text"  class="searc" name="name" value="${u.name}">
                        <select id="cate" class="form-control" name="roleId">
                            <option value="1">管理员</option>
                            <option value="2">房主</option>
                            <option value="3">租户</option>
                        </select>
                        <input type="submit" value="查询" class="btn btn-info">&nbsp;<input type="button" class="btn btn-info" value="初始化" id="init">
                    </form></caption>
                <thead>
                <tr>
                    <th>No.</th>
                    <th>用户名</th>
                    <th>姓名</th>
                    <th>角色名</th>
                    <th>邮件</th>
                    <th>电话</th>
                    <th>注册时间</th>

                </tr>
                </thead>
                <tbody>
                  <c:forEach var="user" items="${page.list}" varStatus="status">
                      <tr class="ho">
                          <td>${status.index+1}</td>
                          <td>${user.userCode}</td>
                          <td>${user.name}</td>
                          <td>${user.roleName}</td>
                          <td>${user.email}</td>
                          <td>${user.phone}</td>
                          <td><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                          <td><a href="/api/home/users/${user.id}">修改</a>&nbsp;&nbsp;
                          <a href="/api/home/users/delete/${user.id}" onclick="if(confirm('确定删除?')==false)return false;">删除</a></td>
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
                    <li><a href="/api/home/users/info?page=${page.firstPage}&roleId=${u.roleId}&name=${u.name}">首页</a></li></c:if>
                <c:if test="${page.hasPreviousPage==true}">
                    <li><a href="/api/home/users/info?page=${page.prePage}&roleId=${u.roleId}&name=${u.name}">&laquo;</a></li></c:if>
                <c:if test="${page.hasPreviousPage==false}">
                    <li><a>&laquo;</a></li></c:if>


                <c:forEach begin="1" end="${page.pages}" var="index">
                    <c:if test="${page.pageNum==index}"><li>
                        <a style="background-color: #337ab7;color:#fff">${index}</a></li>
                    </c:if>
                    <c:if test="${page.pageNum!=index}">
                        <li><a href="/api/home/users/info?page=${index}&roleId=${u.roleId}&name=${u.name}">${index}</a></li></c:if>
                </c:forEach>
                <c:if test="${page.hasNextPage==true}">
                    <li><a href="/api/home/users/info?page=${page.nextPage}&roleId=${u.roleId}&name=${u.name}">&raquo;</a></li></c:if>
                <c:if test="${page.hasNextPage==false}">
                    <li><a>&raquo;</a></li></c:if>
                <c:if test="${page.isLastPage==true}">
                    <li><a >末页</a></li></c:if>
                <c:if test="${page.isLastPage==false}">
                    <li><a href="/api/home/users/info?page=${page.lastPage}&roleId=${u.roleId}&name=${u.name}">末页</a></li></c:if>
            </ul>
        </div>
    </c:if>

</div>
<input type="hidden" value="${u.roleId}" id="hidden">
</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script>
    $(function () {
        $("#cate ").val($("#hidden").val());
        $("#init").click(function () {
            window.location.href = "info";
        });
    })
</script>
</html>