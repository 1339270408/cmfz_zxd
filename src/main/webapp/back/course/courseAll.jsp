<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    $(function () {
        $("#courseDg").datagrid({
            url: "${pageContext.request.contextPath}/course/findPage",
            pagination:true,
            fitColumns: true,
            fit: true,
            rownumbers:true,
            pageSize: 15,
            pageList: [10, 15, 20, 25, 30, 35],
            ctrlSelect:true,
            toolbar: '#top9',
            ctrlSelect:true,
            columns: [[
                {title: "aa", field: 'aa',checkbox:true,},
                {title: "名称", field: 'title', width: 120, align: 'center',},
                {title: "状态", field: 'marking', width: 120, align: 'center',},
                {title: "时间", field: 'creatTime', width: 120, align: 'center',},
            ]],
        });
    });




    //批量删除
    function delBannerDilog9() {
        var rows = $("#courseDg").datagrid('getSelections');
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
                url: "${pageContext.request.contextPath}/course/removeP",
                type: 'POST',
                traditional: true,//传递数据类型的数据时必须设置这个属性为true
                data: {ids: ids},
                success: function (result) {
                    //消息提示
                    $.messager.show({title: '提示', msg: "删除成功!!!"});
                    //刷新datagrid
                    $("#courseDg").datagrid('reload');
                },
                error: function () {
                    //消息提示
                    $.messager.show({title: '提示', msg: "删除失败!!!"});
                    //刷新数据
                    $("#courseDg").datagrid('reload');
                },
            });
        }
    }


    //    添加
    function addBannerDialog9() {
        $("#addCourse").dialog({
            buttons: [
                {
                    text: '保存',
                    iconCls: 'icon-save',
                    handler: function () {
                        //保存用户信息
                        $("#addCourseForm").form('submit', {
                            url: '${pageContext.request.contextPath}/course/addCourse',
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
                                $("#addCourse").dialog('close');
                                //刷新数据
                                $("#courseDg").datagrid('reload');
                            }
                        });
                    }
                },
                {
                    text: '关闭',
                    iconCls: 'icon-clear',
                    handler: function () {
                        //关闭窗口
                        $("#addCourse").dialog('close');
                    }
                },
            ]
        });
    }

    // 修改
    function motifyBannerDialog9() {
        var rows = $("#courseDg").datagrid('getSelections');
        if(rows.length<=null || rows.length>1){
            alert("请选择一行");

        }else {
            var ids = [];
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
            }
            console.log(ids);
            $("#motifyCourse").dialog({
                href:'${pageContext.request.contextPath}/back/course/motifyActicle.jsp?id='+ids,
                buttons: [
                    {
                        text: '更新',
                        iconCls: 'icon-save',
                        handler: function () {
                            //保存用户信息
                            $("#motifyCourseForm").form('submit', {
                                url: '${pageContext.request.contextPath}/course/motifyCourse',
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
                                    $("#motifyCourse").dialog('close');
                                    //刷新数据
                                    $("#courseDg").datagrid('reload');
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

<table id="courseDg">
    <%--表格的工具栏--%>
    <div id="top9">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="delBannerDilog9()"
           data-options="iconCls:'icon-clear',plain:true,">批量删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="addBannerDialog9()"
           data-options="iconCls:'icon-add',plain:true,">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="motifyBannerDialog9()"
           data-options="iconCls:'icon-add',plain:true,">更新</a>
    </div>

    <%--添加窗口--%>
    <div id="addCourse" data-options="href:'${pageContext.request.contextPath}/back/course/addCourse.jsp',
                                    width:600,height:400,title:'保存文章',draggable:false,
                 iconCls:'icon-save',">

    </div>

    <%--修改的窗口--%>
    <div id="motifyCourse" data-options="width:600,height:400,title:'修改文章',draggable:false,
                                    iconCls:'icon-edit',">

    </div>


</table>