<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/datagrid-detailview.js"></script>
<body>

<div style="width:100%;text-align: center;">
    <form id="ww"  method="post" action="${pageContext.request.contextPath}/user/addUser" enctype="multipart/form-data">
        <div style="margin-top: 60px;">
            手机号: <input type="text" name="phoneNum" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man',
                                                        prompt:'请输入手机号',required:true,">
        </div>
        <div style="margin-top: 20px;">
            用户名: <input type="text" name="username" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man',
                                                        prompt:'请输入用户名',required:true,">
        </div>
        <div style="margin-top: 20px;">
            密<span style="opacity: 0">一</span>码: <input  name="password"   class="easyui-passwordbox" data-options="width:165,height:26,
                                                prompt:'请输入密码',required:true,">
        </div>
        <div style="margin-top: 20px;">
            城<span style="opacity: 0">一</span>市: <input type="text" name="city" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man',
                                                prompt:'请输入城市',required:true,">
        </div>
        <div style="margin-top: 20px;">
            法<span style="opacity: 0">一</span>名: <input type="text" name="nickName" class="easyui-textbox" data-options="width:165,height:26,iconCls:'icon-man',
                                                prompt:'请输入密码',required:true,">
        </div>

        <div style="margin-top: 20px;">
            <input type="submit" value="提交">
        </div>
    </form>
</div>

</body>
</html>