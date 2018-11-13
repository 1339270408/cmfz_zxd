<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<script>

    $(function () {
       $("#albumDg").treegrid({
           url:'${pageContext.request.contextPath}/album/findPage',
           fitColumns: true,
           fit: true,
           striped:true, <%-- 斑马线 --%>
           rownumbers: true,<%-- 如果为true，则显示一个行号列。 --%>
           idField: 'id',	<%--定义关键字段来标识树节点。（必须的）--%>
           treeField: 'title',<%-- 定义树节点字段。（必须的） --%>
           animate:true,  <%-- 定义在节点展开或折叠的时候是否显示动画效果。 --%>
           loadMsg:'正在加载中,请等待。。。', //远程加载时显示信息
           pagination:true, //显示分页工具栏
           pageSize: 15,
           pageList: [10, 15, 20, 25, 30, 35],
           onlyLeafCheck:true,//定义是否仅在叶子节点前显示复选框
           toggle:true,
           columns:[[
               {title: 'cks', field: 'cks', checkbox: true},
               {field: 'id', title: 'id', width: 80},
               {field: 'title', title: '标题', width: 160, align: ''},
               {field: 'size', title: '章节大小', width: 80},
               {field: 'duration', title: '章节时长', width: 80},
               {field: 'downPath', title: '章节路径', width: 80},
               {field: 'uploadTime', title: '修改时间', width: 160},
           ]],
           toolbar: [
               {
                   text: '添加专辑',
                   iconCls: 'icon-add',
                   handler: openAlbumDialog,
               },
               {
                   text: '添加章节',
                   iconCls: 'icon-add',
                   handler: openChapterDialog,
               },
               {
                   text: '专辑详情',
                   iconCls: 'icon-remove',
                   handler: findAlbum,
               },
               {
                   text: '删除',
                   iconCls: 'icon-remove',
                   handler: delAlbumRow,
               },
               {
                   text: '下载章节',
                   iconCls: 'icon-remove',
                   handler: delChapterBathRows,
               },
           ],
           onDblClickRow:function (row){
               if (row == null) {
                   alert("请先选中行！！！")
               } else {
                   if (row.downPath != null) {
                       $("#album_paly").dialog("open");
                       $("#audio").prop("src", "${pageContext.request.contextPath}/"+row.downPath)
                   } else {
                       alert("请先选妙音！！！")
                   }
               }

           },
       });
    });

    //添加专辑
    function openAlbumDialog() {
        $("#saveAlbumDialog").dialog({
            href: '${pageContext.request.contextPath}/back/album/saveAlbum.jsp',
            buttons: [
                {
                    text: '保存',
                    iconCls: "icon-save",
                    handler: function () {
                        //保存用户信息
                        $("#saveAlbumInputForm").form('submit', {
                            url: '${pageContext.request.contextPath}/album/addAlbum',
                            success: function (result) {//响应的一定是json格式字符串 使用应该先转为js对象
                                //提示信息
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    $.messager.show({title:'提示',msg:'添加成功'});
                                }else{
                                    $.messager.show({title:'提示',msg:'添加失败'});
                                }
                                //关闭对话框
                                $("#saveAlbumDialog").dialog('close');
                                //刷新datagrid
                                $("#albumDg").treegrid('reload');
                            }
                        });
                    }
                },
                {
                    text: '关闭',
                    iconCls: "icon-cancel",
                    handler: function () {
                        $("#saveAlbumDialog").dialog('close');
                    }
                },
            ]
        });
    }

    //添加章节
    function  openChapterDialog() {
        var rows = $("#albumDg").datagrid('getSelected');
        //console.log(rows.id);
        if(rows==null){
            alert("请选择一行");
        }else {
            if(rows.count==null){
                alert("请选择专辑");
            }
            else {
                $("#saveChapterDialog").dialog({
                    href: '${pageContext.request.contextPath}/back/album/saveChapter.jsp?id='+rows.id,
                    buttons: [
                        {
                            text: '保存',
                            iconCls: "icon-save",
                            handler: function () {
                                //保存用户信息
                                $("#saveChapterInputForm").form('submit', {
                                    url: '${pageContext.request.contextPath}/chapter/addChapter',
                                    success: function (result) {//响应的一定是json格式字符串 使用应该先转为js对象
                                        //提示信息
                                        var resultObj = $.parseJSON(result);
                                        if(resultObj.success){
                                            $.messager.show({title:'提示',msg:'添加成功'});
                                        }else{
                                            $.messager.show({title:'提示',msg:'添加失败'});
                                        }
                                        //关闭对话框
                                        $("#saveChapterDialog").dialog('close');
                                        //刷新datagrid
                                        $("#albumDg").treegrid('reload');
                                    }
                                });
                            }
                        },
                        {
                            text: '关闭',
                            iconCls: "icon-cancel",
                            handler: function () {
                                $("#saveChapterDialog").dialog('close');
                            }
                        },
                    ]
                });
            }
        }

    }

    //下载章节
    function delChapterBathRows() {
        var rows = $("#albumDg").datagrid('getSelected');
        if (rows == null) {
            alert("请选择一行");
            //$.messager.show({title: '提示', msg: "至少选中一行"});
        } else {
            if(rows.size==null){
                alert("选择你要下载的音频");
            }
            else {
                location.href = "${pageContext.request.contextPath}/album/download?fileName=" + rows.downPath + "&openStyle=attachment";
            }

        }
    }

    //删除
    function delAlbumRow() {
        var rows = $("#albumDg").datagrid('getSelections');
        if (rows.length==0) {
            alert("请选择一行");
            //$.messager.show({title: '提示', msg: "请选中一行"});
        } else {
            var ids = [];
            for (var i = 0; i < rows.length; i++) {
                //console.log(rows[i].id);
                ids.push(rows[i].id);
            }

            $.ajax({
                url: "${pageContext.request.contextPath}/album/removeP",
                type: "post",
                traditional: true,//传递数据类型的数据时必须设置这个属性为true
                data: {ids: ids},
                success: function (result) {
                    //消息提示
                    $.messager.show({title: '提示', msg: "删除成功！！！"});
                    //刷新datagrid
                    $("#albumDg").treegrid('reload');
                },
                error: function () {
                    //消息提示
                    $.messager.show({title: '提示', msg: "删除失败！！！"});
                    //刷新datagrid
                    $("#albumDg").treegrid('reload');
                }
            })
        }
    }


    //专辑详情
    function  findAlbum() {
        var rows = $("#albumDg") .treegrid("getSelected");
        if(rows==null){
            alert("请选择一行");
            //$.messager.show({title: '提示', msg: "请选中一行"});
        }else {
            if(rows.size==null){
                $("#findAlbumDialog").dialog({
                    href: '${pageContext.request.contextPath}/back/album/findAlbum.jsp?id='+rows.id,

                });
            }else {
                alert("请选择你要了解的专辑");
            }

      }
    }

</script>

    <table id="albumDg" style="width:600px;height:400px">
    <div id="saveAlbumDialog" data-options="width:650,height:500,iconCls:'icon-add',title:'添加专辑'"></div>
    <div id="saveChapterDialog" data-options="width:600,height:400,iconCls:'icon-add',title:'添加文章'"></div>
    <div id="findAlbumDialog" data-options="width:600,height:400,iconCls:'icon-add',title:'专辑详情'"></div>
</table>


<%--双击播放--%>
<div id="album_paly" class="easyui-dialog" title="播放音频" style="width:400px;height:200px;"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
    <audio id="audio" src="" controls="controls" autoplay="autoplay"></audio>
</div>