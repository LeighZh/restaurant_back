<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<input type="text" style="position:absolute;top:15px;left:60px;z-index: 2"  placeholder="请输入用户名" id='likeName'>
	<table id="dg"></table>
	<script type="text/javascript">
		$('#dg').datagrid({
		    url:'/restaurant/userServlet?judge=afterQuery',
		    columns:[[
		        {field:'userName',title:'用户名',width:"16%"},
		        {field:'createTime',title:'创建时间',width:"16%"},
		        {field:'lastTime',title:'最后一次登录时间',width:"16%"},
		        {field:'money',title:'消费总金额',width:"16%"},
		        {field:'number',title:'预留号码',width:"16%"},
		        {field:'status',title:'用户状态',width:"16%"}
		    ]],
		    pagination:true,
		    rownumbers : true
		});
		$('#dg').datagrid({
			toolbar: [{
				iconCls: 'icon-search'
			}]
		});
		$("#likeName").keyup(function(){
			like();
		}) 
		
		function like(){
			$('#dg').datagrid({
				url: "/restaurant/userServlet",
				queryParams: {
					judge: 'likeAfterQuery',
					likeName: $("#likeName").val()
				}
			})
		}
	</script>
</body>
</html>