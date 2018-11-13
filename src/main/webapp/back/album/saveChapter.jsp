<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function(){
             $.get(
                 "${pageContext.request.contextPath}/album/findById?id=${param.id}",
                  function(result){
                      var options=$("<option></option>").attr("value",result.id).text(result.title);
                      $("#cc").append(options);
                 },"json"
             );
    });
</script>
<div style="width:100%;text-align: center;">
    <form id="saveChapterInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 60px;">
            标<span style="opacity: 0">一一</span>题: <input type="text" name="title" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>
        <div style="margin-top: 20px;">
            章节大小: <input type="text" name="size" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>
        <div style="margin-top: 20px;">
            章节时长: <input type="text" name="duration" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man'">
        </div>
        <div style="margin-top: 20px;">
            章节路径: <input  name="file"   class="easyui-filebox" data-options="width:165,height:26,">
        </div>


     <div style="margin-top: 20px;">
            所属专辑: <select id="cc" name="album_id" style="width:165px;height:26px;">

                    </select>
        </div>

    </form>
</div>