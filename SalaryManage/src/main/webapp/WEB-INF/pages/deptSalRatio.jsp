<%--
  Created by IntelliJ IDEA.
  User: 丶孤杨傲立
  Date: 2020/8/31
  Time: 14:34
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
    <style type="text/css">
        #dept_table{
            position: relative;
            top:100px;
            right: 150px;
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
                    <h2 class="box-title">各部门工资占比图</h2>
                </div>
                <div class="col-md-8">
                    <!-- DONUT CHART -->
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">Donut Chart</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <canvas id="pieChart" style="height:250px"></canvas>
                        </div>
                        <!-- /.box-body -->
                    </div>

                    <!-- /.box -->

                </div>
                <table id="dept_table">

                </table>
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
    
    /*function dataInfo(allSal,color,deptName) {
        var str =
        "value="+ allSal +
        ",color="+ color+
        ",highlight="+ color+
        ",label="+ deptName ;
        // var json = eval('(' + str + ')');
        return str;
    }*/
    function dataInfo(allSal,color,deptName) {
        var str =
            "{value:"+ allSal+
            ",color:'"+ color+
            "',highlight:'"+ color+
            "',label:'"+ deptName +"'}";
        // var json = eval('(' + str + ')');
        var json = (new Function("return " + str))();//将字符串转换为Object
        return json;
    }

    //用于存储数据
    var array = new Array();

    var colorList = [
        '#003366','#CCFFFF','#FCCE10','#E87C25','#27727B',
        '#FE8463','#9BCA63',
        '#c23531','#2f4554', '#61a0a8', '#d48265',
        '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3'
    ];

    //获取当前的年月
    function getDate() {
        var date=new Date;
        var year=date.getFullYear();
        var month=date.getMonth()+1;
        month =(month<10 ? "0"+month:month);
        var mydate = (year.toString()+"-"+month.toString());
        return mydate;
    }

    $.ajax({
        url:"/salary/selectRatio",
        type:"post",
        data:"mon="+getDate(),
        success:function (result) {
            $.each(result,function (index,item) {
                var dataItem = dataInfo(item.allSal,colorList[index],item.deptName);
                // array[index] = JSON.parse(dataItem);
                array[index] = dataItem;
                var tr = $("<tr></tr>");
                var colorTd =$("<td></td>").append($("<div style='background:"+colorList[index]+";width: 50px;height:15px;'></div>"));
                var deptNameTd = $("<td></td>").append(item.deptName);
                var dataTd = $("<td></td>").append(item.allSal);
                tr.append(colorTd).append(deptNameTd).append("&nbsp;:&nbsp;").append(dataTd).appendTo("#dept_table");

            });

            initChart(array);
        }

    });

    //-------------
    //- PIE CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.

    function initChart(array) {
        var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
        var pieChart = new Chart(pieChartCanvas);


        var PieData = array;


        /*var PieData = [{
            value: 700,
            color: "#f56954",
            highlight: "#f56954",
            label: "Chrome"
        },
            {
                value: 500,
                color: "#00a65a",
                highlight: "#00a65a",
                label: "IE"
            },
            {
                value: 400,
                color: "#f39c12",
                highlight: "#f39c12",
                label: "FireFox"
            },
            {
                value: 600,
                color: "#00c0ef",
                highlight: "#00c0ef",
                label: "Safari"
            },
            {
                value: 300,
                color: "#3c8dbc",
                highlight: "#3c8dbc",
                label: "Opera"
            },
            {
                value: 100,
                color: "#d2d6de",
                highlight: "#d2d6de",
                label: "Navigator"
            }
        ];*/
        var pieOptions = {
            //Boolean - Whether we should show a stroke on each segment
            segmentShowStroke: true,
            //String - The colour of each segment stroke
            segmentStrokeColor: "#fff",
            //Number - The width of each segment stroke
            segmentStrokeWidth: 2,
            //Number - The percentage of the chart that we cut out of the middle
            percentageInnerCutout: 50, // This is 0 for Pie charts
            //Number - Amount of animation steps
            animationSteps: 100,
            //String - Animation easing effect
            animationEasing: "easeOutBounce",
            //Boolean - Whether we animate the rotation of the Doughnut
            animateRotate: true,
            //Boolean - Whether we animate scaling the Doughnut from the centre
            animateScale: false,
            //Boolean - whether to make the chart responsive to window resizing
            responsive: true,
            // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
            maintainAspectRatio: true,
            //String - A legend template
        };
        //Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.
        pieChart.Doughnut(PieData, pieOptions);
    }

</script>
</body>

</html>
<!---->
