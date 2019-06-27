$(document).ready(function () {
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
                        content:"<iframe src='/afterManage/menu.jsp' width='99%' height='99%'></iframe>",
                        title:node.text,
                        border:true,
                        tabWidth:100,
                        closable:true,
                        pill:true,
                    });
                }else if(node.text == "菜系管理"){
                    $('#center').tabs('add',{
                        content:"<iframe src='/afterManage/vegetableType.jsp' width='99%' height='99%'></iframe>",
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
                        content:"<iframe src='/restaurant/user/userManage.html' width='99%' height='99%'></iframe>",
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
});
