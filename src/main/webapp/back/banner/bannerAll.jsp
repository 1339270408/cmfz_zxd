<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    $(function () {
        $("#bannerDg").datagrid({
            url: "${pageContext.request.contextPath}/banner/findPage",
            pagination: true,
            fit: true,
            fitColumns: true,
            pageSize: 15,
            pageList: [10, 15, 20, 25, 30, 35],
            toolbar: '#top',
            ctrlSelect:true,
            columns: [[
                {title: 'che', field: 'che', checkbox: true,},
                {title: "ID", field: 'id', width: 120, align: 'center', hidden: true,},
                {title: "名称", field: 'title', width: 120, align: 'center',},
                {title: "图片", field: 'imgPath', width: 120, align: 'center',},
                {title: "描述", field: 'desca', width: 120, align: 'center',},
                {title: "状态", field: 'status', width: 120, align: 'center',},
                {title: "时间", field: 'date', width: 120, align: 'center',},
            /* {
                 title: "操作", field: 'options', width: 200, align: 'center',
                 formatter: function (value, row, index) {
                     return "<a href='#' class='del' onclick=\"delRow('"+row.id+"')\"  data-options=\"iconCls:'icon-remove',plain:true,\">删除</a>" +
                         "<a href='#' class='del' onclick=\"motifyRow('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true,\">更新</a>";
                 }
                },*/
            ]],
            onLoadSuccess: function () {
                $(".del").linkbutton();
            },
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>时间: ' + rowData.date + '</p>' +
                    '<p>状态: ' + rowData.status + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        });
    });

    //        删除单行数据
    function delRow(id) {
        $.post("${pageContext.request.contextPath}/banner/removeBanner",
            {id: id}, function (result) {
                //刷新数据表格
                $("#bannerDg").datagrid('reload');
            });
    }


    //批量删除
    function delBannerDilog() {
        var rows = $("#bannerDg").datagrid('getSelections');
        if (rows.length <= 0) {
            $.messager.show({title: '提示', msg: '至少选择一行',});
        } else {
            var ids = [];
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
            }
            console.log(ids);
            $.ajax({
                url: "${pageContext.request.contextPath}/banner/removeP",
                type: 'POST',
                traditional: true,//传递数据类型的数据时必须设置这个属性为true
                data: {ids: ids},
                success: function (result) {
                    //消息提示
                    $.messager.show({title: '提示', msg: "删除成功!!!"});
                    //刷新datagrid
                    $("#bannerDg").datagrid('reload');
                },
                error: function () {
                    //消息提示
                    $.messager.show({title: '提示', msg: "删除失败!!!"});
                    //刷新数据
                    $("#bannerDg").datagrid('reload');
                },
            });
        }
    }


    //    添加
    function addBannerDialog() {
        $("#addBanner").dialog({
            buttons: [
                {
                    text: '保存',
                    iconCls: 'icon-save',
                    handler: function () {
                        //保存用户信息
                        $("#addBannerForm").form('submit', {
                            url: '${pageContext.request.contextPath}/banner/addBanner',
                            success: function (result) {
                                //转换js对象
                                var parsejson = $.parseJSON(result);
                                if (parsejson.success) {
                                    //提示信息
                                    $.messager.show({title: '提示', msg: '添加成功',});
                                } else {
                                    //提示信息 msg:parsejson.message
                                    $.messager.show({title: '提示', msg: parsejson.message,});
                                }
                                //关闭窗口
                                $("#addBanner").dialog('close');
                                //刷新数据
                                $("#bannerDg").datagrid('reload');
                            }
                        });
                    }
                },
                {
                    text: '关闭',
                    iconCls: 'icon-clear',
                    handler: function () {
                        //关闭窗口
                        $("#addBanner").dialog('close');
                    }
                },
            ]
        });
    }

    // 修改
    function motifyBannerDialog() {
        var datagridDg = $("#bannerDg").datagrid('getSelections');
        if(datagridDg.length<=0 || datagridDg.length>1){
            $.messager.show({title:'提示',msg:'请选择一行',});
        }
        else {
            var ids=[];
            for (var i = 0; i < datagridDg.length; i++) {
               ids.push(datagridDg[i].id);
            }
            $("#motifyBanner").dialog({
                href:'${pageContext.request.contextPath}/back/banner/motify.jsp?id='+ids,
                buttons: [
                    {
                        text: '更新',
                        iconCls: 'icon-save',
                        handler: function () {
                            //保存用户信息
                            $("#motifyFrom").form('submit', {
                                url: '${pageContext.request.contextPath}/banner/motifyBanner',
                                success: function (result) {
                                    //转换js对象
                                    var parsejson = $.parseJSON(result);
                                    if (parsejson.success) {
                                        //提示信息
                                        $.messager.show({title: '提示', msg: '更新成功',});
                                    } else {
                                        //提示信息 msg:parsejson.message
                                        $.messager.show({title: '提示', msg: parsejson.message,});
                                    }
                                    //关闭窗口
                                    $("#motifyBanner").dialog('close');
                                    //刷新数据
                                    $("#bannerDg").datagrid('reload');
                                }
                            });
                        }
                    },
                    {
                        text: '关闭',
                        iconCls: 'icon-clear',
                        handler: function () {
                            //关闭窗口
                            $("#motifyBanner").dialog('close');
                        }
                    },
                ]
            });
        }

    }

</script>

<table id="bannerDg">
    <%--表格的工具栏--%>
    <div id="top">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="delBannerDilog()"
           data-options="iconCls:'icon-clear',plain:true,">批量删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="addBannerDialog()"
           data-options="iconCls:'icon-add',plain:true,">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="motifyBannerDialog()"
           data-options="iconCls:'icon-edit',plain:true,">更新</a>
    </div>

    <%--添加窗口--%>
    <div id="addBanner" data-options="href:'${pageContext.request.contextPath}/back/banner/addBanner.jsp',
                                    width:600,height:400,title:'保存用户',draggable:false,
                 iconCls:'icon-save',">

    </div>

        <%--修改的窗口--%>
        <div id="motifyBanner" data-options="width:600,height:400,title:'修改用户',draggable:false,
                                    iconCls:'icon-edit',">

        </div>


</table>