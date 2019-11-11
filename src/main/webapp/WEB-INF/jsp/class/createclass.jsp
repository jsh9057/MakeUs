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
            <div class="container-fluid dashboard-content">
                <div class="row">
                    <div class="col-xl-10">
                        <!-- ============================================================== -->
                        <!-- pageheader  -->
                        <!-- ============================================================== -->

                        <!-- ============================================================== -->
                        <!-- end pageheader  -->
                        <!-- ============================================================== -->
                        <div class="page-section" id="overview">
                            <!-- ============================================================== -->
                            <!-- overview  -->
                            <!-- ============================================================== -->
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <h2>강의 개설</h2>
                                    <p class="lead">수업을 개설하면 해당 수업의 게시판의 종류및 갯수를 정할수있습니다. </p>
                                    <ul class="list-unstyled arrow">
                                        <li> 해당과목을 관리하는 관리 학생은 이전 페이지에서 '수정'을 통해서 지정할 수 있습니다.</li>
                                        <li> 게시판 권한의 '모든 게시물 삭제 권한' 은 작성자의 글 뿐만아니라 타인이 작성한 글도 삭제하는 권한입니다.</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end overview  -->
                            <!-- ============================================================== -->
                        </div>
                        <!-- ============================================================== -->
                        <!-- basic form  -->
                        <!-- ============================================================== -->
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="card">
                                            <h5 class="card-header">Create Class</h5>
                                            <div class="card-body">
                                                <form id="myform" onsubmit="return false;" action="/classcreatedo" method="post">
<%--                                                    <c:if test="${isOperator==true}">--%>
<%--                                                        <div class="form-group row">--%>
<%--                                                        <label class="col-sm-3 col-form-label text-sm-right">교수님 선택</label>--%>
<%--                                                        <div >--%>
<%--                                                            <select class="form-control" id="professor">--%>
<%--                                                                <c:forEach items="${proList}" var="pro">--%>
<%--                                                                    <option value="${pro.userId}">${pro.name}</option>--%>
<%--                                                                </c:forEach>--%>
<%--                                                            </select>--%>
<%--                                                        </div>--%>
<%--                                                        </div>--%>
<%--                                                    </c:if>--%>
                                                    <div class="form-group row">
                                                        <label class="col-12 col-sm-3 col-form-label text-sm-right">강좌이름</label>
                                                        <div class="col-12 col-sm-8 col-lg-6">
                                                            <input class="form-control" name="className" id="nameInput" required="" type="text" placeholder="Name">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label text-sm-right">기본 게시판</label>
                                                        <div class="col-sm-6">
                                                            <div class="custom-controls-stacked" >
                                                                <label class="custom-control custom-checkbox">
                                                                    <input name="proBoard" class="custom-control-input" id="proBoard" type="checkbox" value="proBoard" data-parsley-errors-container="#error-container1" data-parsley-mincheck="1" data-parsley-multiple="groups" checked="true"><span class="custom-control-label">교수님 게시판</span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input name="stuBoard" class="custom-control-input" id="stuBoard" type="checkbox" value="stuBoard" data-parsley-errors-container="#error-container1" data-parsley-mincheck="1" data-parsley-multiple="groups" checked="true"><span class="custom-control-label">학생 게시판</span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input name="submitBoard" class="custom-control-input" id="submitBoard" required="" type="checkbox" value="submitBoard" data-parsley-errors-container="#error-container1" data-parsley-mincheck="1" data-parsley-multiple="groups" checked="true"><span class="custom-control-label">제출 게시판</span>
                                                                </label>
                                                                <div id="error-container1"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label text-sm-right">추가 게시판</label>
                                                        <div>
                                                            <a class="btn btn-rounded btn-light" onclick="addBoard();">+</a>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="custom-controls-stacked" id="boardList">
                                                                <label class="custom-control custom-checkbox">
                                                                    <input class="custom-control-input" name="checkBoxs" id="inputBox_0" type="checkbox" value="0" data-parsley-errors-container="#error-container2" data-parsley-multiple="group1"><span class="custom-control-label" id="span_0">게시판 0</span>
                                                                    <details>
                                                                        <summary> OPTION </summary>
                                                                        <p> <div class="form-group row">
                                                                        <label class="col-12 col-sm-3 col-form-label text-sm-right">게시판 이름</label>
                                                                        <div class="col-12 col-sm-8 col-lg-6">
                                                                            <input class="form-control" id="newBoardName_0" required="" placeholder="Board Name">
                                                                        </div>
                                                                    </div>
                                                                        <div class="form-group row">
                                                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">게시판 권한</label>
                                                                            <div class="col-12 col-sm-8 col-lg-6">
                                                                                <div class="card-body">
                                                                                    <div class="form-group">
                                                                                            <label for="readPer_0">조회 권한</label>
                                                                                            <select class="form-control" id="readPer_0">
                                                                                                <option selected value="A">모두</option>
                                                                                                <option value="P">교수</option>
                                                                                                <option value="S">학생</option>
                                                                                            </select>
                                                                                            <br>
                                                                                        <label for="createPer_0">작성 권한</label>
                                                                                        <select class="form-control" id="createPer_0">
                                                                                            <option selected value="A" >모두</option>
                                                                                            <option value="P">교수</option>
                                                                                            <option value="S">학생</option>
                                                                                        </select>
                                                                                        <br>
                                                                                        <label for="deletePer_0">모든 게시물 삭제 권한</label>
                                                                                        <select class="form-control" id="deletePer_0" >
                                                                                            <option value="A">모두</option>
                                                                                            <option selected value="P">교수</option>
                                                                                            <option value="S">학생</option>
                                                                                        </select>
                                                                                        <br>
                                                                                    </div>
                                                                                    <button type="button" class="btn btn-space btn-primary" onclick="apply(0)" >적용</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        </p>
                                                                    </details>
                                                                </label>
                                                                <div id="error-container2"></div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="form-group row text-right">
                                                        <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                            <button type="button" class="btn btn-space btn-primary" onclick="writeForm();" >생성</button>
                                                            <a class="btn btn-space btn-secondary" href="../classlist">취소</a>
                                                        </div>
                                                    </div>
                                                </form>
                                                <script>
                                                    var boardArr = new Array();

                                                    function apply(index) {
                                                        var inputName = "#newBoardName_" + index;
                                                        var R = "readPer_"+index;
                                                        var C = "createPer_" +index;
                                                        var D = "deletePer_" + index;

                                                        if($(inputName).val()==""){
                                                            alert("게시판 이름을 입력해 주십시오.");
                                                            return ;
                                                        }
                                                        var obj = new Object();
                                                        obj.boardNm = $(inputName).val();

                                                        var readSelect = document.getElementById(R);
                                                        var readValue = readSelect.options[readSelect.selectedIndex].value;
                                                        obj.R = readValue;

                                                        var createSelect = document.getElementById(C);
                                                        var createValue = createSelect.options[createSelect.selectedIndex].value;
                                                        obj.C = createValue;

                                                        var deleteSelect = document.getElementById(D);
                                                        var deleteValue = deleteSelect.options[deleteSelect.selectedIndex].value;
                                                        obj.D = deleteValue;

                                                        boardArr[index]=obj;
                                                        var sp = "span_"+index;
                                                        document.getElementById(sp).innerHTML =obj.boardNm;
                                                        alert("적용되었습니다.");
                                                    }

                                                    function writeForm() {
                                                        if($("#nameInput").val() == ""){
                                                            alert("과목이름을 입력해 주십시오.");
                                                            return ;
                                                        }
                                                        var checkBoxs = document.getElementsByName("checkBoxs");

                                                        var dummyobj = new Object();
                                                        dummyobj.boardNm="";
                                                        dummyobj.R="";
                                                        dummyobj.C="";
                                                        dummyobj.D="";
                                                        var dummyHtml = "<input type='hidden' name='newBoardList' value='"+ JSON.stringify(dummyobj) +"'>";
                                                        $("#myform").append(dummyHtml);
                                                        $("#myform").append(dummyHtml);
                                                        for(i=0; i<checkBoxs.length ; i++){
                                                            var chekboxNm= "#inputBox_"+i;
                                                            if($(chekboxNm).prop("checked")){
                                                                if(boardArr[i]==null){
                                                                    alert("게시판 적용 후에 체크해 주시길바랍니다.");
                                                                    return ;
                                                                }
                                                                var jsonval = "'"+ JSON.stringify(boardArr[i])+"'";
                                                                var html = "<input type='hidden' name='newBoardList' value="+jsonval+">";
                                                                $("#myform").append(html);
                                                            }
                                                        }

                                                        $("#myform").removeAttr('onsubmit');
                                                        $("#myform").submit();

                                                    }
                                                    var boardIndex=1;

                                                    function addBoard() {
                                                        var html  = " <label class='custom-control custom-checkbox'><input class='custom-control-input' name='checkBoxs' id='inputBox_" + boardIndex
                                                                + "' type='checkbox' value='bar' data-parsley-errors-container='#error-container2' data-parsley-multiple='group1'><span class='custom-control-label' id='span_"+boardIndex+"'>게시판" + boardIndex
                                                                +"</span>";
                                                        html += "<details><summary> OPTION </summary><p> <div class='form-group row'><label class='col-12 col-sm-3 col-form-label text-sm-right'>게시판 이름</label><div class='col-12 col-sm-8 col-lg-6'>";
                                                        html += " <input class='form-control' id='newBoardName_"+ boardIndex+"'  required='' placeholder='Board Name'></div></div><div class='form-group row'><label class='col-12 col-sm-3 col-form-label text-sm-right'>" +
                                                            "게시판 권한</label><div class='col-12 col-sm-8 col-lg-6'> <div class='card-body'><div class='form-group'>";
                                                        html += "<label for='readPer_"+boardIndex+"'>조회 권한</label>";
                                                        html += "<select class='form-control' id='readPer_"+boardIndex+"'><option selected value='A'>모두</option><option value='P'>교수</option><option value='S'>학생</option></select><br><label for='createPer_"+boardIndex+"'>";
                                                        html += "작성 권한</label><select class='form-control' id='createPer_"+boardIndex+"'><option selected value='A' >모두</option><option value='P'>교수</option><option value='S'>학생</option></select><br><label for='deletePer_"+boardIndex+"'>";
                                                        html += "모든 게시물 삭제 권한</label><select class='form-control' id='deletePer_"+boardIndex+"'><option value='A'>모두</option><option selected value='P'>교수</option> <option value='S'>학생</option></select> <br>";
                                                        html += "</div><button type='button' class='btn btn-space btn-primary' onclick='apply("+boardIndex+")'>적용</button></div></div></div></p></details></label>";
                                                        $("#boardList").append(html);
                                                        boardIndex++;
                                                    }
                                                </script>
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
                            Copyright © 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="javascript: void(0);">About</a>
                                <a href="javascript: void(0);">Support</a>
                                <a href="javascript: void(0);">Contact Us</a>
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
	</script></div></div></div>
<%--    <script src="../assets/libs/js/createClass.js"></script>--%>

</body>

</html>