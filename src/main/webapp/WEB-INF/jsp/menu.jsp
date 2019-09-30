<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>



<script src="../assets/libs/js/menu.js"></script>
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
					<div id = "commonlist"></div>
				<!--  ###############################  Common board end  ################################  -->	
				
				
				<!--   ##############################  학년별 게시판 start  #################################  -->
							<li class="nav-item"><a class="nav-link" href="#"
								data-toggle="collapse" aria-expanded="false"
								data-target="#submenu-grade" aria-controls="submenu-10">
								<i class="fas fa-f fa-folder"></i>학년 게시판</a>
								<div id="submenu-grade" class="collapse submenu" style="">
									<ul id = "gradelist" class="nav flex-column">
								<!--   ###########  학년별 게시판목록 Ajax통신을 통해 가져옴   #########  -->
					
									</ul>
								</div></li>
				<!--   ##############################  학년별 게시판 end  ###################################  -->			
							
							
				<!--   ##############################  수업별 게시판 start  #################################  -->			
							<li class="nav-item"><a class="nav-link" href="#"
								data-toggle="collapse" aria-expanded="false"
								data-target="#submenu-class" aria-controls="submenu-10"><i
									class="fas fa-f fa-folder"></i>수업 게시판</a>
								<div id="submenu-class" class="collapse submenu" style="">
									<ul class="nav flex-column">
									
										<li class="nav-item"><a class="nav-link" href="#"
											data-toggle="collapse" aria-expanded="false"
											data-target="#submenu-class-detail" aria-controls="submenu-11">Level
												2</a>
											<div id="submenu-class-detail" class="collapse submenu" style="">
												<ul class="nav flex-column">
													<li class="nav-item"><a class="nav-link" href="#">Level
															1</a></li>
													<li class="nav-item"><a class="nav-link" href="#">Level
															2</a></li>
												</ul>
											</div></li>
											
									</ul>
								</div></li>
				<!--   ##############################  수업별 게시판 end  #######################################  -->	
				
				
				<!--   ##############################  LAB/동아리 게시판 start  #################################  -->			
							<li class="nav-item"><a class="nav-link" href="#"
								data-toggle="collapse" aria-expanded="false"
								data-target="#submenu-group" aria-controls="submenu-10"><i
									class="fas fa-f fa-folder"></i>LAB/동아리 게시판</a>
								<div id="submenu-group" class="collapse submenu" style="">
									<ul class="nav flex-column">
									
										<li class="nav-item"><a class="nav-link" href="#"
											data-toggle="collapse" aria-expanded="false"
											data-target="#submenu-group-detail" aria-controls="submenu-11">Level
												2</a>
											<div id="submenu-group-detail" class="collapse submenu" style="">
												<ul class="nav flex-column">
													<li class="nav-item"><a class="nav-link" href="#">Level
															1</a></li>
													<li class="nav-item"><a class="nav-link" href="#">Level
															2</a></li>
												</ul>
											</div></li>
											
									</ul>
								</div></li>
				<!--   ##############################  LAB/동아리 게시판 end  ###################################  -->					
				
				
				<!--  ###############################  other board start  ####################################  -->
				<div id = "otherlist"></div>
				<li class='nav-item'><a class='nav-link' href=''>수강신청</a></li>
				<li class='nav-item'><a class='nav-link' href=''>LAB/동아리 가입신청</a></li>
				<!-- 교수님 및 관리자 -->
				<li class='nav-item'><a class='nav-link' href='../classlist'>수업게시판 개설</a></li>
				<!--  -->
				<!--  ##############################  other board  end  ###################################### -->
				
						</ul>
					</div>
				</nav>
			</div>
		</div>