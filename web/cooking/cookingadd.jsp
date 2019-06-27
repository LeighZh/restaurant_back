<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--jquery文件-->
<script type="text/javascript" src="../easyui/jquery.min.js"></script>
<!--easyui核心文件-->
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<!--皮肤文件-->
<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css" />
<!--图标文件-->
<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css" />
</head>
<body>
<form id="66" method="Post">
	<li>输入要新增的菜系名称:</li>
		<input id="dd" name="name">
	</form>
	<input type="button" id="btn" value="提交">
<!-- 	<a id="bn" href="../index.jsp" class="easyui-linkbutton" data-options="iconCls:'icon-search'">提交</a>  
 -->
<script type="text/javascript">
	$('#dd').validatebox({    
	    required: true
	});     
	  $('#btn').bind('click', function(){    
		  $("#66").form("submit",{
		  	  url: "../CookingServlet?select=add",
		  		onSubmit: function(){    
		  		return $("#66").form("validate");   
		    },
		       success:function(msg){
		    	   /* var list=JSON.parse(msg); */
		    	   console.log(msg);
		    	   if(msg==null||msg==""){
		    		   $("#dg").datagrid("reload");
				    	$("#add").dialog("close");
		    	   }else {
		    		   alert("菜系名重复");
		    		   $("#dg").datagrid("reload");
				    	$("#add").dialog("close");
		    	   }   
		       }
		  })  
	  });     
	   
</script>
</body>
</html>