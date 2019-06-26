<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>后台登录</title>




  <link rel="stylesheet" href="front/css/supersized.css">
  <link rel="stylesheet" href="front/css/login.css">
  <link href="front/css/bootstrap.min.css" rel="stylesheet">
  <script src="front/js/jquery-1.8.2.min.js"></script>
  <script type="text/javascript" src="front/js/jquery.form.js"></script>
  <script type="text/javascript" src="front/js/tooltips.js"></script>
</head>

<body>

<div class="page-container">
  <div class="main_box">
    <div class="login_box">
      <div class="login_logo">
        后台登录
      </div>

      <div class="login_form">
        <form action="####" id="login_form" method="post">
          <div class="form-group">
            <label for="j_username" class="t">账   号：</label>
            <input id="email" value="" name="email" type="text" class="form-control x319 in"
                   autocomplete="off">
          </div>
          <div class="form-group">
            <label for="j_password" class="t">密　码：</label>
            <input id="password" value="" name="password" type="password"
                   class="password form-control x319 in">
          </div>
          <div class="form-group space">
            <label class="t"></label>
            <button type="button"  id="submit_btn"
                    class="btn btn-primary btn-lg">&nbsp;登&nbsp;录&nbsp </button>
            <input type="reset" value="&nbsp;重&nbsp;置&nbsp;" class="btn btn-default btn-lg">
          </div>
        </form>
      </div>
    </div>
    <div class="bottom">Copyright &copy; 2018 <a href="#">系统登陆</a></div>
  </div>
</div>

<!-- Javascript -->

<script src="front/js/supersized.3.2.7.min.js"></script>
<script src="front/js/scripts.js"></script>
<script type="text/javascript">
    jQuery(function($){

        $.supersized({

            // Functionality
            slide_interval     : 4000,    // Length between transitions
            transition         : 1,    // 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
            transition_speed   : 1000,    // Speed of transition
            performance        : 1,    // 0-Normal, 1-Hybrid speed/quality, 2-Optimizes image quality, 3-Optimizes transition speed // (Only works for Firefox/IE, not Webkit)

            // Size & Position
            min_width          : 0,    // Min width allowed (in pixels)
            min_height         : 0,    // Min height allowed (in pixels)
            vertical_center    : 1,    // Vertically center background
            horizontal_center  : 1,    // Horizontally center background
            fit_always         : 0,    // Image will never exceed browser width or height (Ignores min. dimensions)
            fit_portrait       : 1,    // Portrait images will not exceed browser height
            fit_landscape      : 0,    // Landscape images will not exceed browser width

            // Components
            slide_links        : 'blank',    // Individual links for each slide (Options: false, 'num', 'name', 'blank')
            slides             : [    // Slideshow Images
                {image : 'front/images/backgrounds/0.jpg'},
                {image : 'front/images/backgrounds/1.jpg'},
                {image : 'front/images/backgrounds/2.jpg'},
                {image : 'front/images/backgrounds/3.jpg'}
            ]

        });

    });


    document.onkeydown = function(e){
        if($(".bac").length==0)
        {
            if(!e) e = window.event;
            if((e.keyCode || e.which) == 13){
                var obtnLogin=document.getElementById("submit_btn")
                obtnLogin.focus();
            }
        }
    }

    $(function(){
        //提交表单
        $('#submit_btn').click(function(){
            show_loading();
            if($('#email').val() == ''){
                show_err_msg('账号还没填呢！');
                $('#email').focus();
            }else if($('#password').val() == ''){
                show_err_msg('密码还没填呢！');
                $('#password').focus();
            }else {
                //ajax提交表单，#login_form为表单的ID。 如：$('#login_form').ajaxSubmit(function(data) { ... });
                $.ajax({
                    url: "/userServlet",
                    data:"judge=afterRegister&name="+$("#email").val()+"&password="+$("#password").val(),
                    success:function(message){
                        //if(message == "true"){
                        show_msg('登录成功，  正在为您跳转...','/afterManage/frame.jsp');
                        // }else{
                        // 	show_err_msg('账号或密码错误，登录失败！');
                        // 	$('#email').focus();
                        // }
                    }
                })
            }
        });
    });


</script>
</body>
</html>