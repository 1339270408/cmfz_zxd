<%@page pageEncoding="UTF-8" isELIgnored="false" %>



<div style="text-align: center">
    <form id="upPwdFrom" class="easyui-form" method="post">
        <input name="id" type="hidden" value="${sessionScope.admin.id}">
        <div style="margin-top: 55px">
            <input name="name" value="${sessionScope.admin.name}" class="easyui-textbox" readonly="true"
                   data-options="label:'帐户名:',width:280,height:26,iconCls:'icon-man',">
        </div>
        <div style="margin-top: 20px">
            <input name="password2" class="easyui-passwordbox"
                   data-options="label:'旧密码:',width:280,height:26,required:true,validType:'pwd',">
        </div>
        <div style="margin-top: 20px">
            <input name="password" class="easyui-passwordbox"
                   data-options="label:'新密码:',width:280,height:26,required:true,validType:'pwd',">
        </div>
        <div style="margin-top: 20px">
            <input name="password3" class="easyui-passwordbox"
                   data-options="label:'确认密码:',width:280,height:26,required:true,validType:'pwd',">
        </div>
    </form>
</div>
