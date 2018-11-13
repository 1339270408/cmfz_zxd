<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    $(function () {
       $("#motifyFrom").form('load',
           '${pageContext.request.contextPath}/banner/findById?id=${param.id}');
    });
</script>

<div style="text-align: center">

    <form id="motifyFrom" class="easyui-form" method="post" enctype="multipart/form-data">

        <input name="id" type="hidden">

        <div style="margin-top: 80px">
            <input class="easyui-textbox" name="title"  data-options="width:280,height:26,
                                          prompt:'请输入名称',label:'名称:',required:true,">
        </div>
        <div style="margin-top: 20px">
            <input class="easyui-filebox" name="file" data-options="width:280,heighr:26,
                                          prompt:'请选择图片',label:'图片:',required:true,validType:'image',editable:false,">
        </div>
        <div style="margin-top: 20px">
            <input class="easyui-textbox" name="desca" data-options="width:280,heighr:26,
                                          prompt:'请输入描述',label:'描述:',required:true,">
        </div>
        <div style="margin-top: 20px">
            <input class="easyui-textbox" name="status" data-options="width:280,heighr:26,
                                          prompt:'请输入状态',label:'状态:',required:true,">
        </div>

         <div style="margin-top: 20px">
             <input class="easyui-datebox" name="date" data-options="width:280,heighr:26,
                                           prompt:'请选择时间',label:'时间:',required:true,editable:false,">
         </div>
    </form>

</div>