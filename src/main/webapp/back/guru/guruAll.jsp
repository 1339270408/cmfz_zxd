<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    $(function () {
        $("#guruDg").datagrid({
            url: "${pageContext.request.contextPath}/guru/findPage",
            pagination: true,
            fit: true,
            fitColumns: true,
            pageSize: 15,
            pageList: [10, 15, 20, 25, 30, 35],
            toolbar: '#top1',
            ctrlSelect:true,
            columns: [[
                {title: 'che', field: 'che', checkbox: true,},
                {title: "ID", field: 'id', width: 120, align: 'center', hidden: true,},
                {title: "名字", field: 'name', width: 120, align: 'center',},
                {title: "图片", field: 'headPic', width: 120, align: 'center',},
                {title: "描述", field: 'sex', width: 120, align: 'center',},
            /* {
               title: "操作", field: 'options', width: 200, align: 'center',
             formatter: function (value, row, index) {
                   return "<a href='#' class='del' onclick=\"delRow1('"+row.id+"')\"  data-options=\"iconCls:'icon-remove',plain:true,\">删除</a>" +
                       "<a href='#' class='del' onclick=\"motifyRow1('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true,\">更新</a>";
               }
                },*/
            ]],
            onLoadSuccess: function () {
                $(".del").linkbutton();
            },
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.headPic + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>时间: ' + rowData.name + '</p>' +
                    '<p>状态: ' + rowData.sex + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        });
    });

    //        删除单行数据
  /*  function delRow1(id) {
        $.post("${pageContext.request.contextPath}/guru/removeGuru",
            {id: id}, function (result) {
                //刷新数据表格
                $("#guruDg").datagrid('reload');
            });
    }*/


    //批量删除
    function delBannerDilog1() {
        var rows = $("#guruDg").datagrid('getSelections');
        if (rows.length <= 0) {
            alert("至少选择一行");
           // $.messager.show({title: '提示', msg: '至少选择一行',});
        } else {
            var ids = [];
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
            }
            console.log(ids);
            $.ajax({
                url: "${pageContext.request.contextPath}/guru/removeP",
                type: 'POST',
                traditional: true,//传递数据类型的数据时必须设置这个属性为true
                data: {ids: ids},
                success: function (result) {
                    //消息提示
                    $.messager.show({title: '提示', msg: "删除成功!!!"});
                    //刷新datagrid
                    $("#guruDg").datagrid('reload');
                },
                error: function (result) {
                    //消息提示
                    $.messager.show({title: '提示', msg: result.message});
                    //刷新数据
                    $("#guruDg").datagrid('reload');
                },
            });
        }
    }


    //    添加
    function addBannerDialog1() {
        $("#addGuru").dialog({
            buttons: [
                {
                    text: '保存',
                    iconCls: 'icon-save',
                    handler: function () {
                        //保存用户信息
                        $("#addGuruForm").form('submit', {
                            url: '${pageContext.request.contextPath}/guru/addguru',
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
                                $("#addGuru").dialog('close');
                                //刷新数据
                                $("#guruDg").datagrid('reload');
                            }
                        });
                    }
                },
                {
                    text: '关闭',
                    iconCls: 'icon-clear',
                    handler: function () {
                        //关闭窗口
                        $("#addGuru").dialog('close');
                    }
                },
            ]
        });
    }

    // 修改
    function motifyBannerDialog1() {
        var rows = $("#guruDg").datagrid('getSelections');
        if(rows.length<=null || rows.length>1){
            alert("请选择一行");
            //$.messager.show({title:'提示', msg:'请选择一行',});
        }else {
                var ids=[];
                for (var i=0;i<rows.length;i++){
                    ids.push(rows[i].id);
                }
            $("#motifyGuru").dialog({
                href:'${pageContext.request.contextPath}/back/guru/motifyGuru.jsp?id='+ids,
                buttons: [
                    {
                        text: '更新',
                        iconCls: 'icon-save',
                        handler: function () {
                            //保存用户信息
                            $("#motifyGuruForm").form('submit', {
                                url: '${pageContext.request.contextPath}/guru/motifyGuru',
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
                                    $("#motifyGuru").dialog('close');
                                    //刷新数据
                                    $("#guruDg").datagrid('reload');
                                }
                            });
                        }
                    },
                    {
                        text: '关闭',
                        iconCls: 'icon-clear',
                        handler: function () {
                            //关闭窗口
                            $("#motifyGuru").dialog('close');
                        }
                    },
                ]
            });
        }

    }

</script>

<table id="guruDg">
    <%--表格的工具栏--%>
    <div id="top1">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="delBannerDilog1()"
           data-options="iconCls:'icon-clear',plain:true,">批量删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="addBannerDialog1()"
           data-options="iconCls:'icon-add',plain:true,">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="motifyBannerDialog1()"
           data-options="iconCls:'icon-add',plain:true,">更新</a>
    </div>

    <%--添加窗口--%>
    <div id="addGuru" data-options="href:'${pageContext.request.contextPath}/back/guru/addGuru.jsp',
                                    width:600,height:400,title:'保存用户',draggable:false,
                 iconCls:'icon-save',">

    </div>

    <%--修改的窗口--%>
    <div id="motifyGuru" data-options="width:600,height:400,title:'修改用户',draggable:false,
                                    iconCls:'icon-edit',">

    </div>


</table>