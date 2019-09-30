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
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

						<div class="card">
							<h5 class="card-header">
								<b>글쓰기</b>
							</h5>
							<div class="card-body">
								<form>
									<div class="form-group">
										<label class="col-form-label" for="inputText3">제목</label> <input
											class="form-control" id="inputText3" type="text">
									</div>
									<div class="form-group">
										<label for="exampleFormControlTextarea1">내용</label>
										<textarea class="form-control" id="exampleFormControlTextarea1" rows="20"></textarea>
									</div>
								</form>
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