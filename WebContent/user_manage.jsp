<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page
	import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.lang.*"%>
<%@ page import="com.dao.*,com.model.*"%>
<%
	UserDao userDao = new UserDao();
	List<User> list = userDao.getList();
	request.setAttribute("list", list);
%>
<%@include file="head.jsp"%>


<div class="span12" id="content">


	<div class="row-fluid">
		<!-- block -->
		<div class="block">
			<div class="navbar navbar-inner block-header">
				<div class="muted pull-left">
					用户列表
				</div>
			</div>
			<div class="block-content collapse in">
				<div class="span12">
					<div class="table-toolbar">
						<div class="btn-group">
							<a href="user_form.jsp"><button class="btn btn-success">
									添加用户
									<i class="icon-plus icon-white"></i>
								</button>
							</a>
						</div>

					</div>



					<table cellpadding="0" cellspacing="0" border="0"
						class="table table-striped table-bordered" id="example">
						<thead>
							<tr>
								<th>
									用户名称
								</th>
								<th>
									用户密码
								</th>
								<th>
									用户类型
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${list}" varStatus="status">


								<tr class="odd gradeX">
									<td>
										${c.username }
									</td>
									<td>
										${c.password }
									</td>
									<c:if test="${c.type==1 }">
										<td>
											普通用户
										</td>
									</c:if>
									<c:if test="${c.type==0 }">
										<td>
											管理员
										</td>
									</c:if>

									<c:if test="${c.type==1 }">
										<td>
											<a class="btn btn-info btn-mini"
												href="user_form.jsp?id=${c.id }">修改</a>
											<button class="btn btn-danger btn-mini"
												onclick="deleteOne('${c.id }','user')">
												删除
											</button>

										</td>
									</c:if>
									<c:if test="${c.type==0 }">
										<td>
											<a class="btn btn-info btn-mini"
												href="user_form.jsp?id=${c.id }">修改</a>
											<button class="btn  btn-mini">
												不能删除
											</button>
										</td>

									</c:if>




								</tr>
							</c:forEach>



						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- /block -->
	</div>
</div>





<%@include file="footer.jsp"%>
<script>
$(function() {

});
</script>


</body>

</html>
