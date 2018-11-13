<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    $(function () {
        $("#articleDg").datagrid({
            url: "${pageContext.request.contextPath}/article/findPage",
            pagination:true,
            fitColumns: true,
            fit: true,
            pageSize: 15,
            pageList: [10, 15, 20, 25, 30, 35],
            ctrlSelect:true,
            toolbar: '#top2',
            ctrlSelect:true,
            columns: [[
                {title: 'che', field: 'che', checkbox: true,},
                {title: "ID", field: 'id', width: 120, align: 'center', hidden: true,},
                {title: "大师", field: 'name', width: 120, align: 'center',
                        formatter:function (value,row,index) {
                            if (row.guru){
                                return row.guru.name;
                            } else {
                                return value;
                            }
                        }},
                {title: "名称", field: 'title', width: 120, align: 'center',},
                {title: "图片", field: 'imgPath', width: 120, align: 'center',},
                {title: "描述", field: 'content', width: 120, align: 'center',},
                {title: "时间", field: 'publishDate', width: 120, align: 'center',},
                /*{
                    title: "操作", field: 'options', width: 200, align: 'center',
                    formatter: function (value, row, index) {
                        return "<a href='#' class='del' onclick=\"delRow('"+row.id+"')\"  data-options=\"iconCls:'icon-remove',plain:true,\">删除</a>" +
                            "<a href='#' class='del' onclick=\"motifyRow('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true,\">更新</a>";
                    }
                },*/
            ]],
          /*  onLoadSuccess: function () {
                $(".del").linkbutton();
            },*/
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>时间: ' + rowData.publishDate + '</p>' +
                    '<p>状态: ' + rowData.title + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        });
    });

  //        删除单行数据
    /*  function delRow(id) {
        $.post("/banner/removeBanner",
            {id: id}, function (result) {
                //刷新数据表格
                $("#bannerDg").datagrid('reload');
            });
    }*/


    //批量删除
    function delBannerDilog2() {
        var rows = $("#articleDg").datagrid('getSelections');
        if (rows.length <= 0) {
            alert("至少选择一行");
            //$.messager.show({title: '提示', msg: '至少选择一行',});
        } else {
            var ids = [];
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
            }
            console.log(ids);
            $.ajax({
                url: "${pageContext.request.contextPath}/article/removeP",
                type: 'POST',
                traditional: true,//传递数据类型的数据时必须设置这个属性为true
                data: {ids: ids},
                success: function (result) {
                    //消息提示
                    $.messager.show({title: '提示', msg: "删除成功!!!"});
                    //刷新datagrid
                    $("#articleDg").datagrid('reload');
                },
                error: function () {
                    //消息提示
                    $.messager.show({title: '提示', msg: "删除失败!!!"});
                    //刷新数据
                    $("#articleDg").datagrid('reload');
                },
            });
        }
    }


    //    添加
    function addBannerDialog2() {
        $("#addArticle").dialog({
            buttons: [
                {
                    text: '保存',
                    iconCls: 'icon-save',
                    handler: function () {
                        //保存用户信息
                        $("#addActicleForm").form('submit', {
                            url: '${pageContext.request.contextPath}/article/addArticle',
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
                                $("#addArticle").dialog('close');
                                //刷新数据
                                $("#articleDg").datagrid('reload');
                            }
                        });
                    }
                },
                {
                    text: '关闭',
                    iconCls: 'icon-clear',
                    handler: function () {
                        //关闭窗口
                        $("#addArticle").dialog('close');
                    }
                },
            ]
        });
    }

    // 修改
    function motifyBannerDialog2() {
        var rows = $("#articleDg").datagrid('getSelections');
        if(rows.length<=null || rows.length>1){
            alert("请选择一行");
           // $.messager.show({title: '提示', msg: '请选择一行',});

        }else {
            var ids = [];
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
            }
            console.log(ids);
            $("#motifyArticle").dialog({
                href:'${pageContext.request.contextPath}/back/article/motifyActicle.jsp?id='+ids,
                buttons: [
                    {
                        text: '更新',
                        iconCls: 'icon-save',
                        handler: function () {
                            //保存用户信息
                            $("#motifyActicleForm").form('submit', {
                                url: '${pageContext.request.contextPath}/article/motifyArticle',
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
                                    $("#motifyArticle").dialog('close');
                                    //刷新数据
                                    $("#articleDg").datagrid('reload');
                                }
                            });
                        }
                    },
                    {
                        text: '关闭',
                        iconCls: 'icon-clear',
                        handler: function () {
                            //关闭窗口
                            $("#motifyArticle").dialog('close');
                        }
                    },
                ]
            });
        }

    }

</script>

<table id="articleDg">
    <%--表格的工具栏--%>
    <div id="top2">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="delBannerDilog2()"
           data-options="iconCls:'icon-clear',plain:true,">批量删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="addBannerDialog2()"
           data-options="iconCls:'icon-add',plain:true,">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="motifyBannerDialog2()"
           data-options="iconCls:'icon-add',plain:true,">更新</a>
    </div>

    <%--添加窗口--%>
    <div id="addArticle" data-options="href:'${pageContext.request.contextPath}/back/article/addArticle.jsp',
                                    width:600,height:400,title:'保存文章',draggable:false,
                 iconCls:'icon-save',">

    </div>

    <%--修改的窗口--%>
    <div id="motifyArticle" data-options="width:600,height:400,title:'修改文章',draggable:false,
                                    iconCls:'icon-edit',">

    </div>


</table>