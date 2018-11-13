<%@page pageEncoding="UTF-8" isELIgnored="false" %>


<div style="text-align: center">
    <form method="post" class="easyui-form" id="addCourseForm" enctype="multipart/form-data">

        <div style="margin-top: 110px">
            <input class="easyui-textbox" name="title" data-options="width:280,height:26,
                                          prompt:'请输入名称',label:'名称:',required:true,">
        </div>
        <div style="margin-top: 30px">
            <input class="easyui-textbox" name="marking" data-options="width:280,heighr:26,
                                          prompt:'请输入状态',label:'状态:',required:true,">
        </div>
    </form>
</div>