<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet"
	href="assets/vendor/charts/chartist-bundle/chartist.css">
<link rel="stylesheet"
	href="assets/vendor/charts/morris-bundle/morris.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
<link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
<title>Concept - Bootstrap 4 Admin Dashboard Template</title>
</head>

<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
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
			<div class="dashboard-ecommerce">
				<div class="container-fluid dashboard-content ">
					<!-- ============================================================== -->
					<!-- pageheader  -->
					<!-- ============================================================== -->
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="page-header">
								<h2 class="pageheader-title">SEOKYEONG UNIVERSITY
								</h2>
								<h3>Computer Science</h3>
								<p class="pageheader-text">Nulla euismod urna eros, sit amet
									scelerisque torton lectus vel mauris facilisis faucibus at enim
									quis massa lobortis rutrum.</p>
								<div class="page-breadcrumb"></div>
							</div>
						</div>
					</div>

					<div class= "row">

					<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
						<div class="card text-white">
							<img class="card-img" src="../assets/images/card-img.jpg"
								alt="Card image">
							<div class="card-img-overlay">
								<h3 class="card-title  text-white">서경대학교</h3>
								<p class="card-text">SKUNIV</p>
								<p class="card-text">SINCE 1947</p>
								<a href="https://www.skuniv.ac.kr/main" class="btn btn-primary">Go somewhere</a>
								
							</div>
						</div>
					</div>
						<!-- ============================================================== -->
						<!-- end pageheader  -->
						<!-- ============================================================== -->
							<div class="col-xl 6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="card">
									<h5 class="card-header"><b>${boardNm}</b><a href="/board/${list[0].fk_boardNo}" style="float:right">더보기</a></h5>
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

                                            <c:set var="l" value="${fn:length(list)}" />
											<c:forEach var="element" items="${list}" varStatus="status">
												<tr onclick="location.href='/detail/${element.postNo}'" style="cursor:pointer;">
													<th scope="col"><font size="1">${l - status.index}</font></th>
													<th scope="col">${element.postTitle}  &nbsp; &nbsp; &nbsp;<c:if test="${element.img == true}"><span class="badge badge-pill badge-success "><i class="fas fa-image"></i></span>  </c:if>
														<c:if test="${element.file == true}"><span class="badge badge-pill badge-primary ">첨부파일</span> </c:if><c:if test="${element.commentCount >0}"><span class="badge badge-success">${element.commentCount}</span></c:if></th>
													<th scope="col" >${element.fk_postNick}</th>
													<th scope="col"><font size="1" > ${element.postDate} </font></th>
													<th scope="col"><font size="1">${element.hits}</font></th>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
					</div>
					
					<div class="col-xl 6 col-lg-6 col-md-6 col-sm-6 col-6">
								<div class="card">
									<h5 class="card-header">${boardNm2}<a href="/board/${list2[0].fk_boardNo}" style="float:right">더보기</a></h5>
									<div class="card-body">
										<table class="table table-hover">
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
                                            <c:set var="l2" value="${fn:length(list2)}" />
											<c:forEach var="element" items="${list2}" varStatus="status">
												<tr onclick="location.href='/detail/${element.postNo}'" style="cursor:pointer;">
													<th scope="col"><font size="1">${l2 - status.index}</font></th>
													<th scope="col">${element.postTitle}  &nbsp; &nbsp; &nbsp;<c:if test="${element.img == true}"><span class="badge badge-pill badge-success "><i class="fas fa-image"></i></span>  </c:if>
														<c:if test="${element.file == true}"><span class="badge badge-pill badge-primary ">첨부파일</span> </c:if><c:if test="${element.commentCount >0}"><span class="badge badge-success">${element.commentCount}</span></c:if></th>
													<th scope="col" >${element.fk_postNick}</th>
													<th scope="col"><font size="1" > ${element.postDate} </font></th>
													<th scope="col"><font size="1">${element.hits}</font></th>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							
							
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
							<div class="text-md-right footer-links d-none d-sm-block">
								<a href="javascript: void(0);">About</a> <a
									href="javascript: void(0);">Support</a> <a
									href="javascript: void(0);">Contact Us</a>
							</div>
						</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- end footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- end wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- end main wrapper  -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<!-- jquery 3.3.1 -->
	<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<!-- bootstap bundle js -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<!-- slimscroll js -->
	<script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<!-- main js -->
	<script src="assets/libs/js/main-js.js"></script>
	<!-- chart chartist js -->
	<script src="assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
	<!-- sparkline js -->
	<script src="assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
	<!-- morris js -->
	<script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
	<script src="assets/vendor/charts/morris-bundle/morris.js"></script>
	<!-- chart c3 js -->
	<script src="assets/vendor/charts/c3charts/c3.min.js"></script>
	<script src="assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
	<script src="assets/vendor/charts/c3charts/C3chartjs.js"></script>
	<script src="assets/libs/js/dashboard-ecommerce.js"></script>
	<script src="assets/libs/js/dashboard-ecommerce.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){$("#header").load("/header");});
	</script>
	<script type="text/javascript">
	$(document).ready(function(){$("#menu").load("/menu");});
	</script>
</body>

</html>