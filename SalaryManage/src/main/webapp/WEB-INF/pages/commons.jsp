<%--
  Created by IntelliJ IDEA.
  User: 丶孤杨傲立
  Date: 2020/8/31
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="../../plugins/morris/morris.css">
    <link rel="stylesheet" href="../../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="../../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../../plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="../../plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="../../plugins/select2/select2.css">
    <link rel="stylesheet" href="../../plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="../../plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="../../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="../../plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="../../plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="../../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>
<body>
<!-- 页面头部 -->
<header class="main-header">
    <!-- Logo -->
    <a href="index" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>ESMS</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg">ESMS&nbsp;&nbsp;|&nbsp;&nbsp;管理员端</span>
    </a>


    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

       <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

                <li class="dropdown user user-menu">
                    <a href="#" id="tologout">注销</a>
                </li>

            </ul>
        </div>



    </nav>
</header>
<!-- 页面头部 /-->

<!-- 导航侧栏 -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">


        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index"><a href="/index"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-users"></i> <span>员工管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="emp">
                        <a href="/emp">
                            <i class="fa fa-angle-right"></i> 员工列表
                        </a>
                    </li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-sitemap"></i> <span>部门管理</span>
                    <span class="pull-right-container">
					        <i class="fa fa-angle-left pull-right"></i>
					    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="dept">
                        <a href="/dept/selectAll1">
                            <i class="fa fa-angle-right"></i> 部门列表
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-suitcase"></i> <span>岗位管理</span>
                    <span class="pull-right-container">
					        <i class="fa fa-angle-left pull-right"></i>
					    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="post">
                        <a href="/post/selectAll">
                            <i class="fa fa-angle-right"></i> 岗位列表
                        </a>
                    </li>
                </ul>
            </li>


            <li class="treeview">
                <a href="#">
                    <i class="fa fa-tasks"></i> <span>职称奖金管理</span>
                    <span class="pull-right-container">
					        <i class="fa fa-angle-left pull-right"></i>
					    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="title">
                        <a href="/title/selectAll">
                            <i class="fa fa-angle-right"></i> 职称列表
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-gg"></i> <span>工龄奖金管理</span>
                    <span class="pull-right-container">
					        <i class="fa fa-angle-left pull-right"></i>
					    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="workTimes">
                        <a href="/workYears/selectAll">
                            <i class="fa fa-angle-right"></i> 工龄列表
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-tags"></i> <span>工资项管理</span>
                    <span class="pull-right-container">
					        <i class="fa fa-angle-left pull-right"></i>
					    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="wageItems">
                        <a href="/wageItems">
                            <i class="fa fa-angle-right"></i> 工资项
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-paper-plane"></i> <span>月考勤管理</span>
                    <span class="pull-right-container">
					        <i class="fa fa-angle-left pull-right"></i>
					    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="checks">
                        <a href="/checks/selectAll">     <%--${pageContext.request.contextPath}--%>
                            <i class="fa fa-angle-right"></i> 月考勤列表
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-tag"></i> <span>工资管理</span>
                    <span class="pull-right-container">
					        <i class="fa fa-angle-left pull-right"></i>
					    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="calWage">
                        <a href="/calWage">
                            <i class="fa fa-angle-right"></i> 工资结算
                        </a>
                    </li>

                    <li id="salary">
                        <a href="/salary">
                            <i class="fa fa-angle-right"></i> 工资发放
                        </a>
                    </li>

                    <li id="findSal">
                        <a href="/findSal">
                            <i class="fa fa-angle-right"></i> 工资查询
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-file-text"></i> <span>图表显示</span>
                    <span class="pull-right-container">
					        <i class="fa fa-angle-left pull-right"></i>
					    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="empsCount">
                        <a href="/empsCount">
                            <i class="fa fa-angle-right"></i> 部门人数统计柱状图
                        </a>
                    </li>

                    <li id="deptSal">
                        <a href="/deptSal">
                            <i class="fa fa-angle-right"></i> 各部门的工资折线图
                        </a>
                    </li>
                    <li id="deptSalRatio">
                        <a href="/deptSalRatio">
                            <i class="fa fa-angle-right"></i> 部门工资占比饼状图
                        </a>
                    </li>


                </ul>
            </li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<!-- 导航侧栏 /-->

<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../../plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../../plugins/raphael/raphael-min.js"></script>
<script src="../../plugins/morris/morris.min.js"></script>
<script src="../../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../../plugins/knob/jquery.knob.js"></script>
<script src="../../plugins/daterangepicker/moment.min.js"></script>
<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../../plugins/fastclick/fastclick.js"></script>
<script src="../../plugins/iCheck/icheck.min.js"></script>
<script src="../../plugins/adminLTE/js/app.min.js"></script>
<script src="../../plugins/treeTable/jquery.treetable.js"></script>
<script src="../../plugins/select2/select2.full.min.js"></script>
<script src="../../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="../../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="../../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../../plugins/ckeditor/ckeditor.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../../plugins/chartjs/Chart.min.js"></script>
<script src="../../plugins/flot/jquery.flot.min.js"></script>
<script src="../../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="../../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
</body>

<script>
    $("#tologout").click(function () {

        var flag =confirm("确定要退出吗？");
        if (flag){
            window.location.href="/tologout";
        }

    });
</script>
</html>
