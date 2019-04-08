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

    <title>主机监控</title>
</head>

<body style="margin:5px;" id="ff">

<table id="dg" title="主机监控" class="easyui-datagrid"
       fit="true"
       pagination="true"
       url="/host-rest/list"
       toolbar="#toolbar"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="hostIp">主机地址</th>
        <th field="cpuUsage">CPU使用率</th>
        <th field="socketUsage">套接字监控</th>
        <th field="diskUsage">磁盘使用率</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增书籍</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑书籍</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除书籍</a>
</div>

</body>
</html>