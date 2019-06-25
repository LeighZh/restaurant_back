<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<!--easyui核心文件-->
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<!--对应的语言包-->
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<!--皮肤文件-->
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css" />
<!--图标文件-->
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
<script type="text/javascript" src="ttl/FuncTion.js"></script><!-- 功能js -->
<title>管理系统</title>
</head>
<body class="easyui-layout">
	<div id="cc" class="easyui-layout" style="width:100%;height:760px;">   
    <div data-options="region:'north',title:'导航栏',split:true" style="height:100px;background-color: #999;font-size: 40px;" >菜鸟餐厅后台管理</div>      
    <div data-options="region:'west',title:'菜单',split:true" style="height:100%;width:200px;"> 
    <ul id="function"></ul>
     </div>
    <div data-options="region:'center',title:'显示'" style="padding:5px;background:#eee;">
   		<div id="show" class="easyui-tabs" data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;"> 			 
		</div>
    </div>
</div> 
</body>

</html>