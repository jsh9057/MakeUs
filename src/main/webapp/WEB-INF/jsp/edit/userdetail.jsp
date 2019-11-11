<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="../assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="../assets/vendor/fonts/circular-std/style.css"
          rel="stylesheet">
    <link rel="stylesheet" href="../assets/libs/css/style.css">
    <link rel="stylesheet"
          href="../assets/vendor/fonts/fontawesome/css/fontawesome-all.css">

</head>

<body>
<!-- ============================================================== -->
<!-- main wrapper -->
<!-- ============================================================== -->
<div class="dashboard-main-wrapper">
    <!-- ============================================================== -->
    <!-- navbar -->
    <!-- ============================================================== -->
    <div id="header"></div>
    <!-- ============================================================== -->
    <!-- end navbar -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- left sidebar -->
    <!-- ============================================================== -->
    <div id="menu"></div>
    <!-- ============================================================== -->
    <!-- end left sidebar -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- wrapper  -->
    <!-- ============================================================== -->
    <div class="dashboard-wrapper">
        <div class="container-fluid dashboard-content">

            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-11">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="card">


                        <h5 class="card-header">

                        </h5>

                        <div class="card-body">
                            <div class="media">
                                <div class="media-body" style="padding: 10px 100px 100px 70px">
                                    <!-- 제목 -->
                                    <h5>
                                        <b><font size="10">${detail.name}<font color="black" ><c:if test="${detail.ps == true}"> (교수님)</c:if><c:if test="${detail.ps == false}"> (학생)</c:if></font>
                                        </font></b>
                                    </h5>
                                    <div style="padding:  30px 30px 10px">
                                        <font color="black" size="6"><pre>학번 : <c:out value="${detail.userId}"/></pre></font>
                                        <font color="black" size="6"><pre>학년 : <c:out value="${detail.grade}"/></pre></font>
                                        <font color="black" size="6"><pre>Email : <c:out value="${detail.email}"/></pre></font>
                                        <font color="black" size="6"><pre>Phone : <c:out value="${detail.phone}"/></pre></font>
                                        <font color="black" size="6"><pre>가입일자 : <c:out value="${detail.login_date}"/></pre></font>
                                    </div>
                                </div>
                            </div>
                            <div style="border: 1px; float: right;">
                                <a class="btn btn-outline-primary" href="../usereditdo/${detail.userId}" ><c:if test="${detail.ps==true}">학생으로</c:if>
                                    <c:if test="${detail.ps==false}">교수로</c:if></a>

                            </div>
                        </div>
                    </div>


                </div>
            </div>

        </div>
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <div class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                        Copyright Â© 2018 Concept. All rights reserved. Dashboard by <a
                            href="https://colorlib.com/wp/">Colorlib</a>.
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                        <div class="text-md-right footer-links d-none d-sm-block">
                            <a href="javascript: void(0);">About</a> <a
                                href="javascript: void(0);">Support</a> <a
                                href="javascript: void(0);">Contact Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end footer -->
        <!-- ============================================================== -->
    </div>
</div>
<!-- ============================================================== -->
<!-- end main wrapper -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<script src="../assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="../assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<script src="../assets/libs/js/main-js.js"></script>
<script type="text/javascript">
    $(document).ready(function(){$("#header").load("/header");});
</script>
<script type="text/javascript">
    $(document).ready(function(){$("#menu").load("/menu");});
</script>
</body>

</html>