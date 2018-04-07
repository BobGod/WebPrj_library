<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page
	import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.lang.*"%>
<%@ page import="com.dao.*,com.model.*"%>
<%
	BookDao bookDao = new BookDao();
	String id = request.getParameter("id");
	request.setAttribute("id", id);
	if (id != null && !id.equals("")) {
		Book book = bookDao.getById(id);
		request.setAttribute("book", book);

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
					图书
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
									条形码：
									<span class="required">*</span>
								</label>
								<div class="controls">
									<input type="hidden" name="oper" value="bookForm" />
									<input type="hidden" name="id" value="${id}" />
									<input type="text" name="code" value="${book.code}"
										class="span7 m-wrap" datatype="n1-36 " nullmsg="不能为空" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									图书名称：
									<span class="required">*</span>
								</label>
								<div class="controls">
									<input type="text" name="name" value="${book.name}"
										class="span7 m-wrap" datatype="*1-36" nullmsg="不能为空" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									图书类型：
									<span class="required">*</span>
								</label>
								<div class="controls">
									<input type="text" name="type" value="${book.type}"
										class="span7 m-wrap" datatype="*1-36" nullmsg="不能为空" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									作者：
									<span class="required">*</span>
								</label>
								<div class="controls">
									<input type="text" name="author" value="${book.author}"
										class="span7 m-wrap" datatype="*1-36" nullmsg="不能为空" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									出版社：
									<span class="required">*</span>
								</label>
								<div class="controls">
									<input type="text" name="press" value="${book.press}"
										class="span7 m-wrap" datatype="*1-36" nullmsg="不能为空" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									价格(元)：
									<span class="required">*</span>
								</label>
								<div class="controls">
									<input type="text" name="price" value="${book.price}"
										class="span7 m-wrap" datatype="n1-36" nullmsg="不能为空" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									页码：
									<span class="required">*</span>
								</label>
								<div class="controls">
									<input type="text" name="page" value="${book.page}"
										class="span7 m-wrap" datatype="n1-36" nullmsg="不能为空" />
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
				window.location.href = "index.jsp";
			}
		}
	});

});
</script>


</body>

</html>
