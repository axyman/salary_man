<%--
  Created by IntelliJ IDEA.
  User: 丶孤杨傲立
  Date: 2020/8/31
  Time: 14:48
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
                    <h3 class="box-title">工资查询</h3>
                </div>
                <div class="" style="padding-left: 10px;padding-right: 20px;padding-top: 15px;font-size: 24px;">
                    <form class="form-inline" id="searchForm">
                        <div class="form-group">
                            <label for="empId">员工工号：</label>
                            <input type="text" class="form-control" id="empId" name="empId">
                        </div>
                        <div class="form-group">
                            <label for="deptId">&nbsp;&nbsp;&nbsp;&nbsp;部门：</label>
                        </div>
                        <div class="form-group">
                            <select class="form-control col-md-4" name="deptId" id="deptId">
                                <%--部门--%>
                            </select>

                        </div>
                        <div class="form-group">
                            <label for="mon">&nbsp;&nbsp;&nbsp;&nbsp;月份：</label>
                            <input type="month" class="form-control" id="mon" name="mon">
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-sm btn-success" id="searchBtn">&nbsp;&nbsp;查询&nbsp;&nbsp;</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-sm btn-success" id="downloadTableBtn">下载工资表格</button>

                    </form>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->


                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable table2excel" style="text-align: center;">
                            <thead>
                            <tr>
                                <th rowspan="2" style="text-align: center;padding-bottom: 40px;">月份</th>
                                <th rowspan="2" style="text-align: center;padding-bottom:40px ;">姓名</th>
                                <th colspan="2" style="text-align: center;">员工信息</th>
                                <th rowspan="2" style="text-align: center;padding-bottom:40px ;">应发工资</th>
                                <th rowspan="2" style="text-align: center;padding-bottom:40px ;">基本工资</th>

                                <th colspan="4" style="text-align: center;">补贴</th>

                                <th colspan="3" style="text-align: center;">奖金</th>
                                <th rowspan="2" style="text-align: center;padding-bottom:40px ;">实发工资</th>

                                <th rowspan="2" style="text-align: center;padding-bottom: 40px;">发放</th>
                            </tr>
                            <tr>


                                <th style="text-align: center;">工号</th>
                                <th style="text-align: center;">部门</th>

                                <th style="text-align: center;">餐饮</th>
                                <th style="text-align: center;">岗位</th>

                                <th style="text-align: center;">交通</th>
                                <th style="text-align: center;">出差</th>
                                <th style="text-align: center;">工龄</th>
                                <th style="text-align: center;">职称</th>
                                <th style="text-align: center;">加班</th>

                            </tr>
                            </thead>
                            <tbody>
                                <%--数据--%>
                            </tbody>
                        </table>
                        <!--数据列表/-->
                    </div>
                    <!-- 数据表格 /-->
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline" id="page_info">
                            <%--导航信息--%>
                        </div>
                    </div>

                    <div class="box-tools pull-right" id="page_nav_area">
                        <%--导航条--%>
                    </div>

                </div>
            </div>
        </section>
    </div>
    <!-- 内容区域 /-->
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.table2excel.js"></script>
<script>

    $(function () {
        init();
        $("#searchBtn").click(function () {
            //alert($("#searchForm").serialize());
            $.ajax({
                url:"/salary/selectAll",
                data:$("#searchForm").serialize()+"&state=1",
                type:"post",
                success:function (result) {
                    build_salary_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            });
        });

        function init(){
            selectDept();//查询部门信息
            toPage(1);
        }

        //查询部门信息
        function selectDept() {
            $("#deptId").empty();
            $.ajax({
                url:"/dept/selectAll",
                type:"get",
                success:function (result) {

                    $("#deptId").append("<option></option>");
                    $.each(result,function (index,item) {
                        var deptOption = $("<option></option>").append(item.deptName).attr("value",item.deptId);
                        deptOption.appendTo("#deptId");
                        // alert(item.deptName);
                    });
                }
            });
        }

        function build_salary_table(result){
            $("#dataList tbody").empty();
            $.each(result.list,function (index,item) {
                var tr = $("<tr></tr>");
                var monTd = $("<td></td>").append(item.mon);
                var empNameTd = $("<td></td>").append(item.empName);
                var empIdTd = $("<td></td>").append(item.empId);
                var deptNameTd = $("<td></td>").append(item.dept.deptName);
                var realSalTd = $("<td></td>").append(item.realSal);
                var shouldSalTd = $("<td></td>").append(item.shouldSal);
                var baseMoneyTd = $("<td></td>").append(item.baseMoney);
                var foodSalTd = $("<td></td>").append(item.foodSal);
                var posSalTd = $("<td></td>").append(item.postSal);
                var trafficSalTd = $("<td></td>").append(item.trafficSal);
                var businessTripSalTd = $("<td></td>").append(item.businessTripSal);
                var workSalTd = $("<td></td>").append(item.workSal);
                var titleSal = $("<td></td>").append(item.titleSal);
                var overTimeSal = $("<td></td>").append(item.overtimeSal);
                var lableBtn = $("<button></button>").addClass("btn btn-default btn-xs").attr("salId",item.salId).append("是");
                var stateBtn = $("<button></button>").addClass("btn btn-success btn-xs").attr("salId",item.salId).append("<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>");

                var btnDiv = $("<div></div>").addClass("btn-group").attr("role","group");

                btnDiv.append(lableBtn).append(stateBtn);
                var btnTd = $("<td></td>").append(btnDiv);

                tr.append(monTd).append(empNameTd).append(empIdTd).append(deptNameTd).
                append(shouldSalTd).append(baseMoneyTd).append(foodSalTd).append(posSalTd).
                append(trafficSalTd).append(businessTripSalTd).append(workSalTd).append(titleSal).append(overTimeSal).
                append(realSalTd).append(btnTd);
                tr.appendTo("#dataList tbody");
            });
        }

        //下载数据到本地
        $("#downloadTableBtn").click(function () {

            $(".table2excel").table2excel({
                exclude: ".noExl",//class="noExl"的列不导出
                name: "Excel Document Name",
                filename: "工资发放记录表",//文件名称
                fileext: ".xls",//文件后缀名
                exclude_img: true,//导出图片
                exclude_links: true,//导出超链接
                exclude_inputs: true//导出输入框内容
            });
           // alert("下载完成");
        });
        //导航信息
        var pageNum = null;
        function build_page_info(result) {
            $("#page_info").empty();
            pageNum = result.pageNum;
            $("#page_info").append("当前第&nbsp;"+result.pageNum+"&nbsp;页&nbsp;&nbsp;总共&nbsp;"+result.pages+"&nbsp;页&nbsp;&nbsp;总共&nbsp;"+result.total+"&nbsp;条记录");
        }

        //解析分页条数据
        function build_page_nav(result) {
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination")
            var firstPageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("首页"));
            var prevLi = $("<li></li>").append($("<a></a>").attr("href","#").append("<span></span>").append("&laquo;"));

            if(result.hasPreviousPage==false){
                firstPageLi.addClass("disabled");
                prevLi.addClass("disabled");
            }else {
                firstPageLi.click(function () {
                    toPage(1);
                });
                prevLi.click(function () {
                    toPage(result.pageNum - 1);
                });
            }
            //ul添加首页和上一页
            ul.append(firstPageLi).append(prevLi);
            //遍历1 2 3 .。。
            $.each(result.navigatepageNums,function (index,item) {
                var numLi = $("<li></li>").append($("<a></a>").attr("href","#").append(item)).appendTo(ul);
                if(result.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    toPage(item);
                });
            })
            var nextLi = $("<li></li>").append($("<a></a>").attr("href","#").append("<span></span>").append("&raquo;"));
            var listPageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"));

            if(result.hasNextPage==false){
                listPageLi.addClass("disabled");
                nextLi.addClass("disabled");

            }else{
               nextLi.click(function () {
                    toPage(result.pageNum + 1);
                });
                listPageLi.click(function () {
                    toPage(result.pages);
                });

            }
            ul.append(nextLi).append(listPageLi);
            $("<nav></nav>").append(ul).appendTo("#page_nav_area")
        }

        //分页查询
        function toPage(pn) {
            $.ajax({
                url:"/salary/selectAll",
                data:$("#searchForm").serialize()+"&state=1&pn="+pn,
                type:"get",
                success:function (result) {
                    build_salary_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }

            });
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

   /* $('[name="status"]').bootstrapSwitch({
        onText:"启动",
        offText:"停止",
        onColor:"success",
        offColor:"info",
        size:"small",
        onSwitchChange:function(event,state){
            if(state==true){
                $(this).val("1");
            }else{
                $(this).val("2");
            }
        }
    })*/
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
