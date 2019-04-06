<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--<link href="/styles/main.css" type="text/css" rel="stylesheet" />--%>

    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/plugins/jquery-easyui/demo/demo.css" />
    <script type="text/javascript" src="/plugins/jquery-easyui/jquery.easyui.min.js" />
    <script type="text/javascript" src="/plugins/jquery-easyui/jquery.min.js" />

    <title>图书管理</title>
</head>
<body onload="onload();">

    <table id="dg" title="图书管理" class="easyui-datagrid" style="width:900px;height:600px"
           url="/book-rest/list"
           toolbar="#toolbar"
           rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
        <tr>
            <th field="id" width="50" align="center">编号</th>
            <th field="title" width="150">书名</th>
            <th field="price" width="50" align="right">价格</th>
            <th field="publishDate" width="50">出版日期</th>
        </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增书籍</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑书籍</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除书籍</a>
    </div>

</body>
<script type="text/javascript" >
    function onload() {
        var grid = $("#dg");
        var options = grid.datagrid("getColumnOption", "publishDate");
        options.formatter = function(value, row, index) {
            var d = new Date(value);
            return d.format("yyyy-MM-dd");
        };
    }
</script>
</html>