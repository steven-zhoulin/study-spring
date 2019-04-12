<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN">
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Demo</title>

    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/demo/demo.css"/>

    <script type="text/javascript" src="/plugins/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/plugins/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/plugins/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">

        function addTab(url, text, iconCls) {
            var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='/views/" + url + "'></iframe>";
            $("#tabs").tabs("add", {
                title: text,
                iconCls: iconCls,
                closable: true,
                content: content
            });
        }

        function openTab(text, url, iconCls) {
            if ($("#tabs").tabs("exists", text)) {
                $("#tabs").tabs("close", text);
                addTab(url, text, iconCls);
                $("#tabs").tabs("select", text);
            } else {
                addTab(url, text, iconCls);
            }
        }

        function logout() {
            $.messager
                .confirm(
                    "系统提示",
                    "您确定要退出系统吗",
                    function (r) {
                        if (r) {
                            clearCookie();
                        }
                    });
        }

    </script>

</head>

<body class="easyui-layout">

<div region="north" style="height:78px">
    <a href="/user/logout">Logout</a>
</div>

<div region="west" title="导航菜单" split="true" style="width:18%;">
    <ul id="menu-tree" class="easyui-tree">
        // 菜单树
    </ul>
</div>

<div region="center" style="margin:5px;">
    <div class="easyui-tabs" fit="true" border="false" id="tabs">
        <div title="About" data-options="closable:true" style="padding:10px">
            <p style="font-size:14px">jQuery EasyUI framework helps you build your web pages easily.</p>
            <ul>
                <li>easyui is a collection of user-interface plugin based on jQuery.</li>
                <li>easyui provides essential functionality for building modem, interactive, javascript applications.
                </li>
                <li>using easyui you don't need to write many javascript code, you usually defines user-interface by
                    writing some HTML markup.
                </li>
                <li>complete framework for HTML5 web page.</li>
                <li>easyui save your time and scales while developing your products.</li>
                <li>easyui is very easy but powerful.</li>
            </ul>
        </div>
        <div title="Help" data-options="iconCls:'icon-help',closable:true" style="padding:10px">
            This is the help content.
        </div>
    </div>


</div>

<script type="text/javascript">

    $(function () {
        $('#menu-tree').tree({
            url: '/system/menu/tree',
            lines: true,
            onClick : function(node) {
                openTab(node.text, node.url);
            }
        });
    });

    var url;

    function addBook() {
        $('#dlg').dialog('open').dialog('center').dialog('setTitle', '新增书籍');
        $('#fm').form('clear');
        url = '/book-rest/add';
    }

    function editBook() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $('#dlg').dialog('open').dialog('center').dialog('setTitle', '修改书籍');
            $('#fm').form('load', row);
            url = '/book-rest/edit?id=' + row.id;
        }
    }

    function saveBook() {
        $('#fm').form('submit', {
            url: url,
            onSubmit: function () {
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

    function deleteBook() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $.messager.confirm('Confirm', '确认删除这本书?', function (r) {
                if (r) {
                    $.post('/book-rest/delete', {id: row.id}, function (result) {
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

    function myformatter(date) {
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        var d = date.getDate();
        return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
    }

    function myparser(s) {
        if (!s) return new Date();
        var ss = (s.split('-'));
        var y = parseInt(ss[0], 10);
        var m = parseInt(ss[1], 10);
        var d = parseInt(ss[2], 10);
        if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
            return new Date(y, m - 1, d);
        } else {
            return new Date();
        }
    }

</script>

</body>
</html>