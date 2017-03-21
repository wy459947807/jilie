
function updateStatus(id,status){
    var dataInfo = {};
    dataInfo['id'] = id;
    dataInfo['status'] = status;
    var reInfo = getTemplate(dataInfo, "/user/updatestatus");
    layer_tip(reInfo,1);//提示框
}

//删除选中项
function deleteAll() {
    layer.confirm('确认要删除吗？', function (index) {
        var ids = {};
        $("input[name='id[]']:checked").each(function (index, element) {
            ids[index] = $(this).val();
        });

        var dataInfo = {};
        dataInfo['id'] = ids;
        var reInfo = getTemplate(dataInfo, "/user/delete");
        layer_tip(reInfo,1);//提示框
    });
}

//删除指定用户
function deleteUser(id) {
    layer.confirm('确认要删除吗？', function (index) {
        var dataInfo = {};
        dataInfo['id'] = id;
        var reInfo = getTemplate(dataInfo, "/user/delete");
        layer_tip(reInfo,1);//提示框
    });
}

///添加用户


