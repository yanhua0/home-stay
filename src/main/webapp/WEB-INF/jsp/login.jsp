<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/static/css/login/login.css">
	<style>
		body{
			width:100%;
			height:100%;
			background-image: url("/static/image/login/6.jpg");
			background-size: cover;
			background-repeat: no-repeat;
		}
		#add{

		}
	</style>

</head>
<body>
	<div id="tit"><p>民宿预定系统</p></div>
	<div id="container" class="container">
		<div class="panel panel-info">
			<div class="panel-heading text-center">
				<h3 class="panel-title">
					用户登录
				</h3>
			</div>
			<div class="panel-body">
				<h4 style="color:red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${error}</h4>
				<form action="subLogin" method="post" name="f">
					<div class="tab"><label for="">账&nbsp;号:</label><input class="text" id="username" type="text" name="userCode" placeholder="请输入账号" required ></div>
					<div class="tab"><label for="">密&nbsp;码:</label><input class="text" id="password" type="password" name="password" placeholder="请输入密码" required ><a id="open" class="glyphicon glyphicon-eye-open"></a></div>
					<br>
					<input type="submit"  id="log" value="登录" class="btn btn-primary logi">
				</form>
				<div class="reg"><a href="#" data-toggle="modal" data-target="#add" id="add2">注册新账号</a></div>
				</div>
			</div>
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
						注册用户
					</h4>
				</div>
				<div class="modal-body" id="addUser">
					<form class="form-group" method="post" action="#" id="form">
						<div class="form-group">
							<label for="">用户名</label>
							<input type="text" class="form-control" name="userCode" placeholder="请输入用户名"
								   id="time">
						</div>
						<div class="form-group">
							<label for="">密码</label>
							<input type="password" class="form-control" name="password" placeholder="请输入密码">
						</div>
						<div class="form-group">
							<label for="">姓名</label>
							<input type="password" class="form-control" name="name" placeholder="请输入姓名">
						</div>
						<div class="form-group">
							<label for="">角色</label>
							<select id="cate" class="form-control" name="roleId">
								<option value="2">房主</option>
								<option value="3">租户</option>
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
	</body>
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
	$(function () {
		$("#open").click(function () {
			if ($("#password").attr("type") == "password") {
				$("#password").attr("type", "text");
				$("#open").removeClass("glyphicon glyphicon-eye-open");
				$("#open").addClass("glyphicon glyphicon-eye-close");
			} else {
				$("#password").attr("type", "password");
				$("#open").removeClass("glyphicon glyphicon-eye-close");
				$("#open").addClass("glyphicon glyphicon-eye-open");
			}
		})
	})
</script>
	<script>
		function check(){
			var s1=$("#pass").val();
			var s2=$("#opass").val();
			if(s1!=s2){
				return false;
			}else{
				return true;
			}
		}
		$(function(){
			$("#user").bind('input propertychange', function() {
				$("#ureg").show(500);
				console.log("11");
			})
			$("#opass").bind('input propertychange', function() {
				var s1=$("#pass").val();
				var s2=$("#opass").val();
				if(s1!=s2){
					$("#ureg1").show(500);
				}else{
					$("#ureg1").hide(500);
				}
			})
			$("#add2").click(function(){
				$("#ureg1").hide();
				var s1=$("#pass").val();
				var s2=$("#opass").val();
				if(s1!=s2){
					$("#ureg1").show(500);
				}else{
					$("#ureg1").hide(500);
				}

			})
			$("#con").click(function () {
				var formObject = {};
				var formArray =$("#form").serializeArray();
				$.each(formArray,function(i,item){
					formObject[item.name] = item.value;
				});
				console.log(formObject);
				  $.ajax({
						type:"POST",
						url:"/api/home/users",
						data:JSON.stringify(formObject),
						dataType:"text",
						cache:false,
						contentType:"application/json",
						success:function (data) {
							alert("添加成功!!");
							$("#qu").click();
						},
						error:function (data) {
							console.log(data);
							alert(data.responseJSON.message);
						}
					});

			});
		});
	</script>
	</html>