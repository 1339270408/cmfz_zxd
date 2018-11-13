<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    $(function () {
       $.get(
           "${pageContext.request.contextPath}/guru/findAll",
           function(result){
               //console.log(result);
               $.each(result,function (index,value) {
                   var option=$("<option></option>").attr("value",value.id).text(value.name);
                   $("#cc1").append(option);

               });

               /*console.log(result.id);
               console.log(result.name);*/

           },"json");
    });
</script>

<div style="text-align: center">
    <form method="post" class="easyui-form" id="addActicleForm" enctype="multipart/form-data">

        <div style="margin-top: 50px">
            <label style="margin-right: 52px">大师:</label>
            <select id="cc1" name="guru_id" style="width: 195px;height: 25px;">
                <option value="" >请选择</option>
            </select>
        </div>
        <div style="margin-top: 20px">
            <input class="easyui-textbox" name="title" data-options="width:280,height:26,
                                          prompt:'请输入名称',label:'名称:',required:true,">
        </div>
        <div style="margin-top: 20px">
            <input class="easyui-filebox" name="file" data-options="width:280,heighr:26,
                                          prompt:'请选择图片',label:'图片:',required:true,validType:'image',editable:false,">
        </div>
        <div style="margin-top: 20px">
            <input class="easyui-textbox" name="content" data-options="width:280,heighr:26,
                                          prompt:'请输入描述',label:'描述:',required:true,">
        </div>
        <div style="margin-top: 20px">
            <input class="easyui-datebox" name="publishDate" data-options="width:280,heighr:26,
                                          prompt:'请选择时间',label:'时间:',required:true,editable:false,">
        </div>
        <%-- <div style="margin-top: 20px">
             <input class="easyui-datebox" name="date" data-options="width:280,heighr:26,
                                           prompt:'请选择时间',label:'时间:',required:true,editable:false,">
         </div>--%>
    </form>
</div>