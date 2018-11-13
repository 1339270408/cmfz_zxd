<%@page isELIgnored="false" pageEncoding="UTF-8" %>

<script>
    $(function () {
       $("#findAlbumInputForm").form('load',
            '${pageContext.request.contextPath}/album/findById?id=${param.id}',
          );
       $("#findAlbumInputForm").form({
            onLoadSuccess:function (data) {
               // console.log(data.id);
                var attr = $("<img />").attr("src","${pageContext.request.contextPath}/"+data.coverImg);
                $("#bb").append(attr);
            }
        });
    });

</script>

<style>

    #bb{
        width: 165px;
        height: 60px;
        vertical-align: top;
    }
    #bb img{
        width: 100px;
        height: 60px;
    }
</style>

<div style="width:100%;text-align: center;">
    <form id="findAlbumInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 20px;">
            标<span style="opacity: 0">一一</span>题: <input type="text" name="title" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>
        <div style="margin-top: 20px;">
            集<span style="opacity: 0">一一</span>数: <input type="text" name="count" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>
        <div style="margin-top: 20px;">
            星<span style="opacity: 0">一一</span>级: <input type="text" name="score" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>
        <div style="margin-top: 20px;">
            作<span style="opacity: 0">一一</span>者: <input type="text" name="author" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>
        <div style="margin-top: 20px;">
            播<span style="opacity: 0">一一</span>音: <input type="text" name="broadCast" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>
        <div style="margin-top: 20px;">
            内容简介: <input type="text" name="brief" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>

        <div style="margin-top: 20px;">
            <span id="cc" style="display: inline-block;padding-top: 25px;">专辑图片: </span><span id="bb" style="display: inline-block;"></span>
        </div>

    </form>
</div>