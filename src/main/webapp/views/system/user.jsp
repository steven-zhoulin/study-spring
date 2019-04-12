<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户管理</title>

    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/demo/demo.css"/>

    <script type="text/javascript" src="/plugins/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/plugins/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/plugins/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#dept-tree').tree({
                url: '/system/dept/tree'
            });
        });

        var url;

        function addUser() {
            $('#dlg').dialog('open').dialog('center').dialog('setTitle', '新增用户');
            $('#fm').form('clear');
            url = '/system/user';
        }

        function editUser() {
            var row = $('#dg').datagrid('getSelected');

            if (row) {
                $('#dlg').dialog('open').dialog('center').dialog('setTitle', '修改');
                $('#fm').form('load', row);
                if (row.enabled == '激活') {
                    $("#select_id ").val(true);
                } else {
                    $("#select_id ").val(false);
                }
                url = '/system/user/' + row.userId + '?_method=put';
            }
        }

        function deleteUser() {
            var row = $('#dg').datagrid('getSelected');
            if (row) {
                $.messager.confirm('Confirm', '确认删除?', function (r) {
                    if (r) {
                        $.post('/system/user/' + row.userId + '?_method=delete', function (result) {
                            if (result.success) {
                                $('#dg').datagrid('reload');	// reload the user data
                            } else {
                                $.messager.show({	// show error message
                                    title: 'Error',
                                    msg: result.errorMsg
                                });
                            }
                        }, 'json');
                    }
                });
            }
        }

        function save() {
            $('#fm').form('submit', {
                url: url,
                onSubmit: function (param) {
                    return $(this).form('validate');
                },
                success: function (result) {
                    var result = eval('(' + result + ')');
                    if (result.errorMsg) {
                        $.messager.show({
                            title: 'Error',
                            msg: result.errorMsg
                        });
                    } else {
                        $('#dlg').dialog('close');		// close the dialog
                        $('#dg').datagrid('reload');	// reload the user data
                    }
                }
            });
        }

        function formatEnabled(val, row) {
            if (val == true) {
                return '<span style="color:green;">激活</span>';
            } else {
                return '<span style="color:red;">冻结</span>';
            }
        }

        function formatDate(val, row) {
            var date = new Date(val);
            var year = date.getFullYear().toString();
            var month = (date.getMonth() + 1);
            var day = date.getDate().toString();
            var hour = date.getHours().toString();
            var minutes = date.getMinutes().toString();
            var seconds = date.getSeconds().toString();
            if (month < 10) {
                month = "0" + month;
            }
            if (day < 10) {
                day = "0" + day;
            }
            if (hour < 10) {
                hour = "0" + hour;
            }
            if (minutes < 10) {
                minutes = "0" + minutes;
            }
            if (seconds < 10) {
                seconds = "0" + seconds;
            }
            return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
        }

    </script>

</head>

<body class="easyui-layout" style="margin:5px;" id="ff">

<div data-options="region:'west',split:true" collapsible="false" title="部门" style="width:18%;">
    <ul id="dept-tree" class="easyui-tree">
        //
    </ul>
</div>
<div data-options="region:'center',title:'用户',iconCls:''">
    <table id="dg" title="" class="easyui-datagrid" fit="true"
           url="/system/user/list"
           toolbar="#toolbar"
           rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
        <tr>
            <th field="username">用户名</th>
            <th field="phone">手机号码</th>
            <th field="email">电子邮箱</th>
            <th field="enabled" formatter="formatEnabled" align='center' halign='center'>状态</th>
            <th field="createTime" formatter="formatDate" align='center' halign='center'>创建日期</th>
        </tr>
        </thead>
    </table>

    <div id="toolbar">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addUser()">新增</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteUser()">删除</a>
    </div>

    <div id="dlg" class="easyui-dialog" style="width:400px"
         data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
        <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
            <h3>用户信息</h3>
            <div style="margin-bottom:10px">
                <input name="userName" class="easyui-textbox" required="true" label="用户名:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="phone" class="easyui-textbox" label="手机号码:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="email" class="easyui-textbox" label="电子邮箱:" style="width:100%" validType="email">
            </div>
            <div style="margin-bottom:10px">
                <input name="deptId" class="easyui-textbox" required="true" label="部门:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="jobId" class="easyui-textbox" required="true" label="岗位:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="roleId" class="easyui-textbox" required="true" label="角色:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input class="easyui-radiobutton" name="enabled" value="true" checked label="激活:">
            </div>
            <div style="margin-bottom:10px">
                <input class="easyui-radiobutton" name="enabled" value="false" label="冻结:">
            </div>

        </form>
    </div>

    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="save()"
           style="width:90px">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
           onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
    </div>
</div>

</body>
</html>