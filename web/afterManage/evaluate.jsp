<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!--jquery文件-->
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
<!--easyui核心文件-->
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<!--对应的语言包-->
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
<!--皮肤文件-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<!--图标文件-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<body>
	<table id="dg"></table>
	<script type="text/javascript">
		$('#dg').datagrid({
		    url:'/IndextSelectServlet?fame=用户评价查询',
		    columns:[[
		        {field:'评价菜谱名',title:'评价菜谱名',hidden:true},
		        {field:'评价内容',title:'评价内容',width:"33%"},
		        {field:'评价时间',title:'评价内容',width:"33%"},
		    ]],
		    pagination:true,
		    rownumbers : true
		});
		
	</script>
</body>
</html>