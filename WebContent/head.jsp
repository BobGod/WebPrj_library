<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	Object Object = request.getSession().getAttribute("user");
	if (null == Object) {
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<title>图书管理系统</title>

		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
			media="screen">
		<link href="bootstrap/css/bootstrap-responsive.min.css"
			rel="stylesheet" media="screen">
		<link href="assets/styles.css" rel="stylesheet" media="screen">
		<link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
		<!--[if lt IE 9]>
      		<script src="http://cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
    	<![endif]-->
		<script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js">
</script>
		<script type="text/javascript">
/**
 * 根目录
 */
var context = "<%=request.getContextPath()%>" + "/";
</script>

	</head>

	<body>
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a class="btn btn-navbar" data-toggle="collapse"
						data-target=".nav-collapse"> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> </a>
					<a class="brand" href="index.jsp">图书管理系统</a>
					<div class="nav-collapse collapse">

						<ul class="nav">
							<li>
								<a href="index.jsp">图书管理</a>
							</li>

							<c:if test="${user.type==0}">
								<li>
									<a href="user_manage.jsp">用户管理</a>
								</li>
							</c:if>

						</ul>

						<ul class="nav pull-right">
							<li>
								<a role="button" class="dropdown-toggle" data-toggle="dropdown">
									<i class="icon-user"></i> ${user.username} </a>
							</li>
							<li>
								<a id="logoutBtn"> 退出 </a>
							</li>
						</ul>

					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</div>



		<div class="container-fluid">
			<div class="row-fluid">