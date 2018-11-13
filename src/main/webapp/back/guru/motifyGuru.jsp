<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    $(function () {
        $("#motifyGuruForm").form('load',
            '${pageContext.request.contextPath}/guru/findById?id=${param.id}')
    });
</script>

<div style="text-align: center">

    <form id="motifyGuruForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <input name="id" type="hidden">
        <div style="margin-top: 80px">
            <input class="easyui-textbox" name="name" data-options="width:280,height:26,
                                          prompt:'请输入名称',label:'名称:',required:true,">
        </div>
        <div style="margin-top: 30px">
            <input class="easyui-filebox" name="file" data-options="width:280,heighr:26,
                                          prompt:'请选择图片',label:'图片:',required:true,validType:'image',editable:false,">
        </div>
        <div style="margin-top: 30px">
            <select class="easyui-combobox" name="sex" data-options="width:280,heighr:26,
                                              prompt:'请选择性别',label:'描述:',required:true,editable:false,">
                <option>男</option>
                <option>女</option>

            </select>
        </div>

    </form>

</div>

