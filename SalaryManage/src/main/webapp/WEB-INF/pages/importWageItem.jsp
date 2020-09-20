<%--
  Created by IntelliJ IDEA.
  User: 丶孤杨傲立
  Date: 2020/8/31
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <div class="box box-primary" style="height: 810px;">
                <div class="box-header with-border">
                    <h3 class="box-title">导入其他工资项</h3>
                </div>
                <div class="col-md-12">
                    <!-- Horizontal Form -->
                    <div class="box box-info" style="padding: 15px;font-size: 30px;">

                        <form class="form-horizontal" enctype="multipart/form-data">
                            <div class="form-group">
                                <label>点击选择其他工资项文件：</label>
                                <label for="file"class=" btn btn-primary">选择文件</label>
                                <input id="file"type="file"style="display:none">
                            </div>

                            <div>
                                <button type="submit" class="btn btn-lg btn-success pull-left">开始上传</button>
                            </div>

                        </form>
                    </div>


                </div>
            </div>
        </section>
    </div>
    <!-- 内容区域 /-->
</div>

<script>
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
    // 列表按钮
    $("#dataList td input[type='checkbox']").iCheck({
        checkboxClass: 'icheckbox_square-blue',
        increaseArea: '20%'
    });

    $("#selall").click(function() {
        var clicks = $(this).is(':checked');
        if (!clicks) {
            $("#dataList td input[type='checkbox']").iCheck("uncheck");
        } else {
            $("#dataList td input[type='checkbox']").iCheck("check");
        }
        $(this).data("clicks", !clicks);
    });
</script>
</body>

</html>
<!---->
