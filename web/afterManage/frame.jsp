
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
	<div id="cc" class="easyui-layout" fit=true>
    	<div class="top" data-options="region:'north',title:'菜鸟餐厅'" style="height:100px;background-color: #999;font-size: 40px">菜鸟餐厅后台管理系统</div> 
    	<div class="left" data-options="region:'west',title:'West'" style="width:250px;">
    		<ul id="tt"></ul>
    	</div>
    	<div id="center" class="easyui-tabs" data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;">
    		
    	</div>
	</div>
	<script type="text/javascript">
		$('#tt').tree({
		   url:'/TreeServlet',
		   onClick:function(node){
			   var judge = $("#center").tabs("exists",node.text);
			   if(judge){
				  $('#center').tabs('select', node.text);
			   }else{
				   	if(node.text == "消费管理"){
				    	 $('#center').tabs('add',{
				    	   content:"<iframe src='consumption.jsp' width='99%' height='99%'></iframe>",
				    	   	title:node.text,
				    	 	border:true,
				    	 	tabWidth:100,
				    		closable:true,
				    	 	pill:true,
				    	});
					}else if(node.text == "订单管理"){
				    	$('#center').tabs('add',{
				    	   content:"<iframe src='/indent.jsp' width='99%' height='99%'></iframe>",
				    	   	title:node.text,
				    	 	border:true,
				    	 	tabWidth:100,
				    		closable:true,
				    	 	pill:true,
					    });
					}else if(node.text == "菜谱管理"){
				    	$('#center').tabs('add',{
				    	    content:"<iframe src='menu.jsp' width='99%' height='99%'></iframe>",
				    	   	title:node.text,
				    	 	border:true,
				    	 	tabWidth:100,
				    		closable:true,
				    	 	pill:true,
					    });
					}else if(node.text == "菜系管理"){
				    	$('#center').tabs('add',{
				    	   content:"<iframe src='vegetableType.jsp' width='99%' height='99%'></iframe>",
				    	   	title:node.text,
				    	 	border:true,
				    	 	tabWidth:100,
				    		closable:true,
				    	 	pill:true,
					    });
					}else if(node.text == "类型管理"){
				    	$('#center').tabs('add',{
				    	  //  content:"<iframe src='userManage.jsp' width='99%' height='99%'></iframe>",
				    	   	title:node.text,
				    	 	border:true,
				    	 	tabWidth:100,
				    		closable:true,
				    	 	pill:true,
					    });
					}else if(node.text == "用户评价"){
						  console.info(node.text);
				    	$('#center').tabs('add',{
				    	   content:"<iframe src='evaluate.jsp' width='99%' height='99%'></iframe>",
				    	   	title:node.text,
				    	 	border:true,
				    	 	tabWidth:100,
				    		closable:true,
				    	 	pill:true,
					    });
					}else if(node.text == "用户查询"){
				    	$('#center').tabs('add',{
				    	    content:"<iframe src='userManage.jsp' width='99%' height='99%'></iframe>",
				    	   	title:node.text,
				    	 	border:true,
				    	 	tabWidth:100,
				    		closable:true,
				    	 	pill:true,
					    });
					}else if(node.text == "餐桌管理"){
				    	$('#center').tabs('add',{
				    	   	content:"<iframe src='/board.jsp' width='99%' height='99%'></iframe>",
				    	   	title:node.text,
				    	 	border:true,
				    	 	tabWidth:100,
				    		closable:true,
				    	 	pill:true,
					    });
					}
			   }
		    }
		});
	</script>
</body>
</html>