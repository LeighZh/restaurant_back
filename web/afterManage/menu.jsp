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
	<input type="text" style="position:absolute;top:15px;left:100px;z-index: 2"  placeholder="请输入用户名" id='likeName'>
	<table id="dg"></table>
	<div id="add"></div>
	<script type="text/javascript">
		$('#dg').datagrid({
		    url:'/restaurant/MenuServlet?judge=afterQuery',
		    //int menuId, String menuName, double price, int vegetableId, String picture, int userCount, int good,
			//int general, int bad, Date addTime,String menuType,String describe
		    columns:[[
		    	{field:'i',checkbox:true},
		        {field:'menuId',hidden:true},
		        {field:'menuName',title:'菜谱名称',width:"9%"},
		        {field:'price',title:'价格',width:"9%"},
		        {field:'vegetableName',title:'菜系名',width:"9%",editor :{
					type:'combobox',
					options : {
						url:'../CookingServlet?select=select',
						method:'post',
						textField:"vegetableName",
						valueField:'vegetableName',
						required: true,
						missingMessage:"该项为必填项！"
					}
				}},
		        {field:'picture',title:'图片',width:"9%"},
		        {field:'userCount',title:'用户点击量',width:"9%"},
		        {field:'good',title:'好评数量',width:"9%"},
		        {field:'general',title:'一般数量',width:"9%"},
		        {field:'bad',title:'差评数量',width:"9%"},
		        {field:'addTime',title:'增加时间',width:"9%"},
		        {field:'menuType',title:'菜谱类型',width:"9%"},
		        {field:'describe',title:'菜谱描述',width:"9%"}
		    ]],
		    pagination:true,
		    onDblClickCell : function(index,field,value){//修改
		    	$(this).datagrid('selectRow',index);//选择一行
				 var checkeds = $('#dg').datagrid('getSelected');//返回第一个被选中的行
				 $(this).datagrid('beginEdit', index);//开始编辑行。
				 var editor = $(this).datagrid('getEditor', {index:index,field:field});//获取指定行的编辑器
				 if(editor!=null){
					
					// $(editor.target).focus();
					/*  $(editor.target).bind(,function(){
						 alert("1111");
						  $('#dg').datagrid('endEdit', index);//结束编辑行。
						  $('#dg').datagrid('reload'); 
					 }); */
					 console.log(checkeds.menuId);
					 $(editor.target).combobox({
						 onChange:function(newValue,oldValue){
							 console.info(newValue);//修改框值
							 $.ajax({
								url : "/restaurant/MenuServlet",
								type : "POST",
								data : {
									judge:"mod",
									usName : newValue,
									id : checkeds.menuId
								},
								success : function(result) {
									$('#dg').datagrid('reload');
								}
							});  
					 	 }
					 }) 
				 }else{
					 alert("选你麻痹！");
					$('#dg').datagrid('reload'); 
				 }
		 }
		});
		 
			
		$('#dg').datagrid({
			toolbar: [{
				iconCls: 'icon-add',
				handler: function(){
					addMenu();
				}
			},{
				iconCls: 'icon-remove',
				 handler: function(){
					var allData = $("#dg").datagrid("getSelections");
					var array = new Array();
					for(var i in allData){
						array[i]=allData[i].menuId;
					}
					$.ajax({
						url: "/restaurant/MenuServlet?judge=delete",
						data:"name="+array,
						success:function(message){
							$('#dg').datagrid('reload');
						}
					})
				}
				
			},{
				iconCls: 'icon-search'
			}]
		});
		$("#likeName").keyup(function(){
			like();
		})
		
		function like(){
			$('#dg').datagrid({
				url: "/restaurant/MenuServlet",
				queryParams: {
					judge: 'likeAfterQuery',
					likeName: $("#likeName").val()
				}
			})
		}
		
		function addMenu(){
			$("#add").dialog({    
			    title: '菜谱增加',    
			    width: 500,    
			    height: 300,    
			    closed: false,    
			    cache: false,    
			    href: 'menuAdd.jsp',    
			    modal: true 
			});
		}
	</script>
</body>
</html>