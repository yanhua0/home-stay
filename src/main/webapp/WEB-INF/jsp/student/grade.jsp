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
		<h2>成绩查询</h2>
		<div class="panel panel-primary">
			
			<div class="panel-body">
				<table class="table">
					<!-- <caption class="name">用户信息</caption> -->
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
					<c:forEach var="grade" items="${grade}" varStatus="status">
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
</html>