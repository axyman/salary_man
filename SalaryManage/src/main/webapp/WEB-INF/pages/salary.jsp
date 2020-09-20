<%--
  Created by IntelliJ IDEA.
  User: 丶孤杨傲立
  Date: 2020/8/31
  Time: 14:57
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
            <div class="box box-primary" style="height: 810px;">
                <div class="box-header with-border">
                    <h3 class="box-title">工资发放</h3>
                </div>
                <div class="" style="padding-left: 10px;padding-right: 20px;padding-top: 15px;font-size: 20px;">
                    <form class="form-inline" id="searchForm">
                        <div class="form-group">
                            <label for="empId">员工工号：</label>
                            <input type="text" class="form-control" id="empId" name="empId" >
                        </div>
                        <div class="form-group">
                            <label for="deptId">&nbsp;&nbsp;&nbsp;&nbsp;部门：</label>
                        </div>
                        <div class="form-group">
                            <select class="form-control col-md-4" id="deptId" name="deptId">

                            </select>

                        </div>
                        <div class="form-group">
                            <label for="mon">&nbsp;&nbsp;&nbsp;&nbsp;考勤月份：</label>
                            <input type="month" class="form-control" id="mon" name="mon">
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-sm btn-success" id="selectBtn">&nbsp;&nbsp;查询&nbsp;&nbsp;</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <div style="float: right;">
                            <button type="button" class="btn btn-sm btn-success" id="updateBatch">批量发放</button>
                            &nbsp;&nbsp;
                            <button type="button" class="btn btn-sm btn-danger" id="delBatch">批量删除</button>
                        </div>
                    </form>
                </div>

                <div class="box-body">
                    <!-- 数据表格 -->
                    <div class="table-box">
                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable" style="text-align: center;">
                            <thead>
                            <tr>
                                <th rowspan="2"  style="padding-right:0px;padding-bottom: 40px;" style="text-align: center;">
                                    <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th rowspan="2" style="text-align: center;padding-bottom: 40px;">月份</th>
                                <th rowspan="2" style="text-align: center;padding-bottom:40px ;">姓名</th>
                                <th colspan="2" style="text-align: center;">员工信息</th>
                                <th rowspan="2" style="text-align: center;padding-bottom:40px ;">应发工资</th>
                                <th rowspan="2" style="text-align: center;padding-bottom:40px ;">基本工资</th>
                                <th colspan="4" style="text-align: center;">补贴</th>
                                <th colspan="3" style="text-align: center;">奖金</th>
                                <th rowspan="2" style="text-align: center;padding-bottom:40px ;">实发工资</th>
                                <th rowspan="2" style="text-align: center;padding-bottom: 40px;">操作</th>
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
                                <%--存放工资数据--%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.box-body -->

                <!-- .box-footer-->
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
                <!-- /.box-footer-->
            </div>
        </section>
    </div>
    <!-- 内容区域 /-->
</div>

<script>

    $(function () {
        init();
        //查询按钮
        $("#selectBtn").click(function () {
            //alert($("#searchForm").serialize());
            $.ajax({
                url:"/salary/selectAll",
                data:$("#searchForm").serialize()+"&state=0",
                type:"post",
                success:function (result) {
                    build_salary_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            });
        });

        //发放按钮
        $(document).on("click",".update_btn",function () {
            //alert($(this).attr("salId"));
            $.ajax({
                url:"/salary/updateSal",
                type:"post",
                data:"salId="+$(this).attr("salId"),
                success:function (result) {
                    if(result == "200"){
                        alert("发放成功");
                        toPage(pageNum);
                    }else {
                        alert("发放失败")
                    }
                }
            });
        });

        //批量发放按钮
        $("#updateBatch").click(function () {
            var salIds = "";
            var empNames="";
            if($("input[type=checkbox]:checked").length > 0) {
                $("input[type=checkbox]:checked").each(function (index) {
                    empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
                    salIds += $(this).val() + "-";
                });
                //截取字符串后面的逗号？
                empNames = empNames.substring(0, empNames.length - 1);
                salIds = salIds.substring(0, salIds.length - 1);
                if (confirm("确认发放[ " + empNames + " ]的工资吗？")) {
                    $.ajax({
                        url: "/salary/updateSalOfBatch",
                        data: "salIds=" + salIds,
                        type: "post",
                        success: function (result) {
                            if (result == "200") {
                                alert("发放成功");
                                toPage(pageNum);
                            } else {
                                alert("发放失败");
                            }
                        }
                    });
                }
            }else {
                alert("请至少选择一条记录进行工资发放");
            }
        });

        //批量删除
        $("#delBatch").click(function () {
            var salIds = "";
            var empNames="";
            if($("input[type=checkbox]:checked").length > 0) {
                $("input[type=checkbox]:checked").each(function (index) {
                    empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
                    salIds += $(this).val() + "-";
                });
                //截取字符串后面的逗号？
                empNames = empNames.substring(0, empNames.length - 1);
                salIds = salIds.substring(0, salIds.length - 1);

                if (confirm("确认删除[ " + empNames + " ]的记录吗？")) {
                    $.ajax({
                        url: "/salary/deleteOfBatch",
                        data: "salIds=" + salIds,
                        type: "post",
                        success: function (result) {
                            if (result == "200") {
                                alert("删除成功");
                                toPage(pageNum);
                            } else {
                                alert("删除失败");
                            }
                        }
                    });

                }
            }else {
                alert("请至少选择一条记录进行删除");
            }
        });



        //删除
        $(document).on("click",".del_btn",function () {
            //alert($(this).attr("salId"));
            var name = $(this).parents("tr").find("td:eq(2)").text();
            if(confirm("确认删除[ "+name+" ]吗？")) {
                $.ajax({
                    url: "/salary/updateSal",
                    type: "post",
                    data: "salId=" + $(this).attr("salId"),
                    success: function (result) {
                        if (result == "200") {

                            toPage(pageNum);
                        }
                    }
                });
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

    //构建表格
    function build_salary_table(result){
        $("#dataList tbody").empty();
        $.each(result.list,function (index,item) {
            var tr = $("<tr></tr>");
            var checkBoxTd = $("<td></td>").append($("<input type='checkbox'>").attr("value",item.salId));
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
            var updateBtn = $("<button></button>").addClass("btn btn-sm  btn-success update_btn").attr("salId",item.salId).append("发放");
            var delBtn = $("<button></button>").addClass("btn btn-sm  btn-danger del_btn").attr("salId",item.salId).append("删除");
            var btnTd = $("<td></td>").append(updateBtn).append(" ").append(delBtn);

            tr.append(checkBoxTd).append(monTd).append(empNameTd).append(empIdTd).append(deptNameTd).
            append(shouldSalTd).append(baseMoneyTd).append(foodSalTd).append(posSalTd).
            append(trafficSalTd).append(businessTripSalTd).append(workSalTd).append(titleSal).append(overTimeSal).
            append(realSalTd).append(btnTd);
            tr.appendTo("#dataList tbody");
        });
    }

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
            data:$("#searchForm").serialize()+"&state=0&pn="+pn,
            type:"get",
            success:function (result) {
                build_salary_table(result);
                build_page_info(result);
                build_page_nav(result);
            }

        });
    }

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