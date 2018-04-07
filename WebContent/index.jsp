<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.lang.*" %>
<%@ page import="com.dao.*,com.model.*" %>
<%
BookDao bookDao=new BookDao();
List<Book> list=bookDao.getList();
request.setAttribute("list",list);
 
%>
<%@include file="head.jsp" %>


<div class="span12" id="content">
                   

                     <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">图书列表</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                   <div class="table-toolbar">
                                      <div class="btn-group">
                                         <a href="book_form.jsp"><button class="btn btn-success">添加图书<i class="icon-plus icon-white"></i></button></a>
                                      </div>
                                      
                                   </div>
                                    
                                    
                                    
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                                        <thead>
                                            <tr>
                                                <th>图书名称</th>
                                                <th>图书类型</th>
                                                <th>出版社</th>
                                                <th>条形码</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                    <c:forEach var="c" items="${list}" varStatus="status">
											  
											   
											   <tr class="odd gradeX">
                                                <td> ${c.name }</td>
                                                <td> ${c.type }</td>
                                                <td> ${c.press }</td>
                                                <td> ${c.code }</td>
                                                <td>
                                                
											<a class="btn btn-info btn-mini" href="book_form.jsp?id=${c.id }" >修改</a>
											<button class="btn btn-danger btn-mini" onclick="deleteOne('${c.id }','book')">删除</button>

                                                
                                                </td>
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





<%@include file="footer.jsp" %>
 <script>
        $(function() {
            
        });
</script>


    </body>

</html>
