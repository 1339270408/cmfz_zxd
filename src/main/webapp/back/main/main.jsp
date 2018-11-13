<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>持名法州主页</title>
   <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/themes/IconExtension.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/easyui-lang-zh_CN.js"></script>
--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/datagrid-detailview.js"></script>

    <script type="text/javascript">
        <!--菜单处理-->
        $(function () {

            $.post("${pageContext.request.contextPath}/menu/findAllMenu", function (menu) {
                //console.log(menu);
                //遍历一级菜单
                $.each(menu, function (index, m) {
                    //遍历二级菜单
                    //console.log(m);
                    var content = "";
                    $.each(m.list, function (idx, child) {
                        content += "<a class='easyui-linkbutton' " +
                            "data-options=\"iconCls:'" + child.iconCls + "',plain:true,\"" +
                            "style='width: 98%; margin: 6px 2px; border: 1px #ccc solid;'" +
                            "onclick=\"addTabs('" + child.title + "','" + child.iconCls + "','" + child.href + "')\">" +
                            "" + child.title + "</a>"
                    });
                    //通过accordion的添加方法追加菜单
                    $("#aa").accordion('add', {
                        title: m.title,
                        iconCls: m.iconCls,
                        content: content,
                    });
                });
            });
            setInterval("document.getElementById('time1').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());", 1000);
        });

        //点击菜单追加选项卡
        function addTabs(title, iconCls, href) {
            if (!$("#tt").tabs('exists', title)) {
                $("#tt").tabs('add', {
                    title: title,
                    iconCls: iconCls,
                    closable: true,
                    fit: true,
                    href: "${pageContext.request.contextPath}" + href,
                });
            } else {
                $("#tt").tabs('select', title);
            }
        }

        //修改密码
        function upPwd() {
            $("#pwdDialog").dialog({
                href:'${pageContext.request.contextPath}/back/admin/motifyPwd.jsp',
                buttons:[
                    {
                      text:'修改',
                        iconCls:'icon-save',
                        handler:function () {
                            $("#upPwdFrom").form('submit',{
                                url:'${pageContext.request.contextPath}/admin/motifyPwd',
                                success:function (result) {
                                    var parseJSON = $.parseJSON(result);
                                    //提示
                                    if(parseJSON.success){
                                        $.messager.show({
                                            title:'提示',
                                            msg:'修改成功',
                                        });
                                        //关闭对话框
                                        $("#pwdDialog").dialog('close');
                                        location.href="${pageContext.request.contextPath}/admin/closeSession";
                                    }else{
                                        $.messager.show({title:'提示',msg:parseJSON.message,});
                                    }

                                },
                            });
                        }
                    },
                    {
                        text:'关闭',
                        iconCls:'icon-clear',
                        handler:function () {
                            //关闭对话框
                            $("#pwdDialog").dialog('close');
                        },
                    },
                ],
            });
        }



        if("${sessionScope.admin}"==""){
            location.href="${pageContext.request.contextPath}/back/admin/login.jsp"
        }

    </script>

</head>
<body class="easyui-layout">
<div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    <div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px">
        持名法州后台管理系统
    </div>
    <%--时间--%>
    <div id="time1" style="font-size: 14px;color: #FAF7F7;font-family: 楷体;width: 260px;float:left;padding-top: 18px;"></div>

    <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">
        欢迎您:${sessionScope.admin.name} &nbsp;
        <a onclick="upPwd();" class="easyui-linkbutton"
           data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/admin/closeSession" class="easyui-linkbutton"
           data-options="iconCls:'icon-clear'">退出系统</a></div>
</div>
<div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    <div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体">&copy;百知教育 htf@zparkhr.com.cn</div>
</div>

<div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    <div id="aa" class="easyui-accordion" data-options="fit:true">

    </div>
</div>

<div data-options="region:'center'">
    <div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
        <div title="主页" data-options="iconCls:'icon-neighbourhood',"
             style="background-image:url(image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
    </div>
</div>

<%--修改密码的窗口--%>
<div id="pwdDialog" data-options="title:'修改密码',draggable:false,width:500,height:350,">

</div>


</body>
</html>