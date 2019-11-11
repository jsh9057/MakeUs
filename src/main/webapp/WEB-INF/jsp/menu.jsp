<%@ page import="com.skuniv.makeus.dto.Users" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>


<%
Users user = (Users) session.getAttribute("user");
%>

<div class="nav-left-sidebar sidebar-dark">
			<div class="menu-list">
				<nav class="navbar navbar-expand-lg navbar-light">
					<a class="d-xl-none d-lg-none" href="#">Dashboard</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarNav" aria-controls="navbarNav"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav flex-column">
							<li class="nav-divider">Menu</li>
				<!--  ###############################  Common board start  ##############################  -->
					<div id = "commonlist">
						<script>
							$(function () {
								return $.ajax({
									type: 'POST',
									url: "../rest/commonmenu",
									contentType: "application/json; charset=UTF-8",
									success: function (data) {
										var tag1 = "<li class='nav-item'><a class='nav-link' href='";
										var tag2 = "'>";
										var tag3 = "</a></li>";

										for (var i = 0; i < data.length; i++) {
											if(data[i].category==true){
												var html = "<li class='nav-item'><a class='nav-link' href='#' data-toggle='collapse' aria-expanded='false' data-target='#submenu-" +
														data[i].boardNo + "' aria-controls='submenu-10'>" +
														"<i class='fas fa-f fa-folder' id='"+data[i].boardNo+"'> "+data[i].boardNm+"</i></a>"+
												"<div id='submenu-"+ data[i].boardNo +"'class='collapse submenu' style=''><ul class='nav flex-column' id='detail_"+data[i].boardNo+"'></ul></div></li>";
												$("#commonlist").append(html);
											}else{
												var link = "../board/" + data[i].boardNo;
												var name = data[i].boardNm;
												if(data[i].fk_parent != 0){
													 var parent = "#detail_"+data[i].fk_parent;
													 $(parent).append(tag1 + link + tag2 + name + tag3);
												}
												else {
													$("#commonlist").append(tag1 + link + tag2 + name + tag3);
												}
											}
										}

									},
									error: function (error) {
										console.log(error);
									}
								});
							});
						</script>

					</div>
				<!--  ###############################  Common board end  ################################  -->
							<%--   학년게시판은 Common board 에 합쳐졌습니다 ^^						--%>

<%--				<!--   ##############################  학년별 게시판 start  #################################  -->--%>
<%--							<li class="nav-item">--%>
<%--								<a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-grade" aria-controls="submenu-10">--%>
<%--									<i class="fas fa-f fa-folder" id="grade"></i>--%>
<%--								</a>--%>

<%--								<div id="submenu-grade" class="collapse submenu" style="">--%>
<%--									<ul id = "gradelist" class="nav flex-column">--%>
<%--								<!--   ###########  학년별 게시판목록 Ajax통신을 통해 가져옴   #########  -->--%>
<%--									</ul>--%>
<%--								</div>--%>
<%--							</li>--%>
<%--							<script>--%>
<%--								$(function () {--%>
<%--										return $.ajax({--%>
<%--											type: 'POST',--%>
<%--											url: "../rest/grademenu",--%>
<%--											contentType: "application/json; charset=UTF-8",--%>
<%--											success: function (data) {--%>
<%--												var tag1 = "<li class='nav-item'><a class='nav-link' href='";--%>
<%--												var tag2 = "'>";--%>
<%--												var tag3 = "</a></li>";--%>
<%--												for (var i = 0; i < data.length; i++) {--%>
<%--													var link = "../board/" + data[i].boardNo;--%>
<%--													var name = data[i].boardNm;--%>
<%--													if (data[i].category == false) {--%>
<%--														$("#gradelist").append(tag1 + link + tag2 + name + tag3);--%>

<%--													} else {--%>
<%--														$("#grade").append(" " + data[i].boardNm);--%>
<%--													}--%>
<%--												}--%>
<%--											},--%>
<%--											error: function (error) {--%>
<%--												console.log(error);--%>
<%--											}--%>
<%--										});--%>
<%--								});--%>

<%--							</script>--%>
<%--				<!--   ##############################  학년별 게시판 end  ###################################  -->--%>


				<!--   ##############################  수업별 게시판 start  #################################  -->
							<br/>
							<li class="nav-item">
								<a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-class" aria-controls="submenu-10">
									<i class="fas fa-f fa-folder"> 수업 게시판</i>
								</a>

								<div id="submenu-class" class="collapse submenu" style="">
									<ul class="nav flex-column" id = "classmenu">

									</ul>
								</div>
							</li>

				<!--   ##############################  수업별 게시판 end  #######################################  -->


				<!--   ##############################  LAB/동아리 게시판 start  #################################  -->
<%--							<li class="nav-item">--%>
<%--								<a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-group" aria-controls="submenu-10">--%>
<%--									<i class="fas fa-f fa-folder"> LAB/동아리 게시판</i>--%>
<%--								</a>--%>

<%--								<div id="submenu-group" class="collapse submenu" style="">--%>
<%--									<ul class="nav flex-column">--%>
<%--										<li class="nav-item">--%>
<%--											<a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-group-detail" aria-controls="submenu-11">Level 2</a>--%>
<%--											<div id="submenu-group-detail" class="collapse submenu" style="">--%>
<%--												<ul class="nav flex-column">--%>
<%--													<li class="nav-item"><a class="nav-link" href="#">Level 1</a></li>--%>
<%--													<li class="nav-item"><a class="nav-link" href="#">Level 2</a></li>--%>
<%--												</ul>--%>
<%--											</div>--%>
<%--										</li>--%>
<%--									</ul>--%>
<%--								</div>--%>
<%--							</li>--%>
				<!--   ##############################  LAB/동아리 게시판 end  ###################################  -->


				<!--  ###############################  other board start  ####################################  -->
							<br/>
							<br/>
				<div id = "otherlist"></div>
				<c:if test="${!empty user}">
					<c:if test="${!user.ps || user.operator}">
						<li class='nav-item'><a class='nav-link' href='../enrollment'><i class="fas fa-calendar-check"></i> 수강신청</a></li>
					</c:if>

<%--					<li class='nav-item'><a class='nav-link' href=''><i class="fas fa-calendar-check"></i> LAB/동아리 가입신청</a></li>--%>
					<!-- 교수님 및 관리자 -->
					<c:if test="${user.ps || user.operator}">
					<li class='nav-item'><a class='nav-link' href='../classlist'><i class="fas fa-wrench"></i> 수업게시판 관리</a></li>
					</c:if>
					<c:if test="${user.operator}">
						<br/>
						<li class='nav-item'><a class='nav-link' href='../edit'><i class="fas fa-wrench"></i> 게시판 관리</a></li>
						<li class='nav-item'><a class='nav-link' href='../useredit'><i class="fas fa-wrench"></i> 유저 관리</a></li>
					</c:if>
				</c:if>
				<!--  -->
				<!--  ##############################  other board  end  ###################################### -->

						</ul>
					</div>
				</nav>
			</div>
		</div>
		<script type = "text/javascript" src ="../assets/vendor/jquery/jquery-3.3.1.min.js"></script>
		<script src="../assets/libs/js/menu.js"></script>
<%--		<script>--%>
<%--			$(function () {--%>
<%--				return $.ajax({--%>
<%--					type: 'POST',--%>
<%--					url: "../rest/grademenu",--%>
<%--					contentType: "application/json; charset=UTF-8",--%>
<%--					success: function (data) {--%>

<%--						var tag1 = "<li class='nav-item'><a class='nav-link' href='";--%>
<%--						var tag2 = "'>";--%>
<%--						var tag3 = "</a></li>";--%>
<%--						for (var i = 0; i < data.length; i++) {--%>
<%--							var link = "../board/" + data[i].boardNo;--%>
<%--							var name = data[i].boardNm;--%>
<%--							$("#gradelist").append(tag1 + link + tag2 + name + tag3);--%>
<%--						}--%>
<%--					},--%>
<%--					error: function (error) {--%>
<%--						console.log(error);--%>
<%--					}--%>
<%--				});--%>
<%--			});--%>
<%--			$(function () {--%>
<%--				return $.ajax({--%>
<%--					type: 'POST',--%>
<%--					url: "../rest/commonmenu",--%>
<%--					contentType: "application/json; charset=UTF-8",--%>
<%--					success: function (data) {--%>
<%--						var tag1 = "<li class='nav-item'><a class='nav-link' href='";--%>
<%--						var tag2 = "'>";--%>
<%--						var tag3 = "</a></li>";--%>

<%--						for (var i = 0; i < data.length; i++) {--%>
<%--							var link = "../board/" + data[i].boardNo;--%>
<%--							var name = data[i].boardNm;--%>
<%--							$("#commonlist").append(tag1 + link + tag2 + name + tag3);--%>
<%--						}--%>

<%--					},--%>
<%--					error: function (error) {--%>
<%--						console.log(error);--%>
<%--					}--%>
<%--				});--%>
<%--			});--%>

<%--			$(function () {--%>
<%--				return $.ajax({--%>
<%--					type: 'POST',--%>
<%--					url: "../rest/classmenu",--%>
<%--					contentType: "application/json; charset=UTF-8",--%>
<%--					success: function (data) {--%>
<%--						alert(data[0].myclassNm);--%>
<%--						var tag1 = "<ul class=\'nav flex-column\'>" +--%>
<%--								"<li class='nav-item'>";--%>
<%--						var tag2 = "<a class='nav-link' href='#' data-toggle='collapse' aria-expanded='false' data-target='#submenu-class-detail' aria-controls='submenu-11'>";--%>
<%--						var name;--%>
<%--						var tag3 = "</a>" +--%>
<%--								"<div id='submenu-class-detail' class='collapse submenu' style=''>"--%>
<%--						var tag4 = "<ul class=\'nav flex-column\'>";--%>
<%--						var deTag4 = "<li class=\'nav-item\'><a class=\'nav-link\' href=\'#\'>";--%>
<%--						var deName;--%>
<%--						var deTag5 = "</li>" +--%>
<%--								"</ul>" +--%>
<%--								"</div>" +--%>
<%--								"</li>";--%>
<%--						var end = "</ul>";--%>

<%--						var str;--%>

<%--						var deTag1--%>
<%--					},--%>
<%--					error: function (error) {--%>
<%--						console.log(error);--%>
<%--					}--%>
<%--				});--%>
<%--			});--%>



<%--		</script>--%>