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
								<div style="border: 1px; float: left; width: 33%;">${detail.fk_postNick}</div>
								<div style="border: 1px; float: left; width: 33%;">
									${detail.postDate}</div>
								<div style="border: 1px; float: right;">Hit :
									${detail.hits}</div>
							</h5>

							<div class="card-body">
								<div class="media">
									<div class="media-body" style="padding: 10px 100px 100px 70px">
										<!-- 제목 -->
										<h5>
											<b>${detail.postTitle}</b>
										</h5>
											<c:if test="${!empty files}">
												<c:forEach var="file" items="${files}" varStatus="status">
													<c:if test="${file.img==false}" >
														<div class="card-header p-4">
															<p class="fas fa-download"><a href="/fileDown/${file.fileNo}">${file.fileOriNm}(${file.size})</a></p>
														</div>
													</c:if>
												</c:forEach>
											</c:if>
										<div style="padding: 30px 10px 100px 10px">
											<c:if test="${!empty files}">
												<c:forEach var="file" items="${files}" varStatus="status">
													<c:if test="${file.img==true}" >
														<img src = "/display?name=${file.fileNm}" style="max-width: 50%; height: auto;" />
													</c:if>
												</c:forEach>
											</c:if>
											<br/>
											<font color="black" id = "content"><pre style="word-wrap: break-word;white-space: pre-wrap;white-space: -moz-pre-wrap;white-space: -pre-wrap;white-space: -o-pre-wrap;word-break:break-all;"><c:out value="${detail.postContents}"/></pre></font>
										</div>

									</div>
								</div>
								<a  class="btn btn-primary" href="/board/${detail.fk_boardNo}" style="float:right">목록가기</a>
								<div style="border: 1px; float: right;">
								<c:if test="${U==true}"><a class="btn btn-outline-primary" href="/update/${detail.postNo}" onclick="return updatePost();" >수정</a></c:if>
									<c:if test="${D==true}"><a class="btn btn-outline-danger" id="del" href="/delete/${detail.fk_boardNo}/${detail.postNo}" onclick="return deletePost();">삭제</a></c:if>
									<script>
										function updatePost() {
											return confirm("게시글을 '수정' 하시겠습니까?");
										}

										function deletePost() {
											return confirm("게시글을 '삭제' 하시겠습니까?");

										}



									</script>

								</div>
							</div>
						</div>

						<form id="commentForm" name="commentForm" method="post">
							<div class="input-group mb-3">
								<input type="hidden" name = "postNo" value="${detail.postNo}">
								<input type="hidden" name="boardNo" value="${detail.fk_boardNo}">
								<textarea class="form-control" type="text" id="commentInput" name="content" cols ="30" placeholder="댓글을 입력하세요"></textarea>
								<div class="input-group-append">
									<button href="#" onclick="addComment(${result.code})" class="btn btn-primary" type="button">댓글 입력</button>
								</div>
							</div>

						<script>

							function addComment() {
								if($("#commentInput").val()==""){
									alert("내용을 적어주십시오.");
									return ;
								}
								$.ajax({
									type: 'post',
									url: "/rest/addComment",
									data: $("#commentForm").serialize(),
									success: function (data) {
										if(data=="success")
										{
											getCommentList();
											$("#commentInput").val("");
										}
										else if(data=="fail"){
											alert("작성 권한이 없습니다.");
											$("#commentInput").val("");
										}
										else if(data == "fail/login"){
											 alert("로그인을 해야합니다.");
											$("#commentInput").val("");
										}
									},
									error: function (error) {
										console.log(error);
									}
								});
							}

						</script>
						<div class="card">
							<div class="media chat-item"  style="padding: 2px 2px 2px 2px">
								<div class="media-body" >
									<h5 class="card-header">
									<span><strong>Comments</strong> <span id="Ccnt"> </span></span>
									</h5>
								</div>
							</div>

							<div class="media chat-item"  style="padding: 1px 10px 10px 10px">
								<div class="media-body" id="commentList">

<%--									<div class="chat-item-title">--%>
<%--										<span class="chat-item-author">nick</span> <span>2--%>
<%--											days ago</span>--%>
<%--									</div>--%>
<%--									<div class="chat-item-body">--%>
<%--										<p>--%>
<%--											Can't wait! <a href="#">@David</a> Curabitur nec massa--%>
<%--											ultrices, consequat erat sit amet, luctus justo. <a href="#">--%>
<%--												Meeting</a>?--%>
<%--										</p>--%>
<%--									</div>--%>
								</div>
							</div>

						<script>
							$(function () {
								getCommentList();
							});

							function commentDel(commentNo) {
								var con = confirm("댓글을 '삭제' 하시겠습니까?");
								if(con){
									$.ajax({
										type: "post",
										url: "/rest/commentDelete",
										data: {"commentNo": commentNo},
										success: function (data) {
											if (data == "success") {
												alert("댓글을 삭제하였습나다.");
												getCommentList();
											}
											else{
												alert("댓글을 삭제할수 없습니다.");
											}
										},
										error: function (error) {
											console.log(error);
										}
									});
								}
								else {
									return;
								}
							}

							function getCommentList() {
								$.ajax({
									type:"post",
									url : "/rest/commentList",
									dataType : "json",
									data : $("#commentForm").serialize(),
									success: function (data) {
										var html= "";
										var cCnt = data.length;
										if(data.length >0){
											for(i=0; i<data.length; i++) {
												html += "<h5 class='card-header'>" +
														"<div class=\"media-body\">\n" +
														"<div class=\"chat-item-title\">\n" +
														"<span class=\"chat-item-author\"> <b>";
												html += data[i].writer+"</b> / " ;
												html += data[i].date + "</span> <span></span>\n" ;

												if(data[i].me == true) {
													html +=	"<span><a name='delete' href='#this'  onclick='commentDel("+ data[i].commentNo +");' class='badge badge-danger'>X</a></span>";
												}

												html += "</div>\n" +
														"<div class=\"chat-item-body\">\n" +
														"<p>";
												html += data[i].comment + "</p>\n" +
														"</div>\n" +
														"</div></h5>\n";
											}
										}else{
											html += "<div class=\"chat-item-body\"> <p>";
											html += "등록된 댓글이 없습니다.</p></div>";
										}
										$("#Ccnt").html(cCnt);
										$("#commentList").html(html);
									},
									errror: function (error) {
										console.log(error);
									}
								});
							}

						</script>

						</div>
						</form>
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

</body>

</html>