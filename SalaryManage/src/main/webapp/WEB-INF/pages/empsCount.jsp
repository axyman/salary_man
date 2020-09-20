<%--
  Created by IntelliJ IDEA.
  User: 丶孤杨傲立
  Date: 2020/8/31
  Time: 14:46
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
                    <h2 class="box-title">各部门人数统计柱状图</h2>
                </div>
                <div class="col-md-8">

                    <!-- 图表 -->
                    <div class="">

                        <div class="box-body">
                            <div id="bar-chart" style="height: 500px;"></div>
                        </div>
                        <!-- /.box-body-->
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

    $(function() {
        var url="/emp/countEmp";
        $.post(url,function (data) {
            var array=new Array(data.length);
            for (var i=0;i<data.length;i++){
                /*   [{材料部:1},{财务部:2}]    */
                var array2=new Array(2);
                array2[0] = data[i].dept_name;
                array2[1]=data[i].nums;
                array[i] = array2;
            }
            initChart(array);
        });
    });

    function initChart(canshu) {
        //图表
        var bar_data = {
            data: canshu,
            color: "#3c8dbc"
        };
        $.plot("#bar-chart", [bar_data], {
            grid: {
                borderWidth: 1,
                borderColor: "#f3f3f3",
                tickColor: "#f3f3f3"
            },
            series: {
                bars: {
                    show: true,
                    barWidth: 0.5,
                    align: "center"
                }
            },
            xaxis: {
                mode: "categories",
                tickLength: 0
            }
        });
        //图表的结束
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
