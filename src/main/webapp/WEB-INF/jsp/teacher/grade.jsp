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
		caption{
			padding-bottom: 0;
		}
	</style>

</head>
<body>
	<div class="container">
		<h2>成绩查询</h2>
		<div class="panel panel-primary">
			<div class="panel-body">
				<table class="table">
					<caption class="name">&nbsp;<a href="/teacher/addGraUI" class="btn btn-info glyphicon glyphicon-plus">添加</a><br><br>
						<form action="/teacher/findAllGra" method="get">&nbsp;<input type="text" value="${uname}" class="searc"  name="username" required placeholder="学号/姓名">
						<input type="submit" value="查询" class="btn btn-info">
						<input type="button" class="btn btn-info" value="初始化" id="init">
						</form>
					</caption>
					<thead>
						<tr>
							<th>No.</th>
							<th>学号</th>
							<th>姓名</th>
							<th>学期</th>
							<th>课程编号</th>
							<th>课程名称</th>
							<th>类别</th>
							<th>学分</th>
							<th>成绩</th>
							<th>绩点(分数-50)/10</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="grade" items="${list}" varStatus="status">
						<tr class="ho">
							<th>${status.index+1}</th>
							<td>${grade.user.username}</td>
							<td>${grade.user.name}</td>
							<td>${grade.term}</td>
							<td>${grade.course.no}</td>
							<td>${grade.course.name}</td>
							<td>${grade.course.category}</td>
							<td>${grade.course.credit}</td>
							<td>${grade.result}</td>
							<td>${grade.point}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script>
	$(function () {
		$("#init").click(function () {
			window.location.href="findAllGra";
		});
	})
</script>
</html>