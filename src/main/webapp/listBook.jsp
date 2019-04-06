<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>图书管理</title>

    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/demo/demo.css"/>

    <script type="text/javascript" src="/plugins/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/plugins/jquery-easyui/jquery.easyui.min.js"></script>


</head>
<body>

<div class="easyui-layout" style="width:100%;height:500px;">
    <div data-options="region:'north'" style="height:78px"></div>
    <div region="west" split="true" title="导航菜单" style="width:20%;">
        <p style="padding:5px;margin:0;">Select language:</p>
        <ul>
            <li><a href="javascript:void(0)" onclick="showcontent('java')">Java</a></li>
            <li><a href="javascript:void(0)" onclick="showcontent('cshape')">C#</a></li>
            <li><a href="javascript:void(0)" onclick="showcontent('vb')">VB</a></li>
            <li><a href="javascript:void(0)" onclick="showcontent('erlang')">Erlang</a></li>
        </ul>
    </div>


    <div id="content" region="center" class="easyui-tabs" style="width:80%;height:auto">

        <div title="图书管理" data-options="closable:true" style="padding:10px">
            <table id="dg" title="图书管理" class="easyui-datagrid"
                   url="/book-rest/list"
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