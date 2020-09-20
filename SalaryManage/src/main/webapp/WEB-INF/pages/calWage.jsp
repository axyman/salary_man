<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <h3 class="box-title">工资结算</h3>
                </div>
                <div class="col-md-8">
                    <div class="" style="height: 150px;line-height: 70px;">
                        <h3>按月份结算所有工资：</h3>
                        <form class="form-inline" style="padding-left: 50px;" id="cal_mon_Form">
                            <div class="form-group">
                                <label>选择月份：</label>
                                <input type="month" class="form-control" name="mon" placeholder="请输入月份">
                            </div>

                            <button type="button" id="calBtn" class="btn btn-sm btn-success" style="padding-left: 20px;padding-right: 20px;margin-left: 50px;">一键结算</button>
                        </form>

                    </div>
                </div>

            </div>
        </section>
    </div>
    <!-- 内容区域 /-->
</div>

<script>
    $(function () {
        $("#calBtn").click(function () {
            //alert($("#cal_mon_Form").serialize());
            $.ajax({
                url:"/salary/insertData",
                data:$("#cal_mon_Form").serialize(),
                type:"post",
                success:function (result) {
                    $("#cal_mon_Form")[0].reset();
                    alert("结算完成");
                }
            });
        });

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