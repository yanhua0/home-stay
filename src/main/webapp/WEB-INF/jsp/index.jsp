<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>民宿预定系统</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<style>
	#left{
		background: #222324;
		width:220px;
		float: left;
		height:100%;

	}
	.nav-sidebar li a{
		height:50px;
		display:block;
		color:#8e8e8e;
		padding-left: 20px;
		line-height: 30px;
	}
	.nav-sidebar li{

	}
	.nav-sidebar li a:hover{
		background:#000;
	}
	.fa-chevron-right{  
		float:right;
		line-height: 30px;
	}
	
	.nav>li>a:focus{
		text-decoration: none;
		background:#000;
	}
	.add{
		background:#000;
	}

	#frame{
		margin-left: 220px;
		margin-right: 0;
		width: auto;
		height:auto;
	}
	iframe{
		width:100%;
		height:100%;
		padding-top: 50px;
	}
</style>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="javascript:;">民宿预定系统</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" data-toggle="dropdown">欢迎你,${sessionScope.users.name}(${sessionScope.users.roleName})<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
							<c:if test="${sessionScope.user.rolename.equals('student')}">
							<li role="presentation">
								<a role="menuitem" tabindex="-1" href="/student/findYx"  target="content" onclick="info(this)">&nbsp;已选课程</a>
							</li>
							</c:if>
							<li role="presentation">
								<a role="menuitem" tabindex="-1" href="/api/home/reset"  target="content">&nbsp;修改密码</a>
							</li>

						</ul>
					</li>
					<li><a href="/infor" target="content">返回首页</a></li>
					<li><a href="/api/home/logout" target="_top">退出系统</a></li>
				</ul>
			</div>
		</div>
	</nav>	
	<div class="container-fluid" id="left">
		<div class="row">

			<ul class="nav nav-sidebar">
				<br>
				<br><br>
				<li><a href="/api/home/home/stay/page" target="content" class="add">民宿查看<i class="fa fa-chevron-right"></i></a></li>
				<%--<c:if test="${sessionScope.users.roleId==1}">--%>
					<li><a href="/api/home/users/info" target="content">房主租户信息管理<i class="fa fa-chevron-right"></i></a></li>
				<%--</c:if>--%>
				<li><a href="/api/home/room/page" target="content">预定房间<i class="fa fa-chevron-right"></i></a></li>


				<li><a href="/student/findGrade" target="content">民宿信息管理<i class="fa fa-chevron-right"></i></a></li>
				<li><a href="/student/findAssess" target="content">房间信息管理<i class="fa fa-chevron-right"></i></a></li>

			</ul>
		</div>
	</div>
	<div id="frame">
		<iframe src="/api/home/home/stay/page" frameborder="0" name="content"></iframe>
	</div>
	

</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
	$(function(){
		$(".nav-sidebar li a").click(function(){
			$(".nav-sidebar li a").removeClass("add");
			$(this).addClass("add");
		})
	})
</script>
</html>