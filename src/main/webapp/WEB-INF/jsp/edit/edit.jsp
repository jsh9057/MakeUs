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
                                <h2>게시판 개설</h2>
                                <p class="lead">게시판의 종류및 갯수를 정할수있습니다. </p>
                                <ul class="list-unstyled arrow">
                                    <li> 카테고리를 체크할 경우 하위 게시판을 만들 수 있습니다.</li>
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
                                        <h5 class="card-header">Create Board</h5>
                                        <div class="card-body">
                                            <form id="myform" onsubmit="return false;" data-parsley-validate="" action="/editdo" method="post">
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-form-label text-sm-right">게시판 이름</label>
                                                    <div class="col-12 col-sm-8 col-lg-6">
                                                        <input class="form-control" name="boardNm" required="" type="text" placeholder="Name">
                                                        <label class="custom-control custom-checkbox">
                                                            <input  class="custom-control-input" name="category" type="checkbox" data-parsley-errors-container="#error-container1" data-parsley-mincheck="1" data-parsley-multiple="groups" checked><span class="custom-control-label" onclick="categoryCheck();">카테고리</span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-form-label text-sm-right">카테고리 선택</label>
                                                    <div class="col-12 col-sm-8 col-lg-6" id="selectCategory" hidden>
                                                        <c:forEach var="element" items="${commonList}">
                                                            <c:if test="${element.category}">
                                                                <a class="nav-link" href="#"><i class="fas fa-f fa-folder">${element.boardNm}</i></a><label class="custom-control custom-checkbox"><input name="boardNo[]" class="custom-control-input" type="checkbox" value="${element.boardNo}" data-parsley-errors-container="#error-container1" data-parsley-mincheck="1" data-parsley-multiple="groups" ><span class="custom-control-label">하위 게시판을 만듭니다.</span></label>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <script>
                                                        var categorycheck = true;
                                                        function categoryCheck() {
                                                            if(categorycheck==true){
                                                                categorycheck = false;
                                                            }else {
                                                                categorycheck = true;
                                                            }
                                                            if(categorycheck==false){
                                                                $("#selectCategory").removeAttr("hidden");
                                                                $(boardPermission).append("<div class=\"form-group row\">\n" +
                                                                    "<div class=\"col-12 col-sm-8 col-lg-6\">\n" +
                                                                    "                                                                <div class=\"card-body\">\n" +
                                                                    "                                                                    <div class=\"form-group\">\n" +
                                                                    "                                                                        <label for=\"input-select\">조회 권한</label>\n" +
                                                                    "                                                                        <select class=\"form-control\" id='R'>\n" +
                                                                    "                                                                            <option selected=\"\" value='A'>모두</option>\n" +
                                                                    "                                                                            <option value='P'>교수</option>\n" +
                                                                    "                                                                            <option value='S'>학생</option>\n" +
                                                                    "                                                                        </select>\n" +
                                                                    "                                                                        <br>\n" +
                                                                    "                                                                        <label for=\"input-select\">작성 권한</label>\n" +
                                                                    "                                                                        <select class=\"form-control\" id='C'>\n" +
                                                                    "                                                                            <option selected=\"\" value='A'>모두</option>\n" +
                                                                    "                                                                            <option value='P'>교수</option>\n" +
                                                                    "                                                                            <option value='S'>학생</option>\n" +
                                                                    "                                                                        </select>\n" +
                                                                    "                                                                        <br>\n" +
                                                                    "                                                                        <label for=\"input-select\">모든 게시물 삭제 권한</label>\n" +
                                                                    "                                                                        <select class=\"form-control\" id='D'>\n" +
                                                                    "                                                                            <option value='A'>모두</option>\n" +
                                                                    "                                                                            <option selected=\"\" value='P'>교수</option>\n" +
                                                                    "                                                                            <option value='S'>학생</option>\n" +
                                                                    "                                                                        </select>\n" +
                                                                    "                                                                        <br>\n" +
                                                                    "                                                                    </div>\n" +
                                                                    "                                                                </div>\n" +
                                                                    "                                                            </div>\n" +
                                                                    "                                                        </div>");
                                                            }else{
                                                                $("#boardPermission *").remove();
                                                                $("#selectCategory").attr("hidden",true);
                                                            }
                                                        }
                                                    </script>

                                                    <label class="col-sm-3 col-form-label text-sm-right">게시판 권한</label>

                                                    <div class="col-sm-6" id="boardPermission">
                                                    </div>
                                                    <div>

                                                    </div>
                                                </div>
                                                <div class="form-group row text-right">
                                                    <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                        <button type="button" class="btn btn-space btn-primary" onclick="post();">
                                                            Submit
                                                        </button>
                                                        <button type="button" class="btn btn-space btn-secondary">Cancel
                                                        </button>
                                                    </div>
                                                    <script>
                                                        function post() {
                                                            if(categorycheck == true){
                                                                var category = "<input type='hidden' name='isCategory' value='true'>";
                                                                $("#myform").append(category);
                                                                $("#myform").removeAttr('onsubmit');
                                                                $("#myform").submit();
                                                            }
                                                            else if(categorycheck ==false){
                                                                var count=0;
                                                                var boardCheck = document.getElementsByName("boardNo[]");
                                                                var categoryNo ;
                                                                for(var i=0; i<boardCheck.length; i++){
                                                                    if(boardCheck[i].checked == true){
                                                                        count ++;
                                                                        categoryNo = boardCheck[i].value;
                                                                    }
                                                                }
                                                                if(count >1){
                                                                    alert("하나의 카테고리를 선택해주십시오.");
                                                                    return ;
                                                                }
                                                                else if(count == 1) {
                                                                    var html = "<input type='hidden' name='categoryNo' value='"+categoryNo+"'>";
                                                                    $("#myform").append(html);
                                                                }else if (count == 0){
                                                                    var html = "<input type='hidden' name='categoryNo' value='0'>";
                                                                    $("#myform").append(html);
                                                                }
                                                                var category = "<input type='hidden' name='isCategory' value='false'>";

                                                                var select = document.getElementById("R");
                                                                var r = select.options[select.selectedIndex].value;
                                                                var rHtml="<input type='hidden' name='r' value='"+r+"'>";

                                                                var select = document.getElementById("C");
                                                                var c = select.options[select.selectedIndex].value;
                                                                var cHtml="<input type='hidden' name='c' value='"+c+"'>";

                                                                var select = document.getElementById("D");
                                                                var d = select.options[select.selectedIndex].value;
                                                                var dHtml="<input type='hidden' name='d' value='"+d+"'>";
                                                                $("#myform").append(category+rHtml+cHtml+dHtml);
                                                                $("#myform").removeAttr('onsubmit');
                                                                $("#myform").submit();
                                                            }
                                                        }

                                                    </script>
                                                </div>
                                            </form>
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
<script src="../assets/libs/js/createClass.js"></script>

</body>

</html>