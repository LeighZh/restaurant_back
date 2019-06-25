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
				<!-- {field:'menuName',title:'菜谱名称',width:"9%"},
		        {field:'price',title:'价格',width:"9%"},
		        {field:'vegetableName',title:'菜系名',width:"9%"},
		        {field:'picture',title:'图片',width:"9%"},
		        {field:'userCount',title:'用户点击量',width:"9%"},
		        {field:'good',title:'好评数量',width:"9%"},
		        {field:'general',title:'一般数量',width:"9%"},
		        {field:'bad',title:'差评数量',width:"9%"},
		        {field:'addTime',title:'增加时间',width:"9%"},
		        {field:'menuType',title:'菜谱类型',width:"9%"},
		        {field:'describe',title:'菜谱描述',width:"9%"} -->
	<form id="form" method="POST" action="/restaurant/MenuServlet?judge=add">
		<table>
			<tr>
				<td>菜谱名称：</td>
				<td><input  id="menuName" name="menuName" class="easyui-validatebox"  data-options="required:true"></td>
			</tr>
			<tr>
				<td>价格：</td>
				<td><input id="price" name="price" class="easyui-validatebox"  data-options="required:true"></td>
			</tr>
			<tr>
				<td>菜系名称：</td>
				<td><input id="combo"></td>
			</tr>
			<tr>
				<td>菜谱类型：</td>
				<td><input id="combo2"></td>
			</tr>
			<tr>
				<td>菜系描述：</td>
				<td><input  id="describe" name="menuName" class="easyui-validatebox"  data-options="required:true"></td>
			</tr>
			<tr>
				<!-- <td colspan="2"><input type="file" ></td> -->
			</tr>
		</table>
	</form>
	<div>
		<input type="submit" id="submit" value="提交">
		<input type="reset" id="reset">
	</div>
	<script type="text/javascript">
		$("#combo").combobox({
			required:true,
			limitToList:true,
			url:'../CookingServlet?select=select',
			method:'post',
			textField:"vegetableName",
			valueField:'vegetableName'
		});
		$("#combo2").combobox({
			required:true,
			limitToList:true,
			valueField: 'label',
			textField: 'value',
			data: [{
				label: '小吃',
				value: '小吃'
			},{
				label: '酒水',
				value: '酒水'
			},{
				label: '主食',
				value: '主食'
			}]

		});
		$("#submit").click(function(){
			$.ajax({
			    type: "POST",
			    url: "/restaurant/MenuServlet",
			    data: "judge=add&menuname="+$("#menuName").val()+"&price="+$("#price").val()+"&cook="+$("#combo").val()+"&menutype="+$("#combo2").val()+"&describe="+$("#describe").val(),
			    success:function(data){
			    	$("#dg").datagrid("reload");
			    	$("#add").dialog("close");
			    }
			});
		})
	</script>
</body>
</html>