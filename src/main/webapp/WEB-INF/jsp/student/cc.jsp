<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		.bb{
			cursor: pointer;
		}
		.bb:hover{
			text-decoration: none;
		}
	</style>

</head>
<body>
	<div class="container">
		<h2>课程选择</h2>
		<div class="panel panel-primary">
			
			<div class="panel-body">
				<table class="table">
					<!-- <caption class="name">用户信息</caption> -->
					<thead>
						<tr>
							<th>No.</th>
							<th>课程编号</th>
							<th>课程名</th>
							<th>教师</th>
							<th>类别</th>
							<th>学分</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="list" items="${list}" varStatus="status">
						<tr class="ho">
							<td>${status.index+1}</td>
							<td>${list.course.no}</td>
							<td>${list.course.name}</td>
							<td>${list.course.user.name}</td>
							<td>${list.course.category}</td>
							<td>${list.course.credit}</td>
							<td><c:if test="${list.remark.equals('已选')}">
									<a href="javascript:;" class="bb">已选</a>
								</c:if>
								<c:if test="${list.remark.equals('选择')}">
								<a class="xz bb">选择</a>
								</c:if>
								<input type="hidden" value="${list.id}" class="hide">
							</td>
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
		$(".xz").click(function () {
			var id=$(this).siblings(".hide").val();
			$(this).html("已选");
			$(this).removeClass("xz");
			 $.get("/student/xz",{id:id},function () {

			})
		});
	})
</script>
</html>