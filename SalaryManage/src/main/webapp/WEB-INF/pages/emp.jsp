<%--
  Created by IntelliJ IDEA.
  User: 丶孤杨傲立
  Date: 2020/8/31
  Time: 14:42
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
    <%--模态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="addModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="title">员工管理</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="addForm">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">姓名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="empName" placeholder="请输入姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">性别</label>
                            <div class="col-sm-6">
                                <label class="radio-inline">
                                    <input type="radio" name="empSex" checked="checked" value="0"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="empSex" value="1"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学历</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="empEdu" placeholder="请输入学历">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">电话</label>
                            <div class="col-sm-6">
                                <input type="tel" class="form-control" name="empTel" placeholder="请输入电话">
                            </div>
                        </div>
                        <%--职称--%>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">职称</label>
                            <div class="col-sm-6">
                                <select name="titleId" class="form-control col-md-6">

                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">紧急联系人</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="empSosName" placeholder="请输入紧急联系人">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">紧急联系人电话</label>
                            <div class="col-sm-6">
                                <input type="tel" class="form-control" name="empSosTel" placeholder="请输入紧急联系人电话">
                            </div>
                        </div>
                        <%--岗位--%>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">岗位</label>
                            <div class="col-sm-6">
                                <select name="postId" class="form-control col-md-6">

                                </select>
                            </div>
                        </div>
                        <%--部门--%>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">部门</label>
                            <div class="col-sm-6">
                                <select name="deptId" class="form-control col-md-6">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">基本工资</label>
                            <div class="col-sm-6">
                                <input type="number" class="form-control" name="baseMoney" placeholder="请输入基本工资">
                            </div>
                        </div>




                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="saveBtn">保存</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->




    <!-- 内容区域 -->
    <div class="content-wrapper">
        <!-- 内容头部 -->
        <section class="content-header">
            <div class="box box-primary" style="height: 810px;">
                <div class="box-header with-border">
                    <h3 class="box-title">员工列表</h3>
                </div>
                <div class="" style="padding-left: 10px;padding-right: 10px;padding-top: 15px;font-size: 20px;">
                    <form class="form-inline" id="emp_nav_form">
                        <div class="form-group">
                            <label for="empId">员工工号：</label>
                            <input type="text" name="empId" class="form-control" id="empId" >
                        </div>
                        <div class="form-group">
                            <label for="empName">&nbsp;&nbsp;&nbsp;&nbsp;员工姓名：</label>
                            <input type="text" name="empName" class="form-control" id="empName">
                            <label for="deptId">&nbsp;&nbsp;&nbsp;&nbsp;部门：</label>
                        </div>
                        <div class="form-group">
                            <select id="deptId" name="deptId" class="form-control col-md-4">
                            </select>

                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-sm btn-success" id="searchBtn">&nbsp;&nbsp;查询&nbsp;&nbsp;</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <div style="float: right;">
                            <button type="button" class="btn btn-sm btn-success" id="addBtn">添加</button>
                            &nbsp;&nbsp;
                            <button type="button" class="btn btn-sm btn-danger" id="delBatch">批量删除</button>
                        </div>
                    </form>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->


                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable" style="text-align: center;">
                            <thead>
                            <tr style="font-size: 20px;">
                                <th class="" style="padding-right:0px;" style="text-align: center;">
                                    <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th style="text-align: center;">工号</th>
                                <th style="text-align: center;">姓名</th>
                                <th style="text-align: center;">性别</th>
                                <th style="text-align: center;">学历</th>
                                <th style="text-align: center;">电话</th>
                                <th style="text-align: center;">职称</th>
                                <th style="text-align: center;">紧急联系人</th>
                                <th style="text-align: center;">岗位</th>
                                <th style="text-align: center;">部门</th>
                                <th style="text-align: center;">基本工资</th>
                                <th style="text-align: center;">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        <!--数据列表/-->
                    </div>
                    <!-- 数据表格 /-->
                </div>
                <!-- /.box-body -->

                <!-- .box-footer-->
                <div class="box-footer" id="page_info">
                    <%--分页信息--%>
                </div>

                <div class="box-tools pull-right" id="page_nav_area">
                    <%--分页条--%>
                </div>

                </div>
                <!-- /.box-footer-->



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

    $(function () {

        init();//查询员工信息

        //条件查询
        $("#searchBtn").click(function () {
            /*var info = $("#emp_nav_form").serialize();
            alert(info);*/
            $.ajax({
                url:"/emp/selectAll",
                data:$("#emp_nav_form").serialize(),
                type:"get",
                success:function (result) {
                    // alert(result);
                    // console.log(result);
                    build_emps_table(result);
                    build_page_info(result);
                    build_page_nav(result);

                }
            });
        });

        //添加按钮
        $("#addBtn").click(function () {
            $('#addModal').modal('toggle');

            $("#addModal form input").val("");


            $("#saveBtn").text("保存");
            $("#addModal").attr("state","0");
            selectDept("#addModal select[name=deptId]");
            selectPost("#addModal select[name=postId]");
            selectTitle("#addModal select[name=titleId]");
        });

        //模态框保存按钮
        $("#saveBtn").click(function () {
            if($("#addModal").attr("state") == "0"){
                $.ajax({
                    url:"/emp/insertEmp",
                    data:$("#addForm").serialize(),
                    type:"post",
                    success:function (result) {
                        if(result == "200"){
                            //alert("插入成功");
                            toPage(lastPage);

                            $('#addModal').modal('hide');
                        }
                    }
                });
            }else{
                // alert($(this).attr("empid"));
                $.ajax({
                    url:"/emp/updateEmp",
                    data:$("#addForm").serialize()+"&empId="+$(this).attr("empId"),
                    type:"post",
                    success:function (result) {
                        if(result == "200"){
                            //alert("插入成功");
                            toPage(pageNum);
                            $('#addModal').modal('hide');
                        }
                    }
                });

            }
            //alert($("#addForm").serialize());

        });
        //编辑按钮
        $(document).on("click",".edit_btn",function () {
            $('#addModal').modal('toggle');
            $("#addModal").attr("state","1");
            $("#saveBtn").attr("empid",$(this).attr("empId"));
           // $("#addModal").attr("empId",$(this).attr("empId"));
            selectDept("#addModal select[name=deptId]");
            selectPost("#addModal select[name=postId]");
            selectTitle("#addModal select[name=titleId]");

            //alert($(this).attr("empId"));
            $.ajax({
                url:"/emp/selectOne",
                data:"empId="+$(this).attr("empId"),
                type:"post",
                success:function (result) {
                    //alert(result);
                    $("#addForm input[name=empName]").val(result.empName);
                    $("#addForm input[name=empSex]").val(result.empSex);
                    $("#addForm input[name=empEdu]").val(result.empEdu);
                    $("#addForm input[name=empTel]").val(result.empTel);
                    $("#addForm [name=titleId]").val(result.titleId);
                    $("#addForm input[name=empSosName]").val(result.empSosName);
                    $("#addForm input[name=empSosTel]").val(result.empSosTel);
                    $("#addForm [name=empName]").val(result.empName);
                    $("#addForm [name=postId]").val(result.postId);
                    $("#addForm [name=deptId]").val(result.deptId);
                    $("#addForm [name=baseMoney]").val(result.baseMoney);
                }
            });
        });
        //删除按钮
        $(document).on("click",".del_btn",function () {
            //alert($(this).attr("empId"));
            var name = $(this).parents("tr").find("td:eq(2)").text();
            if(confirm("确认删除[ "+name+" ]吗？")) {
                $.ajax({
                    url: "/emp/deleteEmp",
                    data: "empId=" + $(this).attr("empId"),
                    type: "post",
                    success: function (result) {
                        if (result == "200") {
                            //init();
                            toPage(pageNum);
                        }
                    }
                });
            }
        });
        //批量删除
        $("#delBatch").click(function () {
            var empIds = "";
            var empNames="";

            $("input[type=checkbox]:checked").each(function (index) {
                empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
                empIds += $(this).val() + "-";
                //empIds +=this.value+"-";
               // alert();

            });
            //截取字符串后面的逗号？
            empNames = empNames.substring(0,empNames.length-1);
            empIds = empIds.substring(0,empIds.length-1);

            // alert(empIds);
            if(confirm("确认删除[ "+empNames+" ]吗？")){
                $.ajax({
                    url:"/emp/deleteEmpOfBatch",
                    data:"ids="+empIds,
                    type:"post",
                    success:function (result) {
                        if(result=="200"){
                            toPage(pageNum);
                            alert("删除成功");
                        }else {
                            alert("删除失败");
                        }

                    }
                });

            }


        });


        //查询部门信息
        function selectDept(element) {
            $(element).empty();
            $.ajax({
                url:"/dept/selectAll",
                type:"get",
                success:function (result) {
                    if(element != "#addModal select[name=deptId]"){
                        $(element).append("<option></option>");
                    }
                    $.each(result,function (index,item) {
                        var deptOption = $("<option></option>").append(item.deptName).attr("value",item.deptId);
                        deptOption.appendTo(element);
                        // alert(item.deptName);
                    });
                }
            });
        }
        //查询岗位表
        function selectPost(element) {
            $(element).empty();
            $.ajax({
                url:"/post/selectAllForData",
                type:"get",
                success:function (result) {

                    /*$(element).append("<option></option>");*/
                    $.each(result,function (index,item) {
                        var deptOption = $("<option></option>").append(item.postName).attr("value",item.postId);
                        deptOption.appendTo(element);
                        // alert(item.deptName);
                    });
                }
            });
        }
        //查询职称表
        function selectTitle(element) {
            $(element).empty();
            $.ajax({
                url:"/title/selectAllForData",
                type:"get",
                success:function (result) {
                    $.each(result,function (index,item) {
                        var deptOption = $("<option></option>").append(item.titleName).attr("value",item.titleId);
                        deptOption.appendTo(element);
                        // alert(item.deptName);
                    });
                }
            });
        }
        //初始化员工信息
        function init() {
            selectDept("#deptId");//查询部门信息
            $.ajax({
                url: "/emp/selectAll",
                type:"get",
                success:function (result) {
                    build_emps_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            });

        }
        //解析员工数据
        function build_emps_table(result) {
            $("#dataList tbody").empty();
            $.each(result.list,function (index,item) {
                var tr = $("<tr></tr>");
                var checkBoxTd = $("<td></td>").append($("<input type='checkbox' name='empIds'/>").attr("value",item.empId));
                var empIdTd=$("<td></td>").append(item.empId);
                var empNameTd=$("<td></td>").append(item.empName);
                var empSexTd=$("<td></td>").append(item.empSex ==0?'女':'男');
                var empEduTd=$("<td></td>").append(item.empEdu);
                var empTelTd=$("<td></td>").append(item.empTel);
                var empTitleNameTd=$("<td></td>").append(item.title.titleName);
                var empSosNameTd=$("<td></td>").append(item.empSosName);
                var empPostTd=$("<td></td>").append(item.post.postName);
                var empDeptTd=$("<td></td>").append(item.dept.deptName);
                var baseMoneyTd=$("<td></td>").append(item.baseMoney);
                var editBtn = $("<button></button>").append("编辑").addClass("btn btn-sm  btn-success edit_btn").attr("empId",item.empId);
                var delBtn = $("<button></button>").append("删除").addClass("btn btn-sm  btn-danger del_btn").attr("empId",item.empId);
                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                tr.append(checkBoxTd).append(empIdTd).append(empNameTd).append(empSexTd).append(empEduTd).
                append(empTelTd).append(empTitleNameTd).append(empSosNameTd).append(empPostTd).append(empDeptTd)
                    .append(baseMoneyTd).append(btnTd);
                tr.appendTo("#dataList tbody");
            });
        }
        //解析分页信息
        var pageNum = null;
        var lastPage = null;
        function build_page_info(result) {
            $("#page_info").empty();
            pageNum = result.pageNum;
            lastPage = result.total;
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
                url:"/emp/selectAll",
                data:$("#emp_nav_form").serialize()+"&pn="+pn,
                type:"get",
                success:function (result) {
                    build_emps_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }

            });
        }


    });

</script>
</body>

</html>
<!---->
