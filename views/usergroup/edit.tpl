﻿<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
    <head>
        <!--{include file="public/head.tpl"}-->

        <title>新建网站角色 - 管理员管理 - H-ui.admin v2.3</title>
        <meta name="keywords" content="H-ui.admin v2.3,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
        <meta name="description" content="H-ui.admin v2.3，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
    </head>
    <body>
        <article class="page-container">
            <form id="editUserGroup" class="form form-horizontal"  action="/usergroup/edit" enctype="multipart/form-data" method="post">
                <input type="hidden" name="id" value="<!--{$userGroupInfo.id}-->" />
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>分组名称：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" name="name" value="<!--{$userGroupInfo.name}-->"  class="input-text" placeholder="" datatype="*4-16" nullmsg="分组名称不能为空"  errormsg="分组名称格式不正确">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-3">备注：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" name="remark" value="<!--{$userGroupInfo.remark}-->"  id="" class="input-text"  placeholder="">
                    </div>
                </div>
                
                
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-3">网站角色：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <dl class="permission-list">
                            <dt>
                                <label>
                                    <input type="checkbox" value="" name="user-Character-0" id="user-Character-0">
                                    资讯管理</label>
                            </dt>
                            <dd>
                                <dl class="cl permission-list2">
                                    <dt>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-0-0" id="user-Character-0-0">
                                            栏目管理</label>
                                    </dt>
                                    <dd>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-0-0-0" id="user-Character-0-0-0">
                                            添加</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-0-0-0" id="user-Character-0-0-1">
                                            修改</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-0-0-0" id="user-Character-0-0-2">
                                            删除</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-0-0-0" id="user-Character-0-0-3">
                                            查看</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-0-0-0" id="user-Character-0-0-4">
                                            审核</label>
                                        
                                    </dd>
                                </dl>
                                <dl class="cl permission-list2">
                                    <dt>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-0-1" id="user-Character-0-1">
                                            文章管理</label>
                                    </dt>
                                    <dd>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-0-1-0" id="user-Character-0-1-0">
                                            添加</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-0-1-0" id="user-Character-0-1-1">
                                            修改</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-0-1-0" id="user-Character-0-1-2">
                                            删除</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-0-1-0" id="user-Character-0-1-3">
                                            查看</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-0-1-0" id="user-Character-0-1-4">
                                            审核</label>
                                        
                                    </dd>
                                </dl>
                            </dd>
                        </dl>
                        <dl class="permission-list">
                            <dt>
                                <label>
                                    <input type="checkbox" value="" name="user-Character-0" id="user-Character-1">
                                    用户中心</label>
                            </dt>
                            <dd>
                                <dl class="cl permission-list2">
                                    <dt>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-1-0" id="user-Character-1-0">
                                            用户管理</label>
                                    </dt>
                                    <dd>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-0">
                                            添加</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-1">
                                            修改</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-2">
                                            删除</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-3">
                                            查看</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-4">
                                            审核</label>
                                    </dd>
                                </dl>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div class="row cl">
                    <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                        <button type="button"  onclick="$('#editUserGroup').submit()"  class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
                    </div>
                </div>
            </form>
        </article>

       <!--{include file="public/foot.tpl"}-->
       <script type="text/javascript" src="/js/usergroup.js"></script>
      
    </body>
</html>