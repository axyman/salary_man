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
                    <h3 class="box-title">工资项</h3>
                </div>
                <div class="col-md-4">
                    <!-- Horizontal Form -->
                    <div class="box box-info">

                        <form class="form-horizontal" id="wageItemForm">
                            <div class="box-body">
                                <input type="hidden" id="wageItemId" name="wageItemId" value="1"/>
                                <div class="form-group">
                                    <label for="latefine" class="col-sm-4 control-label">迟到罚金</label>
                                    <div class="col-sm-4">
                                        <input type="number" class="form-control" name="lateFine" id="latefine">
                                    </div>
                                    <label class="col-sm-2 control-label">元/次</label>
                                </div>
                                <div class="form-group">
                                    <label for="earlyfine" class="col-sm-4 control-label">早退罚金</label>
                                    <div class="col-sm-4">
                                        <input type="number" class="form-control" name="earlyFine" id="earlyfine">
                                    </div>
                                    <label class="col-sm-2 control-label">元/次</label>
                                </div>
                                <div class="form-group">
                                    <label for="businesstripsal" class="col-sm-4 control-label">出差补贴</label>
                                    <div class="col-sm-4">
                                        <input type="number" class="form-control" name="businessTripSal" id="businesstripsal">
                                    </div>
                                    <label class="col-sm-2 control-label">元/天</label>
                                </div>
                                <div class="form-group">
                                    <label for="fulcheckssal" class="col-sm-4 control-label">全勤补贴</label>
                                    <div class="col-sm-4">
                                        <input type="number" class="form-control" name="fulChecksSal" id="fulcheckssal">
                                    </div>
                                    <label class="col-sm-2 control-label">元/月</label>
                                </div>
                                <div class="form-group">
                                    <label for="foodsal" class="col-sm-4 control-label">餐饮补贴</label>
                                    <div class="col-sm-4">
                                        <input type="number" class="form-control" name="foodSal" id="foodsal">
                                    </div>
                                    <label class="col-sm-2 control-label">元/月</label>
                                </div>
                                <div class="form-group">
                                    <label for="trafficsal" class="col-sm-4 control-label">交通补贴</label>
                                    <div class="col-sm-4">
                                        <input type="number" class="form-control"name="trafficSal" id="trafficsal">
                                    </div>
                                    <label class="col-sm-2 control-label">元/月</label>
                                </div>

                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <button type="submit" class="btn btn-lg btn-success pull-right" id="btn">保存</button>
                            </div>
                            <!-- /.box-footer -->
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

    $(function() {
        $.ajax({
            url: "/findAllWageItem",
            type: "get",
            async: "false",
            data:"wageItemId=1",
            success: function (date) {
                //alert(date);
                   $("#latefine").val(date.lateFine),
                    $("#earlyfine").val(date.earlyFine),
                    $("#businesstripsal").val(date.businessTripSal),
                    $("#fulcheckssal").val(date.fulChecksSal),
                    $("#foodsal").val(date.foodSal),
                    $("#trafficsal").val(date.trafficSal)

            }
        });
       $("#btn").click(function () {

           $.ajax({
               url:"/updateWageItem",
               data:$("#wageItemForm").serialize(),
               type:"post",
           });
        });

    });
</script>
</body>

</html>
<!---->