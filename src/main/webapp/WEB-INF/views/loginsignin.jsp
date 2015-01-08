
<!DOCTYPE HTML>
<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="template/tag.jsp"%>
<html>
<%@ include file="template/htmlHead.jsp"%>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<a href="/web" class="navbar-brand"> Taurus and Chicken</a>

		<div class="collapse navbar-collapse navHeaderCollapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="active">
				<li class="active"><a href="/web">首页</a></li>
				<li class="active"><a href="<c:url value = "/loginsignin"/>">登录／注册
								</a></li>
				
				

				
			</ul>
		</div>
	</div>
</div>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">用户登录</h3>
					</div>
					<div class="panel-body">
						<form name='loginForm'
			action="<c:url value='/j_spring_security_check' />" method='POST'>
							<p>
								<label for="username">E-mail</label> <input id="username"
									name="username" type="text" class="form-control" />
							</p>
							<p>
								<label for="password">密码</label> <input id="password"
									name="password" type="password" class="form-control" />
							</p>
							<input type="submit" value="登录" class="btn btn-danger" />
						</form>
					</div>
				</div>

			</div>
			<div class="col-md-2"></div>
			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">用户注册</h3>
					</div>
					<div class="panel-body">
						<form action=" <c:url value='/reg' />" method="get">
						<p>
							<label for="nickname">昵称</label> <input id="nickname"
								name="nickname" type="text" class="form-control" />
						</p>
						<p>
							<label for="username">E-mail</label> <input id="username"
								name="username" type="text" class="form-control" />
						</p>
						<p>
							<label for="password">密码</label> <input id="password"
								name="password" type="password" class="form-control" />
						</p>
						<p id = "check"></p>
						<p>
							<label for="repassword">密码确认</label> <input
								id="repassword" name="repassword" type="password"
								class="form-control" />
						</p>
						<input type="submit" value="注册" class="btn btn-danger" /> </form>
					</div>
				</div>

			</div>
			<div class="col-md-2"></div>
		</div>
	</div>



</body>
</html>