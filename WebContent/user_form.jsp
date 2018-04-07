<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page
	import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.lang.*"%>
<%@ page import="com.dao.*,com.model.*"%>
<%
	UserDao userDao = new UserDao();
	String id = request.getParameter("id");
	request.setAttribute("id", id);
	if (id != null && !id.equals("")) {
		User user = userDao.getById(id);
		request.setAttribute("userTemp", user);

	}
%>
<%@include file="head.jsp"%>
<div class="span12" id="content">

	<!-- validation -->
	<div class="row-fluid">
		<!-- block -->
		<div class="block">
			<div class="navbar navbar-inner block-header">
				<div class="muted pull-left">
					用户
					<c:if test="${empty id}">添加
                                </c:if>
					<c:if test="${not empty id}">编辑
                                </c:if>
				</div>
			</div>
			<div class="block-content collapse in">
				<div class="span12">
					<!-- BEGIN FORM-->
					<form action="controller" id="form_1" class="form-horizontal">
						<fieldset>
							<div class="control-group">
								<label class="control-label">
									用户名称：
									<span class="required">*</span>
								</label>
								<div class="controls">
									<input type="hidden" name="oper" value="userForm" />
									<input type="hidden" name="id" value="${id}" />
									<input type="text" name="username" value="${userTemp.username}"
										<c:if test="${not empty id}">
  									disabled="disabled"
                                </c:if>
										class="span7 m-wrap" datatype="*1-36 " nullmsg="不能为空" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									用户密码：
									<span class="required">*</span>
								</label>
								<div class="controls">
									<input type="text" name="password" value="${userTemp.password}"
										class="span7 m-wrap" datatype="*1-36" nullmsg="不能为空" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									用户类型：
									<span class="required">*</span>
								</label>
								<div class="controls">

									<c:if test="${empty id}">普通用户
  								 
                                </c:if>

									<c:if test="${userTemp.type==0}">
  									管理员
  									</c:if>
									<c:if test="${userTemp.type==1}">
  									普通用户
  									</c:if>
								</div>
							</div>

							<div class="form-actions">
								<button type="submit" class="btn btn-primary">
									提交
								</button>
								&nbsp;&nbsp;&nbsp;
								<button class="btn" onclick="history.go(-1)">
									返回
								</button>
							</div>
						</fieldset>

					</form>
					<!-- END FORM-->
				</div>
			</div>
		</div>
		<!-- /block -->
	</div>
	<!-- /validation -->


</div>





<%@include file="footer.jsp"%>
<script>
$(function() {

	$("#form_1").Validform( {
		tiptype : 4,
		ajaxPost : true,
		callback : function(data) {
			if (data.code == 1) {
				layer.msg(data.msg);
			} else {
				window.location.href = "user_manage.jsp";
			}
		}
	});

});
</script>


</body>

</html>
