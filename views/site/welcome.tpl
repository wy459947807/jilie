﻿<!DOCTYPE HTML>
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
        <link rel="stylesheet" type="text/css" href="/static/h-ui/css/H-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/H-ui.admin.css" />
        <link rel="stylesheet" type="text/css" href="/lib/Hui-iconfont/1.0.7/iconfont.css" />
        <link rel="stylesheet" type="text/css" href="/lib/icheck/icheck.css" />
        <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/skin/default/skin.css" id="skin" />
        <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/style.css" />
        <!--[if IE 6]>
        <script type="text/javascript" src="/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
        <script>DD_belatedPNG.fix('*');</script>
        <![endif]-->
        <title>我的桌面</title>
    </head>
    <body>
        <div class="page-container">
            <p class="f-20 text-success">欢迎 <span><!--{$userInfo.nickname}--></span> 登录系统！</p>
            <p>登录次数：<!--{$userInfo.login_num}--> </p>
            <p>上次登录IP：<!--{$userInfo.login_ip}-->  上次登录时间：<!--{$userInfo.login_time}--></p>
            <table class="table table-border table-bordered table-bg mt-20">
                <thead>
                    <tr>
                        <th colspan="2" scope="col">服务器信息</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th width="30%">服务器计算机名</th>
                        <td><span id="lbServerName"><!--{$serviceInfo.serverName}--></span></td>
                    </tr>
                    <tr>
                        <td>服务器IP地址</td>
                        <td><!--{$serviceInfo.serverAddr}--></td>
                    </tr>
                    <tr>
                        <td>服务器域名</td>
                        <td><!--{$serviceInfo.httpHost}--></td>
                    </tr>
                    <tr>
                        <td>服务器端口 </td>
                        <td><!--{$serviceInfo.serverPort}--></td>
                    </tr>
                    <tr>
                        <td>服务器版本 </td>
                        <td><!--{$serviceInfo.serverSoftware}--></td>
                    </tr>
                    <tr>
                        <td>本文件所在文件夹 </td>
                        <td><!--{$serviceInfo.documentRoot}--></td>
                    </tr>
                    <tr>
                        <td>服务器操作系统 </td>
                        <td><!--{$serviceInfo.operateSystem}--></td>
                    </tr>
                    <tr>
                        <td>系统所在文件夹 </td>
                        <td><!--{$serviceInfo.SystemRoot}--></td>
                    </tr>
                    <tr>
                        <td>服务器脚本超时时间 </td>
                        <td><!--{$serviceInfo.executionTime}-->秒</td>
                    </tr>
                    <tr>
                        <td>服务器的语言种类 </td>
                        <td><!--{$serviceInfo.language}--></td>
                    </tr>
                    <tr>
                        <td>php 版本 </td>
                        <td><!--{$serviceInfo.phpVersion}--></td>
                    </tr>
                    <tr>
                        <td>服务器当前时间 </td>
                        <td><!--{$serviceInfo.serverTime}--></td>
                    </tr>
                    <tr>
                        <td>服务器IE版本 </td>
                        <td><!--{$serviceInfo.browserVersion}--></td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
        <footer class="footer mt-20">
            <div class="container">
                <p>感谢jQuery、layer、laypage、Validform、UEditor、My97DatePicker、iconfont、Datatables、WebUploaded、icheck、highcharts、bootstrap-Switch<br>
                    Copyright &copy;2015 H-ui.admin v2.3 All Rights Reserved.<br>
                    本后台系统由<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架">H-ui前端框架</a>提供前端技术支持</p>
            </div>
        </footer>
        <script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script> 
        <script type="text/javascript" src="/static/h-ui/js/H-ui.js"></script> 
        <script>
            var _hmt = _hmt || [];
            (function () {
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