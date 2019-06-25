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
	<!-- <input type="text" style="position:absolute;top:15px;left:100px;z-index: 2"  placeholder="请输入用户名" id='likeName'> -->
	<table id="dg"></table>
	<div id="add"></div>
	<script type="text/javascript">
		$('#dg').datagrid({
		    url:'/restaurant/IndextSelectServlet?fame=菜系',
		    columns:[[
		        {field:'i',checkbox:true},
		        {field:'vegetableId',title:'菜系id',hidden:true},
		        {field:'菜系名称',title:'菜系名称',width:"33%",editor : {
					type:'validatebox',
					options : {
						required: true,
						missingMessage:"该项为必填项！"
					}
				}},
		        {field:'增加时间',title:'增加时间',width:"33%"},
		    ]],
		    pagination:true,
		    rownumbers : true,
		    onDblClickCell : function(index,field,value){//修改
		    	$(this).datagrid('selectRow',index);//选择一行
				 var checkeds = $('#dg').datagrid('getSelected');//返回第一个被选中的行
				 console.info(checkeds);
				 $(this).datagrid('beginEdit', index);//开始编辑行。
			 var editor = $(this).datagrid('getEditor', {index:index,field:field});//获取指定行的编辑器
				  if(editor!=null){
					 $(editor.target).focus();
					  $(editor.target).blur(function(){
						 	$.ajax({
								url : "/restaurant/MyDeleteServlet",
								type : "POST",
								data : {
									judge:"Typealter",
									usName : editor.target.val(),
									id : checkeds.vegetableId
								},
								success : function(result) {
									$('#dg').datagrid('reload');
								}
							});  
							$('#dg').datagrid('endEdit', index);//结束编辑行。
					  })
				 }else{
					 alert("选你麻痹！");
					$('#dg').datagrid('reload'); 
				 }
		    }
		});
		
		
		$('#dg').datagrid({
			toolbar: [{//增加按钮
				iconCls : 'icon-add',
				handler : function(){
					addMenu();
				}
			},{
				iconCls: 'icon-remove',
				 handler: function(){
					var allData = $("#dg").datagrid("getSelections");
					var array = new Array();
					for(var i in allData){
						array[i]=allData[i].vegetableId;
					}
					$.ajax({
						url: "/restaurant/CookingServlet?select=delete",
						data:"name="+array,
						success:function(message){
							$('#dg').datagrid('reload');
						}
					})
				}
				
			},{
				iconCls: 'icon-help',
				handler: function(){alert('选择左边的框可以进行删除')}
			}]
		});
		
		function addMenu(){
			$("#add").dialog({
			    title: '菜系增加',
			    width: 500,
			    height: 300,
			    closed: false,
			    cache: false,
			    href: '/restaurant/cooking/cookingadd.jsp',
			    modal: true 
			});
		}
	</script>
</body>
</html>