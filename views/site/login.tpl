<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/lib/html5.js"></script>
    <script type="text/javascript" src="/lib/respond.min.js"></script>
    <script type="text/javascript" src="/lib/PIE_IE678.js"></script>
    <![endif]-->
    <link href="/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
    <link href="/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>后台登录 - H-ui.admin v2.5</title>
    <meta name="keywords" content="H-ui.admin v2.5,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
    <meta name="description" content="H-ui.admin v2.3，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
    <input type="hidden" id="TenantId" name="TenantId" value="" />
    <div class="header"></div>
    <div class="loginWraper">
      <div id="loginform" class="loginBox">
         <form id="login_form"  class="form form-horizontal" action="" enctype="multipart/form-data" method="post">
          <div class="row cl">
            <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
            <div class="formControls col-xs-8">
              <input class="input-text size-L {required:true,messages:{required:'请填写用户名！'}}" name="username" type="text"  placeholder="账户">
            </div>
          </div>
          <div class="row cl">
            <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
            <div class="formControls col-xs-8">
              <input  class="input-text size-L {required:true,messages:{required:'请填写密码！'}}" name="password" type="password" placeholder="密码">
            </div>
          </div>
          <div class="row cl">
            <div class="formControls col-xs-8 col-xs-offset-3">
              <input class="input-text size-L {required:true,messages:{required:'请填写验证码！'}}" name="code" required="true" type="text" placeholder="验证码"  value="" style="width:150px;">
              <img height="40" id="captcha" src="/site/captcha" onclick="document.getElementById('captcha').src='/site/captcha?id='+Math.random()"> 
              <a id="kanbuq" href="javascript:;"  onclick="document.getElementById('captcha').src='/site/captcha?id='+Math.random()">看不清，换一张</a> 
            </div>
          </div>
          <div class="row cl">
            <div class="formControls col-xs-8 col-xs-offset-3">
              <label for="online">
                <input type="checkbox" name="remember" id="remember" value="">
                使我保持登录状态</label>
            </div>
          </div>
          <div class="row cl">
            <div class="formControls col-xs-8 col-xs-offset-3">
              <input name="" type="button" onclick="login()" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
              <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
            </div>
          </div>
        </form>
      </div>
    </div>
    <div class="footer">Copyright 你的公司名称 by H-ui.admin.v2.5</div>
    <script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="/lib/jquery.form/jquery.form.min.js"></script>
    <script type="text/javascript" src="/lib/jquery/1.9.1/jquery.metadata.js"></script>
    <script type="text/javascript" src="/lib/jquery.validation/1.9.0/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/lib/jquery.validation/1.9.0/validate-methods.js"></script>
    <script type="text/javascript" src="/lib/jquery.validation/1.9.0/messages_zh.js"></script>
    <script type="text/javascript" src="/lib/jquery.tmpl/jquery.tmpl.min.js"></script>
    <script type="text/javascript" src="/lib/layer/2.1/layer.js"></script> 
    <script type="text/javascript" src="/lib/laypage/1.2/laypage.js"></script> 
    <script type="text/javascript" src="/lib/My97DatePicker/WdatePicker.js"></script> 
    <script type="text/javascript" src="/lib/public/common.js"></script> 
    <script type="text/javascript" src="/lib/public/commonp.plug.js"></script> 
    <script type="text/javascript" src="/static/h-ui/js/H-ui.js"></script> 
    
    <script>
        //登录操作
        function login(){
            var reInfo = ajaxFormSubmit("#login_form",'/site/login');
            if(reInfo){
                layer_tip(reInfo);//提示框
                if(reInfo.status==200){
                    setTimeout("goPage('/site/index')",1000); 
                }
            } 
            //console.log(reInfo);
        }
    </script>
    
    <script>
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
          var s = document.getElementsByTagName("script")[0]; 
          s.parentNode.insertBefore(hm, s);
        })();
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
    </script>
</body>
</html>
