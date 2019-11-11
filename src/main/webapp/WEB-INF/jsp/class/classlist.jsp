<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <div class="col-xl-10">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->

                    <div style="border: 1px; float: top;">
                        <c:if test="${isOp != true}">
                        <a class="btn btn-outline-success" href="/createclass">생성</a>
                        </c:if>
                        <button class="btn btn-outline-primary" onclick="edit()">관리</button>
                        <a class="btn btn-outline-danger" onclick="deleteBtn()">삭제</a>
                    </div>
                    <br>
                    <div class="row">
                        <c:forEach var="element" items="${classList}">
                            <c:set var="leader" value="${element.leaderNm}"/>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <label class="custom-control custom-checkbox">
                                            <div class="d-inline-block">
                                                <input class="custom-control-input" type="checkbox"
                                                       id = "classCheckBox"
                                                       value=${element.classId}><span
                                                    class="custom-control-label"></span>
                                                <h5 class="text-muted">${element.classNm}</h5>
                                                <%
                                                    String leader = (String) pageContext.getAttribute("leader");
                                                    if (leader == leader) {
                                                        leader = "학생관리자 없음";
                                                    }
                                                %>
                                                <h5 class="text-muted"><%=leader %>
                                                </h5>
                                                <h3 class="text-muted">${element.professorNm}</h3>
                                            </div>
                                            <div class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
                                                <i class="fa fa-user fa-fw fa-sm text-primary"></i>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <script>
                            function edit() {
                                if ($('input:checkbox[id="classCheckBox"]:checked').length == 1) {
                                    var classIds = new Array();
                                    var form = document.createElement('form');
                                    form.setAttribute("charset", "UTF-8");
                                    form.setAttribute('method', 'Post');
                                    form.setAttribute('action', "../editClass");
                                    var hiddenField = document.createElement('input');
                                    hiddenField.setAttribute("type", "hidden");
                                    hiddenField.setAttribute("name", "jsonString");

                                    $('input:checkbox[id="classCheckBox"]:checked').each(function (index) {
                                        var data = new Object();
                                        data.classId = this.value;
                                        classIds.push(data);
                                    });
                                    var jsonString = JSON.stringify(classIds);
                                    hiddenField.setAttribute("value", jsonString);
                                    form.appendChild(hiddenField);
                                    document.body.appendChild(form);
                                    form.submit();
                                } else {
                                    alert("하나의 과목을 선택하여 주십시오.");
                                    return false;
                                }
                            }

                            function deleteBtn() {
                                if ($('input:checkbox[id="classCheckBox"]:checked').length != 0) {
                                    if(confirm("총 [" +$('input:checkbox[id="checkboxarr"]:checked').length+"] 개 의 수업을 '삭제'하시겠 습니까?")== true){
                                        if(confirm("삭제된 모든 수업의 첨부파일은 서버에 저장됩니다.")) {
                                            var classIds = new Array();
                                            var form = document.createElement('form');
                                            form.setAttribute("charset", "UTF-8");
                                            form.setAttribute('method', 'Post');
                                            form.setAttribute('action', "../doDeleteClass");
                                            var hiddenField = document.createElement('input');
                                            hiddenField.setAttribute("type", "hidden");
                                            hiddenField.setAttribute("name", "jsonString");

                                            $('input:checkbox[id="classCheckBox"]:checked').each(function (index) {
                                                var data = new Object();
                                                data.classId = this.value;
                                                classIds.push(data);
                                            });
                                            var jsonString = JSON.stringify(classIds);
                                            hiddenField.setAttribute("value", jsonString);
                                            form.appendChild(hiddenField);
                                            document.body.appendChild(form);
                                            form.submit();
                                        }else {
                                            return false;
                                        }
                                    } else {
                                        return false;
                                    }
                                } else {
                                    alert("한 개 이상의 과목을 선택하여 주십시오.");
                                    return false;
                                }
                            }
                        </script>
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
                            Copyright © 2018 Concept. All rights reserved. Dashboard by <a
                                href="https://colorlib.com/wp/">Colorlib</a>.
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
        $(document).ready(function () {
            $("#header").load("/header");
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#menu").load("/menu");
        });
    </script>
</body>

</html>