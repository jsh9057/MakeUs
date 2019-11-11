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
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="card">
                        <h5 class="card-header"><b>[${myClassList[0].myclassNm}] 수강신청 인원</b>
                            <button style="float:right" class="btn btn-danger" onclick="cancelBtn()">수강취소</button>
                            <button style="float:right" class="btn btn-primary" onclick="confirmBtn()">수강확인</button>
                        </h5>
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">
                                        <button class="btn btn-rounded btn-dark" onclick="allBtn()">ALL</button>
                                    </th>
                                    <th scope="col">학번</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">신청과목</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="element" items="${myClassList}">
                                    <c:if test="${element.confirm==false}">
                                        <tr>
                                            <div>
                                                <th scope="row">
                                                    <label class="custom-control custom-checkbox">
                                                        <input class="custom-control-input" type="checkbox"
                                                               id="checkBox" value="${element.fk_userId}">
                                                        <span class="custom-control-label"></span>
                                                    </label>
                                                </th>
                                                <td><h2>${element.fk_userId}</h2></td>
                                                <td><h2>${element.name}</h2></td>
                                                <td><h3>${element.myclassNm}</h3></td>
                                            </div>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card">
                        <h5 class="card-header"><b>[${myClassList[0].myclassNm}] 수강 인원</b>
                            <button style="float:right" class="btn btn-danger" onclick="cancelBtn2()">수강취소</button>
                        </h5>
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">
                                        <button class="btn btn-rounded btn-dark" onclick="allBtn()">ALL</button>
                                    </th>
                                    <th scope="col">학번</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">신청과목</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="element" items="${myClassList}">
                                    <c:if test="${element.confirm==true}">
                                        <tr>
                                            <div>
                                                <th scope="row">
                                                    <label class="custom-control custom-checkbox">
                                                        <input class="custom-control-input" type="checkbox"
                                                               id="overCheckBox" value="${element.fk_userId}">
                                                        <span class="custom-control-label"></span>
                                                    </label>
                                                </th>
                                                <td><h2>${element.fk_userId}</h2></td>
                                                <td><h2>${element.name}</h2></td>
                                                <td><h3>${element.myclassNm}</h3></td>
                                            </div>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <form id="myform" name="myform" charset="UTF-8" method="Post" action="../doConfirm">
            <input type="hidden" name="classId" value="${myClassList[0].fk_classId}">
        </form>
        <form id="cancelMyform" name="cancelMyform" charset="UTF-8" method="Post" action="../doEnrollCancel">
            <input type="hidden" name="classId" value="${myClassList[0].fk_classId}">
        </form>
        <script type="text/javascript">
            var isAllcheck = false;

            function allBtn() {
                $('input:checkbox[id="checkBox"]').each(function () {
                    if (isAllcheck == false) {
                        this.checked = true;
                    } else {
                        this.checked = false;
                    }
                })
                if (isAllcheck == false) {
                    isAllcheck = true;
                } else {
                    isAllcheck = false;
                }
            }

            function confirmBtn() {
                if ($('input:checkbox[id="checkBox"]:checked').length != 0) {
                    if (confirm("총 [" + $('input:checkbox[id="checkBox"]:checked').length + "] 명 의 학생을 수강확인 하시겠습니까?") == true) {
                        var userIdList = new Array();
                        // var form = $("#myform");
                        //  var form = $("form[name=myform]");
                        //  alert(form.children('input').val());
                        var hiddenField = document.createElement('input');
                        hiddenField.setAttribute("type", "hidden");
                        hiddenField.setAttribute("name", "jsonString");
                        $('input:checkbox[id="checkBox"]:checked').each(function (index) {
                            var data = new Object();
                            data.userId = this.value;
                            userIdList.push(data);
                        });
                        var jsonString = JSON.stringify(userIdList);
                        hiddenField.setAttribute("value", jsonString);
                        document.getElementById("myform").appendChild(hiddenField);
                        alert("총 [" + $('input:checkbox[id="checkBox"]:checked').length + "]명의 학생이 등록되었습니다.");
                        document.getElementById("myform").submit();

                    } else {
                        return false;
                    }

                } else {
                    alert("한 명 이상의 학생을 선택해 주십시오.");
                    return false;
                }
            }

            function cancelBtn() {
                if ($('input:checkbox[id="checkBox"]:checked').length != 0) {
                    if (confirm("총 [" + $('input:checkbox[id="checkBox"]:checked').length + "] 명 의 수강학생을 '취소' 하시겠습니까?") == true) {
                        var userIdList = new Array();
                        var hiddenField = document.createElement('input');
                        hiddenField.setAttribute("type", "hidden");
                        hiddenField.setAttribute("name", "jsonString");
                        $('input:checkbox[id="checkBox"]:checked').each(function (index) {
                            var data = new Object();
                            data.userId = this.value;
                            userIdList.push(data);
                        });
                        var jsonString = JSON.stringify(userIdList);
                        hiddenField.setAttribute("value", jsonString);
                        document.getElementById("cancelMyform").appendChild(hiddenField);
                        alert("총 [" + $('input:checkbox[id="checkBox"]:checked').length + "]명의 학생을 수강 '취소'하였습니다.");
                        document.getElementById("cancelMyform").submit();
                    } else {
                        return false;
                    }
                }
                else {
                    alert("한 명 이상의 학생을 선택해 주십시오.");
                    return false;
                }
            }
            function cancelBtn2() {
                if ($('input:checkbox[id="overCheckBox"]:checked').length != 0) {
                    if (confirm("총 [" + $('input:checkbox[id="overCheckBox"]:checked').length + "] 명 의 수강학생을 '취소' 하시겠습니까?") == true) {
                        var userIdList = new Array();
                        var hiddenField = document.createElement('input');
                        hiddenField.setAttribute("type", "hidden");
                        hiddenField.setAttribute("name", "jsonString");
                        $('input:checkbox[id="overCheckBox"]:checked').each(function (index) {
                            var data = new Object();
                            data.userId = this.value;
                            userIdList.push(data);
                        });
                        var jsonString = JSON.stringify(userIdList);
                        hiddenField.setAttribute("value", jsonString);
                        document.getElementById("cancelMyform").appendChild(hiddenField);
                        alert("총 [" + $('input:checkbox[id="overCheckBox"]:checked').length + "]명의 학생을 수강 '취소'하였습니다.");
                        document.getElementById("cancelMyform").submit();
                    } else {
                        return false;
                    }
                }
                else {
                    alert("한 명 이상의 학생을 선택해 주십시오.");
                    return false;
                }
            }
        </script>
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
    </div>
</div>
<!-- ============================================================== -->
<!-- end footer -->
<!-- ============================================================== -->
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