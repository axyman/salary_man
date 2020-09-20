<%--
  Created by IntelliJ IDEA.
  User: 丶孤杨傲立
  Date: 2020/8/31
  Time: 14:20
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
                    <h3 class="box-title">部门列表</h3>
                </div>
                <div class="" style="padding-left: 20px;padding-right: 10px;padding-top: 15px;">
                    <form class="form-inline" action="/dept/selectDeptBydeptName" method="post">
                        <div class="form-group">
                            <label for="deptName">部门名称：</label>
                            <input type="text" class="form-control" id="deptName" name="deptName">
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="submit" class="btn btn-sm btn-success">&nbsp;&nbsp;搜索&nbsp;&nbsp;</button>
                    </form>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <div style="float: right;padding-right: 100px;">
                        <button type="submit" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addDeptModal" id="tianjia">添加</button>
                    </div>

                    <%--模态框--%>
                    <div class="modal fade bs-example-modal-lg" tabindex="-1" id="addDeptModal" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">部门管理</h4>
                                </div>
                                <form class="form-horizontal" id="insertForm">

                                    <div class="form-group">
                                        <label for="deptName1" class="col-sm-2 control-label"></label>
                                        <div class="col-sm-6">
                                            <input type="hidden" class="form-control" id="deptId" name="deptId" >
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="deptName1" class="col-sm-2 control-label">部门名称：</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="deptName1" name="deptName">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="deptDesc" class="col-sm-2 control-label"> 部门描述：</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="deptDesc"  name="deptDesc">
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

                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable" style="text-align: center;">
                            <thead>
                            <tr style="">
                                <th style="text-align: center;">部门名称</th>
                                <th style="text-align: center;">部门备注</th>
                                <th style="text-align: center;">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${requestScope.pageInfo.list}" var="dept" >
                                <tr style="">
                                    <td>${dept.deptName}</td>
                                    <td>${dept.deptDesc}</td>
                                    <td class="text-center" >
                                        <button type="button" class="btn btn-sm  btn-success update" data-toggle="modal" data-target="#addDeptModal" value="${dept.deptName}">编辑</button>
                                        <button type="button" class="btn btn-sm btn-danger" onclick='location.href="/dept/deleteDept?deptId=${dept.deptId}"'>删除</button>
                                    </td>
                                </tr>
                            </c:forEach>

                            <c:if test="${requestScope.dept.deptName != null}">
                                <tr style="">

                                    <td>${requestScope.dept.deptName}</td>
                                    <td>${requestScope.dept.deptDesc}</td>

                                    <td class="text-center" >
                                        <button type="button" class="btn btn-sm  btn-success update" data-toggle="modal" data-target="#addDeptModal" value="${requestScope.dept.deptName}" >编辑</button>
                                        <button type="button" class="btn btn-sm btn-danger" onclick='location.href="/dept/deleteDept?deptId=${dept.deptId}"'>删除</button>
                                    </td>
                                </tr>
                            </c:if>

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
                                <a href="/dept/selectAll1?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                            </li>
                            <li><a href="/dept/selectAll1?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>

                            <c:forEach  var="pagenum" items="${requestScope.pageInfo.navigatepageNums}">
                                <li><a href="/dept/selectAll1?page=${pagenum}&size=${pageInfo.pageSize}">${pagenum}</a></li>
                            </c:forEach>

                            <li><a href="/dept/selectAll1?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            <li>
                                <a href="/dept/selectAll1?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
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



    /*保存*/
    $("#insert").click(function() {
        if ( $("#insert").attr("stuts") == 1){
            var param=$("#insertForm").serialize();
            var url="/dept/insertDept";
            $.post(url,param);
        }else{
            var param=$("#insertForm").serialize();
            var url="/dept/updateDept";
            $.post(url,param,function () {
                location.reload();
            });
        }
    });

    /*添加*/
    $("#tianjia").click(function() {
        $("#insert").attr("stuts",1);/*0代表编辑，1代表添加*/
        $("#insertForm")[0].reset();

    });

    /*编辑*/
    $(".update").click(function () {
        $("#insert").attr("stuts",0);/*0代表编辑，1代表添加*/

        var deptName=$(this).attr("value");
        var param={"deptName":deptName};
        var url="/dept/selectDeptBydeptName2";
        $.post(url,param,function(data) {
            $("#deptId").val(data.deptId);
            $("#deptName1").val(data.deptName);
            $("#deptDesc").val(data.deptDesc);
        });
    });
</script>
</body>

</html>
<!---->
