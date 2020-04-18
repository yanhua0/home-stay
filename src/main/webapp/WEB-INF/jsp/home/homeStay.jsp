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
    </style>

</head>
<body>
<div class="container">
    <h2>综合测评</h2>
    <div class="panel panel-primary">

        <div class="panel-body">
            <table class="table">
                <!-- <caption class="name">用户信息</caption> -->
                <thead>
                <tr>
                    <th>No.</th>
                    <th>班级</th>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>学期</th>
                    <th>思想品德总分</th>
                    <th>素质素养总分</th>
                    <th>寝室操行减分</th>
                    <th>考勤减分</th>
                    <th>第一学期</th>
                    <th>第二学期</th>
                    <th>学年成绩</th>
                    <th>最终成绩</th>
                    <th>时长</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="assess" items="${assess}" varStatus="status">
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
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>
</body>
</html>l