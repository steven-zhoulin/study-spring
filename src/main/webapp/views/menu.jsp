<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/demo/demo.css"/>

    <script type="text/javascript" src="/plugins/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/plugins/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/plugins/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>

    <title>菜单管理</title>
</head>

<body style="margin:5px;" id="ff">

<table id="dg" title="菜单管理" class="easyui-datagrid" fit="true"
       url="/sys/menu/list"
       toolbar="#toolbar"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="menuId">菜单ID</th>
        <th field="parentMenuId">父菜单ID</th>
        <th field="menuTitle">菜单名</th>
        <th field="menuUrl">菜单地址</th>
        <th field="showOrder">显示顺序</th>
        <th field="enabled" formatter="formatEnabled" align='center' halign='center'>是否激活</th>
        <th field="description">描述</th>

    </tr>
    </thead>
</table>

<div id="toolbar">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">新增</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">编辑</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delete()">删除</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:400px"
     data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
    <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
        <h3>菜单信息</h3>

        <div style="margin-bottom:10px">
            <input name="parentMenuId" class="easyui-textbox" label="父菜单ID:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="menuTitle" class="easyui-textbox" required="true" label="菜单名:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="menuUrl" class="easyui-textbox" required="true" label="菜单地址:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="showOrder" class="easyui-textbox" label="显示顺序:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <select name="enabled" class="easyui-combobox" required="true" label="是否激活:" style="width:100%">
                <option value="true" selected>激活</option>
                <option value="false">冻结</option>
            </select>
        </div>
        <div style="margin-bottom:10px">
            <input name="description" class="easyui-textbox" label="描述:" style="width:100%">
        </div>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="save()"
       style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
       onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
</div>

<script type="text/javascript">

    var url;

    function add() {
        $('#dlg').dialog('open').dialog('center').dialog('setTitle', '新增');
        $('#fm').form('clear');
        url = '/sys/menu';
    }

    function edit() {
        var row = $('#dg').datagrid('getSelected');

        if (row) {
            $('#dlg').dialog('open').dialog('center').dialog('setTitle', '修改');
            $('#fm').form('load', row);
            if (row.enabled == '激活') {
                $("#select_id ").val(true);
            } else {
                $("#select_id ").val(false);
            }
            url = '/sys/menu/' + row.menuId + '?_method=put';
        }
    }

    function deleteUser() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $.messager.confirm('Confirm', '确认删除?', function (r) {
                if (r) {
                    $.post('/sys/menu/' + row.menuId + '?_method=delete', function (result) {
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
        if (val == true){
            return '<span style="color:green;">激活</span>';
        } else {
            return '<span style="color:red;">冻结</span>';
        }
    }

</script>

</body>
</html>