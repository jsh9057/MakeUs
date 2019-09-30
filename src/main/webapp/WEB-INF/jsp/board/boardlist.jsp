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
        <div class="container-fluid  dashboard-content">
            <!-- ============================================================== -->
            <!-- pageheader -->
            <!-- ============================================================== -->
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="page-header">
                        <h2 class="pageheader-title">General Tables</h2>
                        <p class="pageheader-text">Proin placerat ante duiullam
                            scelerisque a velit ac porta, fusce sit amet vestibulum mi.
                            Morbi lobortis pulvinar quam.</p>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"
                                                                   class="breadcrumb-link">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="#"
                                                                   class="breadcrumb-link">Tables</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">General
                                        Tables</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end pageheader -->
            <!-- ============================================================== -->

            <div class="row">
                <!-- ============================================================== -->
                <!-- end bordered table -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- hoverable table -->
                <!-- ============================================================== -->
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="card">
                   
                        <h5 class="card-header">Hoverable Table<a class="btn btn-primary" href="#" style="float:right">글쓰기</a></h5>
                        <div class="card-body">
                            <table class="table table-hover">
                                <colgroup>
                                    <col width="10%"/>
                                    <col width="*"/>
                                    <col width="10%"/>
                                    <col width="10%"/>
                                    <col width="10%"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">작성일</th>
                                    <th scope="col">조회수</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="element" items="${list}">
                                <tr onclick="location.href='/detail/${element.postNo}'">
                                    <th scope="col"><font size="1">${element.postNo}</font></th>
                                    <th scope="col"><b>${element.postTitle}</b></th>
                                    <th scope="col">${element.fk_postNick}</th>
                                    <th scope="col"><font size="1">${element.postDate}</font></th>
                                    <th scope="col"><font size="1">${element.hits}</font></th>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <nav aria-label="Page navigation example" style="margin: auto">
                                                <ul class="pagination">
                                                    <li class="page-item">
                                                        <a class="page-link" aria-label="Previous" href="#">
                                                            <span aria-hidden="true">«</span><span class="sr-only">Previous</span>      </a>
                                                    </li>
                                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                                                    <li class="page-item">
                                                        <a class="page-link" aria-label="Next" href="#"><span aria-hidden="true">»</span>
                                                           <span class="sr-only">Next</span></a>
                                                    </li>
                                                </ul>
                                            </nav>
                <!-- ============================================================== -->
                <!-- end hoverable table -->
                <!-- ============================================================== -->
            </div>

        </div>
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <div class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                        Copyright © 2018 Concept. All rights reserved. Dashboard by <a
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
<script src="../assets/vendor/custom-js/jquery.multi-select.html"></script>
<script src="../assets/libs/js/main-js.js"></script>
<script type="text/javascript">
	$(document).ready(function(){$("#header").load("/header");});
	</script>
	<script type="text/javascript">
	$(document).ready(function(){$("#menu").load("/menu");});
	</script>
</body>

</html>