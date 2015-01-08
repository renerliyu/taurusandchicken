
<!DOCTYPE HTML>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>

<head>
<meta name="viewpoint"
	content="width = device-width, initial-scale = 1.0">

<%@ page contentType="text/html;charset=UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="resources/css/styles.css" />
<link type="text/css" rel="stylesheet"
	href="resources/css/annotorious.css" />
<title>Taurus and Chicken</title>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<a href="/web" class="navbar-brand"> Taurus and Chicken</a>

		<div class="collapse navbar-collapse navHeaderCollapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="active">
				<li class="active"><a href="/web">首页</a></li>
				<c:choose>
					<c:when test="${username== 'anonymousUser' }">
						<li class="active"><a href="<c:url value = "/loginsignin"/>">登录／注册
								</a></li>
					</c:when>
					<c:when test="${username== '' }">
						<li class="active"><a href="<c:url value = "/loginsignin"/>">登录／注册
								</a></li>
					</c:when>
					<c:when test="${username != 'anonymousUser' }">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">您好,${username }<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="viewaddress">我的地址簿</a></li>
								<li><a href="idphoto">我的身份证</a></li>
								<li class="divider"></li>
								<li><a href="vieworder">我的订单</a></li>
								<li class="divider"></li>
								<li><a href="<c:url value="j_spring_security_logout"/>">登出</a></li>
							</ul></li>
					</c:when>

				</c:choose>
				<sec:authorize access="hasRole('ROLE_SHIPER')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">发货人 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value = "/viewallorder"/>">订单管理</a></li>

						</ul></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">管理员<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value = "/editorpicture"/>">Picture</a></li>
							<li><a href="<c:url value = "/editorquestion"/>">Question</a></li>
							<li><a href="#">Answer</a></li>
						</ul></li>
				</sec:authorize>

				
			</ul>
		</div>
	</div>
</div>

	<c:forEach items="${orderlist }" var="order">
		<div class="container">
			<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
			<table class="table table-striped">
				<tbody>
				<thead>
      <tr>
          <th colspan=2 >订单号：${order.shiporderid }</th>
         <th >状态：${order.status }</th>
      </tr>
   </thead>
					<tr>
						<th colspan=3>第一行：${order.address.line1 }</th>
					</tr>
					<tr>
						<th colspan=3>第二行：${order.address.line2 }</h>
					</tr>
					<tr>
						<td>省：${order.address.province }</td>
						<td>城市：${order.address.city }</td>
						<td>邮编：${order.address.zip }</td>
					</tr>
					<tr>
						<td>收件人：${order.address.idphoto.name }</td>
						<td>电话：${order.address.phone }</td>
						<td></td>
					</tr>
					<tr>
						<th colspan=3>备注：${order.address.memo }</th>
					</tr>
				</tbody>
				</table>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</c:forEach>


	<div class="navbar navbar-default navbar-fixed-bottom">
		<div class="container">
			<div class="panel-body">

					<form action="<c:url value='/neworder'/>" method="GET">
						<div class="form-group">
							<div class="col-md-1">
							<label   for="orderid" >订单号</label> </div>
							<div class="col-md-9">
							<input id="orderid"
								name="orderid" type="text" class="form-control" />
								</div>
								<div class="col-md-2">
							<input type="submit" value = "添加新订单" class="btn btn-danger btn-lg pull-right" /></div>
						</div>
						 
					</form>
				</div>

			
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/annotorious.min.js"></script>

</body>
</html>