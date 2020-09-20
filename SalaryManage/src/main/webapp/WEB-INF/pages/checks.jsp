<%--
  Created by IntelliJ IDEA.
  User: 丶孤杨傲立
  Date: 2020/8/31
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h3 class="box-title">月考勤列表</h3>
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
                            <select class="form-control col-md-4" id="deptId" name="deptId">
                                <option>请选择部门</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="mon">&nbsp;&nbsp;&nbsp;&nbsp;考勤月份：</label>
                            <input type="month" class="form-control" id="mon" name="mon">
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="submit" class="btn btn-sm btn-success" id="select">&nbsp;&nbsp;搜索&nbsp;&nbsp;</button>

                    </form>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <div style="float: right;">
                        <button  class="btn btn-sm btn-danger" id="batchDelete">批量删除</button>
                    </div>

                    <%--模态框--%>
                    <div class="modal fade bs-example-modal-lg" tabindex="-1" id="addDeptModal" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">月考勤管理</h4>
                                </div>
                                <form class="form-horizontal" id="insertForm">
                                    <div class="form-group">
                                        <label for="checksId" class="col-sm-4 control-label"></label>
                                        <div class="col-sm-6">
                                            <input type="hidden" class="form-control" id="checksId" name="checksId" >
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="mon1" class="col-sm-4 control-label">月份：</label>
                                        <div class="col-sm-6">
                                            <input type="month" class="form-control" id="mon1" name="mon">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="empName1" class="col-sm-4 control-label">姓名：</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="empName1" name="emp.empName">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="empId1" class="col-sm-4 control-label">工号：</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="empId1" name="empId">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="deptId1" class="col-sm-4 control-label">部门名称：</label>
                                        <div class="col-sm-6">
                                            <select class="form-control col-md-2" id="deptId1" name="deptId">
                                                <option>请选择部门</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="sickLeave1" class="col-sm-4 control-label">病假天数：</label>
                                        <div class="col-sm-6">
                                            <input type="number" class="form-control" id="sickLeave1" name="sickLeave">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="affairLeave1" class="col-sm-4 control-label">事假天数：</label>
                                        <div class="col-sm-6">
                                            <input type="number" class="form-control" id="affairLeave1" name="affairLeave">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="usualHour1" class="col-sm-4 control-label">平时加班小时数：</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="usualHour1" name="usualHour">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="weekHour1" class="col-sm-4 control-label">周末加班小时数：</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="weekHour1" name="weekHour">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="holidayHour1" class="col-sm-4 control-label">节假日加班小时数：</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="holidayHour1" name="holidayHour">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="late1" class="col-sm-4 control-label">迟到次数：</label>
                                        <div class="col-sm-6">
                                            <input type="number" class="form-control" id="late1" name="late">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="early1" class="col-sm-4 control-label">早退次数：</label>
                                        <div class="col-sm-6">
                                            <input type="number" class="form-control" id="early1" name="early">
                                        </div>
                                    </div>

                                </form>


                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="button" class="btn btn-primary btn-success" id="insert" data-dismiss="modal" stuts="1">保存</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
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
                                <th colspan="2" style="text-align: center;">请假天数</th>
                                <th colspan="3" style="text-align: center;">加班小时</th>
                                <th colspan="2" style="text-align: center;">考勤</th>
                                <th rowspan="2" style="text-align: center;padding-bottom: 40px;">操作</th>
                            </tr>
                            <tr >
                                <th style="text-align: center;">工号</th>
                                <th style="text-align: center;">部门</th>
                                <th style="text-align: center;">病假</th>
                                <th style="text-align: center;">事假</th>
                                <th style="text-align: center;">平时加班</th>
                                <th style="text-align: center;">周末加班</th>
                                <th style="text-align: center;">节假日加班</th>
                                <th style="text-align: center;">迟到次数</th>
                                <th style="text-align: center;">早退次数</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${requestScope.pageInfo.list}" var="checks" >

                                <tr >
                                    <td><input name="ids" type="checkbox" class="fuxuan" value="${checks.checksId}"></td>
                                    <td>${checks.mon}</td>
                                    <td>${checks.emp.empName}</td>
                                    <td>${checks.empId}</td>
                                    <td>${checks.dept.deptName}</td>
                                    <td>${checks.sickLeave}</td>
                                    <td>${checks.affairLeave}</td>
                                    <td>${checks.usualHour}</td>
                                    <td>${checks.weekHour}</td>
                                    <td>${checks.holidayHour}</td>
                                    <td>${checks.late}</td>
                                    <td>${checks.early}</td>
                                    <td class="text-center" >
                                        <button type="button" class="btn btn-sm  btn-success update" data-toggle="modal" data-target="#addDeptModal" value="${checks.checksId}">编辑</button>
                                        <button type="button" class="btn btn-sm btn-danger" onclick='location.href="/checks/deleteChecks?checksId=${checks.checksId}"'>删除</button>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>

                        </table>
                        <!--数据列表/-->


                    </div>
                    <!-- 数据表格 /-->


                </div>
                <!-- /.box-body -->

                <!-- .box-footer-->
                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            总共${requestScope.pageInfo.pages} 页，共 ${requestScope.pageInfo.total}条数据。
                        </div>
                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <li>
                                <a href="/checks/selectAll?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                            </li>
                            <li><a href="/checks/selectAll?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>

                            <c:forEach  var="pagenum" items="${requestScope.pageInfo.navigatepageNums}">
                                <li><a href="/checks/selectAll?page=${pagenum}&size=${pageInfo.pageSize}">${pagenum}</a></li>
                            </c:forEach>

                            <li><a href="/checks/selectAll?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            <li>
                                <a href="/checks/selectAll?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
                            </li>
                        </ul>
                    </div>

                </div>
                <!-- /.box-footer-->


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

/*加载下拉列表部门名称*/
    $(function() {
            selectDept();
            function selectDept() {
                $("#deptId").empty();
                $.ajax({
                    url:"/checks/deptselectAll",
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
        }
    );



    /*异步条件查询*/
    var param = $("#searchForm").serialize();
    var url="/checks/selectAll" ;

    $("#select").click(function() {
        $.get(url,param);
    });


    /*批量删除*/
    $("#batchDelete").click(function() {
        var answer=window.confirm('您确定要删除吗?');
        if(answer){
            var checksIds="";
            $(".fuxuan:checked").each(function(index) {
                checksIds += $(this).attr("value")+",";
            });
            var url1="/checks/deleteChecksOfBatch";
            var param1={"checksIds":checksIds};
            $.post(url1,param1,function () {
                location.reload();
            });
        }
    });



    $(".update").click(function() {
        var checksId=$(this).attr("value") ;
        var param="checksId="+checksId;

        var url="/checks/selectChecksByChecksId" ;
        $.post(url,param,function(data) {

            $("#checksId").val(data.checksId);
            $("#empName1").val(data.emp.empName);
            $("#empId1").val(data.empId);
            $("#mon1").val(data.mon);
            $("#deptId1 option:selected").html(data.dept.deptName);
            $("#deptId1 option:selected").val(data.dept.deptId);
            $("#sickLeave1").val(data.sickLeave);
            $("#affairLeave1").val(data.affairLeave);
            $("#usualHour1").val(data.usualHour);
            $("#weekHour1").val(data.weekHour);
            $("#holidayHour1").val(data.holidayHour);
            $("#late1").val(data.late);
            $("#early1").val(data.early);
        });

        selectDept();
        function selectDept() {
            $("#deptId").empty();
            $.ajax({
                url:"/checks/deptselectAll",
                type:"get",
                success:function (result) {

                    $("#deptId1").append("<option></option>");
                    $.each(result,function (index,item) {
                        var deptOption = $("<option></option>").append(item.deptName).attr("value",item.deptId);
                        deptOption.appendTo("#deptId1");

                    });
                }
            });
        }

    });

    /*保存*/
    $("#insert").click(function() {
            var param=$("#insertForm").serialize();
            var url="/checks/updateChecks";
            $.post(url,param,function () {
                location.reload();
            });
    });

</script>
</body>

</html>
<!---->