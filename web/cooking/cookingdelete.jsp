<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<li>输入要的菜系名称:</li>
		<input id="dd" name="name">
	</form>
	<a id="btn" href="../index.jsp" class="easyui-linkbutton" data-options="iconCls:'icon-search'">提交</a>  
</body>
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
		       success:function(){
		    	   alert("增加成功");
		       }
		  })  
	  });     
	   
</script>
</html>