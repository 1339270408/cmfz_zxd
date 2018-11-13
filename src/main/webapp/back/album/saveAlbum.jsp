<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<div style="width:100%;text-align: center;">
    <form id="saveAlbumInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 60px;">
            标<span style="opacity: 0">一一</span>题: <input type="text" name="title" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>
        <div style="margin-top: 20px;">
            集<span style="opacity: 0">一一</span>数: <input type="text" name="count" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>
        <div style="margin-top: 20px;">
            专辑图片: <input  name="file"   class="easyui-filebox" data-options="width:165,height:26,">
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
    </form>
</div>