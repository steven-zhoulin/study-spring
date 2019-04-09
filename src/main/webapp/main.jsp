<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN">
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>DevOps</title>

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
    <p style="padding:5px;margin:0;">Select language:</p>
    <ul>
        <li><a href="javascript:void(0)" onclick="showcontent('java')">Java</a></li>
        <li><a href="javascript:void(0)" onclick="showcontent('cshape')">C#</a></li>
        <li><a href="javascript:void(0)" onclick="showcontent('vb')">VB</a></li>
        <li><a href="javascript:void(0)" onclick="showcontent('erlang')">Erlang</a></li>
    </ul>
    <div class="easyui-accordion">
        <div title="系统管理" data-options="iconCls:'icon-shujias'" style="padding:10px">
            <a href="javascript:openTab('用户管理','user.jsp','icon-host')" class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-host'" style="width: 150px;">用户管理</a>
        </div>
        <div title="主机监控" data-options="iconCls:'icon-shujias'" style="padding:10px">
            <a href="javascript:openTab('WEB主机监控','host-monitor.jsp?type=WEB','icon-host')" class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-host'" style="width: 150px;">WEB主机监控</a>
            <a href="javascript:openTab('APP主机监控','host-monitor.jsp?type=APP','icon-host')" class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-host'" style="width: 150px;">APP主机监控</a>
            <a href="javascript:openTab('CACHE主机监控','host-monitor.jsp?type=CACHE','icon-host')"
               class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-host'"
               style="width: 150px;">CACHE主机监控</a>
            <a href="javascript:openTab('SEARCH主机监控','host-monitor.jsp?type=SEARCH','icon-host')"
               class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-host'"
               style="width: 150px;">SEARCH主机监控</a>
            <a href="javascript:openTab('AEE主机监控','host-monitor.jsp?type=AEE','icon-host')" class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-host'" style="width: 150px;">AEE主机监控</a>
            <a href="javascript:openTab('ZK主机监控','host-monitor.jsp?type=ZK','icon-host')" class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-host'" style="width: 150px;">ZK主机监控</a>
            <a href="javascript:openTab('HDFS主机监控','host-monitor.jsp?type=HDFS','icon-shujia')"
               class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-shujia'"
               style="width: 150px;">HDFS主机监控</a>
        </div>
        <div title="实例监控" data-options="iconCls:'icon-shujias'" style="padding:10px">
            <a href="javascript:openTab('WEB实例监控','instance-monitor.jsp?type=WEB','icon-host')"
               class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-host'" style="width: 150px;">WEB实例监控</a>
            <a href="javascript:openTab('APP实例监控','instance-monitor.jsp?type=APP','icon-host')"
               class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-host'" style="width: 150px;">APP实例监控</a>
            <a href="javascript:openTab('CACHE实例监控','instance-monitor.jsp?type=CACHE','icon-host')"
               class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-host'"
               style="width: 150px;">CACHE实例监控</a>
            <a href="javascript:openTab('SEARCH实例监控','instance-monitor.jsp?type=SEARCH','icon-host')"
               class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-host'"
               style="width: 150px;">SEARCH实例监控</a>
            <a href="javascript:openTab('AEE实例监控','instance-monitor.jsp?type=AEE','icon-host')"
               class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-host'" style="width: 150px;">AEE实例监控</a>
            <a href="javascript:openTab('ZK实例监控','instance-monitor.jsp?type=ZK','icon-host')" class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-host'" style="width: 150px;">ZK实例监控</a>
            <a href="javascript:openTab('HDFS实例监控','instance-monitor.jsp?type=HDFS','icon-host')"
               class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-host'"
               style="width: 150px;">HDFS实例监控</a>
        </div>
    </div>
</div>

<div region="center" style="margin:5px;">
    <div class="easyui-tabs" fit="true" border="false" id="tabs">
        <div title="图书管理" data-options="closable:true" style="padding:10px">
            <table id="dg" title="图书管理" class="easyui-datagrid"
                   url="/book-rest/list"
                   method="get"
                   toolbar="#toolbar"
                   rownumbers="true" fitColumns="true" singleSelect="true">
                <thead>
                <tr>
                    <th field="id" width="15">编号</th>
                    <th field="title" width="100">书名</th>
                    <th field="price" width="20">价格</th>
                    <th field="publishDate" width="50">出版日期</th>
                </tr>
                </thead>
            </table>

            <div id="toolbar">
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addBook()">新增书籍</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editBook()">编辑书籍</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteBook()">删除书籍</a>
            </div>

            <div id="dlg" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
                <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
                    <h3>书籍信息</h3>
                    <div style="margin-bottom:10px">
                        <input name="title" class="easyui-textbox" required="true" label="书名:" style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="price" class="easyui-textbox" required="true" label="价格:" style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="publishDate" class="easyui-datebox" required="true" label="出版时间:"
                               style="width:100%" data-options="formatter:myformatter,parser:myparser">
                    </div>
                </form>
            </div>
            <div id="dlg-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveBook()"
                   style="width:90px">Save</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
            </div>
        </div>
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
        <div title="My Documents" data-options="closable:true" style="padding:10px">
            <ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true"></ul>
        </div>
        <div title="Help" data-options="iconCls:'icon-help',closable:true" style="padding:10px">
            This is the help content.
        </div>
    </div>


</div>


<script type="text/javascript">
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