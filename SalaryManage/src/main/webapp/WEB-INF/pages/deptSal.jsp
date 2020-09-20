<%--
  Created by IntelliJ IDEA.
  User: 丶孤杨傲立
  Date: 2020/8/31
  Time: 14:23
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


    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="../plugins/morris/morris.css">
    <link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="../plugins/select2/select2.css">
    <link rel="stylesheet" href="../plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="../plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="../plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <style type="text/css">
        .data{
            position: relative;
            top: 50px;
            right:150px;
        }
    </style>
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
                    <h2 class="box-title">部门工资折线图</h2>
                </div>
                <div class="col-md-9">

                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">折线图</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="chart">
                                <canvas id="lineChart" style="height:500px"></canvas>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>



                </div>

                <div class="col-md-3 dataTables_info data">
                    <table>
                        <tr>
                            <td>最低工资</td>
                            <td><div style="background:#c1c7d1;width: 50px;height:15px;"></div></td>
                        </tr>
                        <tr>
                            <td>平均工资</td>
                            <td><div style="background:#3b8bba;width: 50px;height:15px;"></div></td>
                        </tr>
                        <tr>
                            <td>最高工资</td>
                            <td><div style="background:#00FF00;width: 50px;height:15px;"></div></td>
                        </tr>
                    </table>


                </div>

            </div>
        </section>
    </div>
    <!-- 内容区域 /-->
</div>

<script>
    var mins = new Array();
    var avgs = new Array();
    var maxs = new Array();
    var depts = new Array();

    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });
    //获取当前的年月
    function getDate() {
        var date=new Date;
        var year=date.getFullYear();
        var month=date.getMonth()+1;
        month =(month<10 ? "0"+month:month);
        var mydate = (year.toString()+"-"+month.toString());
        return mydate;
    }

    $(function () {
        $.ajax({
            url:"/salary/selectDeptSal",
            type:"post",
            data:"mon="+getDate(),
            success:function (result) {
                //alert("查询成功");
                //console.log(result);
                $.each(result,function (index,item) {
                    mins[index] = item.minSal;
                    avgs[index] = item.avgSal;
                    maxs[index] = item.maxSal;
                    depts[index] = item.deptName;
                });
                //初始化图表数据
                initChart(mins,avgs,maxs,depts);
            }
        });
    });

    /* 图表 */
    // var areaChartCanvas = $("#areaChart").get(0).getContext("2d");

    function initChart(mins,avgs,maxs,depts) {

        var areaChartCanvas = $("#lineChart").get(0).getContext("2d");
    // This will get the first returned node in the jQuery collection.
        var areaChart = new Chart(areaChartCanvas);

        /*["销售部", "开发部", "生产部", "财务部", "M", "June", "July"]*/
        var areaChartData = {
            labels: depts,
            datasets: [{
                label: "最低工资",
                fillColor: "rgba(210, 214, 222, 1)",
                strokeColor: "rgba(210, 214, 222, 1)",
                pointColor: "rgba(210, 214, 222, 1)",
                pointStrokeColor: "#c1c7d1",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: mins
            },
                {
                    label: "平均工资",
                    fillColor: "rgba(60,141,188,0.9)",
                    strokeColor: "rgba(60,141,188,0.8)",
                    pointColor: "#3b8bba",
                    pointStrokeColor: "rgba(60,141,188,1)",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(60,141,188,1)",
                    data: avgs
                }

                ,
                {
                    label: "最高工资",
                    fillColor: "rgba(0,255,0,0.9)",//填充色
                    strokeColor: "rgba(0,255,0,0.8)",//笔画颜色
                    pointColor: "#00FF00",//点的颜色
                    pointStrokeColor: "rgba(0,255,0,1)",//点的笔画颜色
                    pointHighlightFill: "#fff",//点高光填充
                    pointHighlightStroke: "rgba(0,255,0,1)",//点突出笔画
                    data: maxs
                }
            ]
        };

        var areaChartOptions = {
            //Boolean - If we should show the scale at all
            showScale: true,
            //Boolean - Whether grid lines are shown across the chart
            scaleShowGridLines: true,//是否在图表中显示网格线
            //String - Colour of the grid lines
            scaleGridLineColor: "rgba(0,0,0,.05)",//网格线的颜色
            //Number - Width of the grid lines
            scaleGridLineWidth: 1,//网格线的宽度
            //Boolean - Whether to show horizontal lines (except X axis)
            scaleShowHorizontalLines: true,
            //Boolean - Whether to show vertical lines (except Y axis)
            scaleShowVerticalLines: true,
            //Boolean - Whether the line is curved between points
            bezierCurve: false,//点之间的线是否弯曲
            //Number - Tension of the bezier curve between points
            bezierCurveTension: 0.3,//点之间曲线的张力
            //Boolean - Whether to show a dot for each point
            pointDot: true,//是否为每一个点显示为一个点
            //Number - Radius of each point dot in pixels
            pointDotRadius: 4,//每个点的半径
            //Number - Pixel width of point dot stroke
            pointDotStrokeWidth: 1,
            //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
            pointHitDetectionRadius: 20,
            //Boolean - Whether to show a stroke for datasets
            datasetStroke: true,
            //Number - Pixel width of dataset stroke
            datasetStrokeWidth: 2,
            //Boolean - Whether to fill the dataset with a color
            datasetFill: true,
            //String - A legend template

            //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
            maintainAspectRatio: true,
            //Boolean - whether to make the chart responsive to window resizing
            responsive: true
        };

        //Create the line chart
        areaChart.Line(areaChartData, areaChartOptions);

        //-------------
        //- LINE CHART -
        //--------------
        var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
        var lineChart = new Chart(lineChartCanvas);
        var lineChartOptions = areaChartOptions;
        lineChartOptions.datasetFill = false;
        lineChart.Line(areaChartData, lineChartOptions);
    }
    /* 图表 */


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