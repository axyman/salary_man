<%--
  Created by IntelliJ IDEA.
  User: 丶孤杨傲立
  Date: 2020/8/31
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>企业工资管理</title>

</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <%@include file="commons.jsp"%>
    <!-- 内容区域 -->
    <div class="content-wrapper">
        <!-- 内容头部 -->
        <section class="content-header">
            <div style="width: 100%;height: 50px;background-color: lightgray;line-height: 50px;font-size: 20px;padding-left: 30px;border-radius: 5px;">
                欢迎：${sessionScope.account}&nbsp;&nbsp;登录&nbsp;&nbsp;《企业工资管理系统》，当前时间：<span style="color: red;" id="time"></span>
            </div>
        </section>
    </div>
    <!-- 内容区域 /-->
</div>

<script>
    $(function() {
        time();
        function time(){
            var myDate = new Date();
            var year=myDate.getFullYear();
            var month=myDate.getMonth()+1;
            var day=myDate.getDate();
            var hour=myDate.getHours();
            var min=myDate.getMinutes();
            var sec=myDate.getSeconds();
            if (sec<10){
                sec="0"+sec;
            }

            $("#time").text(year+"-"+month+"-"+day+"  "+hour+":"+min+":"+sec);
            setTimeout(time,1);
        }


    });
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }


    $(document).ready(function() {
        // 激活导航位置
        setSidebarActive("admin-index");
    });
</script>
</body>

</html>
<!---->
