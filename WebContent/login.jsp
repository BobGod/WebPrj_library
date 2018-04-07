<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page
	import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.lang.*"%>
<%@ page import="com.dao.*,com.model.*"%>
<%
	Object Object = request.getSession().getAttribute("user");
	if (null != Object) {
		response.sendRedirect("index.jsp");
	}
	String message = "";
	String username = (String) request.getParameter("username");
	String password = (String) request.getParameter("password");
	if (username != null) {
		UserDao userDao = new UserDao();
		User user = userDao.getUserByUsername(username);
		if (user != null) {
			if(user.getPassword().equals(password)){
				request.getSession().setAttribute("user", user);
				response.sendRedirect("index.jsp");
			}else{
				message = "<span class='Validform_checktip Validform_wrong'>用户名或密码不正确</span>";
			}
		} else {
			message = "<span class='Validform_checktip Validform_wrong'>用户名或密码不正确</span>";
		}
	}
%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport"
			content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>登录</title>
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

		<script src="vendors/jquery-1.9.1.min.js">
</script>
		<script src="bootstrap/js/bootstrap.min.js">
</script>

		<script src="js/Validform_v5.3.2_min.js" charset="utf-8"
			type="text/javascript">
</script>

		<script src="vendors/datatables/js/jquery.dataTables.min.js">
</script>
		<script src="assets/DT_bootstrap.js">
</script>

	</head>
	<body id="login">
		<div class="container">

			<form class="form-signin" action="">
				<center>
					<h2 class="form-signin-heading">
						图书管理系统
					</h2>
				</center>
				<input type="text" class="input-block-level" name="username"
					datatype="*1-10" nullmsg="账号不能为空" placeholder="账号">
				<input type="password" class="input-block-level" name="password"
					datatype="*1-10" nullmsg="密码不能为空" placeholder="密码">

				<center>
					<button class="btn btn-large btn-primary" type="submit">
						登录
					</button>
				</center>
				<%=message%>
			</form>

		</div>
		<!-- /container -->


		<script>

$(function() {

	$(".form-signin").Validform( {
		tiptype : 4
	});

});
</script>

	</body>
</html>

