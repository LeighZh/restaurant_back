$(document).ready(function () {
    $('#dg').datagrid({
        url:'/userServlet?judge=afterQuery',
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
});





function like(){
    $('#dg').datagrid({
        url: "/userServlet",
        queryParams: {
            judge: 'likeAfterQuery',
            likeName: $("#likeName").val()
        }
    })
}