<div id="changePasswordBox">
    <script type="text/html" id="changePassword_tpl">
    <article class="page-container">
        <form  id="changePassword" action="/" method="post" class="form form-horizontal">
            <input type="hidden" name="id" value="{{data.id}}"/>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>账户：</label>
                <div class="formControls col-xs-8 col-sm-9"> {{data.nickname}} </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新密码：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="password" id="password" class="input-text {required:true,messages:{required:'请填写密码！'} }" autocomplete="off" placeholder="不修改请留空" name="" >
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="password" name="password"  class="input-text {equalTo: '#password',messages:{equalTo:'两次密码不一致！'} }" autocomplete="off" placeholder="不修改请留空" id="new-password2">
                </div>
            </div>
            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                    <input class="btn btn-primary radius" onclick="changePassword()" type="button" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
                </div>
            </div>
        </form>
    </article>
    </script>
</div>