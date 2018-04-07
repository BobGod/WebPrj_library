<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
 
%>
 </div>
            <hr>
            
            <footer>
            <center>
                <p>&copy; 图书管理系统 </p>
            </center>
            </footer>
        </div>
        <!--/.fluid-container-->
        

        
        <script src="vendors/jquery-1.9.1.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/layer/layer.js"></script>
		
		<script src="js/Validform_v5.3.2_min.js"   charset="utf-8"  type="text/javascript" ></script>
		
		<script src="vendors/datatables/js/jquery.dataTables.min.js"></script>
        <script src="assets/DT_bootstrap.js"></script>
        <script type="text/javascript">
        
        $(function() {
            
        $("#logoutBtn").click(function(){
			        	
			        	//询问框
			layer.confirm('确定要退出吗？', {
				title:'提示',
			  btn: ['确定','取消'] //按钮
			}, function(){
				
				var url =context+"controller?oper=logout";
				$.post(url, null, function(data) {
			if (data) {
				window.location.reload();
			}  
			});
				
			   
			}, function(){
			  layer.closeAll();
			});
        	

        });
        
        });
        
        
        function deleteOne(id,type){
        	
			layer.confirm('确定要删除吗？', {
				title:'提示',
			  btn: ['确定','取消'] //按钮
			}, function(){
				var url =context+"controller?oper=delete";
				var param={
					id:id,
					type:type
				}
				$.post(url, param, function(data) {
			if (data) {
				data=JSON.parse(data);
				if(data.code==0){
					window.location.reload();
				}else{
					layer.msg(data.msg);
				}
			}  
			});
				
			   
			}, function(){
			  layer.closeAll();
			});
        	

        
        	
        }
        
         
 
		</script>
        
        
        
       

 
