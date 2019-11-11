<%@ page import="com.skuniv.makeus.dto.Users" %>
<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            <div class="row">

                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

                    <div class="card">
                        <h5 class="card-header">
                            <b>글쓰기</b>
                        </h5>
                        <div class="card-body">
                            <form id = "myform" method="post" onsubmit="return false;" action="/updatedo" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label class="col-form-label" for="inputText3"  >제목</label>
                                    <input class="form-control" id="inputText3" name = "title" type="text" value="${detail.postTitle}">
                                </div>
                                <div class="form-group">
                                    <label for="content">내용</label>
                                    <textarea class="form-control" id="content" name ="content" rows="20">${detail.postContents}</textarea>
                                </div>

                                <%--	#############     이미지 업로드     ############         --%>

                                <div class="card-header p-4" >
                                    <h5><b>이미지 업로드</b></h5>
                                    <p class="alert alert-danger"><b>이미지를 삭제하려면 이미지를 클릭하세요!</b></p>
                                    <div class="inputWrap">
                                        <a href="javascript:" onclick="fileUpload();" class="btn btn-primary">이미지 업로드</a>
                                        <input type="file" id ="inputImges_0" name = "imgfiles"  hidden/>
                                    </div>
                                    <div class="uploadImgDiv">
                                        <c:forEach items="${files}" varStatus="row" var = "var">
                                            <c:if test="${var.img}">
                                                <p>
                                                    <a href="#this" name="fill_${row.index}" id="file_"${row.index} onclick="uploadFileDelete($(this),'${var.fileNo}');" title='Click to remove'>
                                                        <img src = "/display?name=${var.fileNm}" style="max-width: 50%; height: auto;" />
                                                    </a>
                                                </p>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="imgsWrap">
                                        <img id="img"/>
                                    </div>
                                </div>
                                <%--   #################	파일업로드   #########################  --%>
                                <div class="card-header p-4" >
                                    <h5><b> 첨부파일 </b></h5>
                                    <div id="uploadDiv">
                                        <c:forEach items="${files}" varStatus="row" var="var">
                                            <c:if test="${!var.img}">
                                                <p>
                                                    <a href="#this" name="file_${row.index}" id="file_${row.index}">${var.fileOriNm}</a>
                                                    <a name="delete" id="uploadDelete" href="#this" onclick="uploadFileDelete($(this),'${var.fileNo}');" class="badge badge-danger">X</a><br/>
                                                </p>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <br/>
                                    <div id = "fileDiv">

                                            <input type="file" name="files" multiple="multiple" />
                                            <a name="delete" href="#" class="badge badge-danger">파일삭제</a><br/>
                                        </p>
                                    </div>
                                    <br/>
                                    <a href="#this" id="addfile" class="badge badge-info" onclick="fileAdd()" >파일 추가하기</a>
                                </div>

                                <input type="hidden" name = "postNo" value="${detail.postNo}"/>
                                <br/>


                                <div align="right">
                                    <button type="button" class="btn btn-primary" onclick="wirte()">수정</button>
                                    <a class="btn btn-danger" href="#" onclick="history.back(-1);">취소</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <script type="text/javascript">
                        var sel_files= [];
                        var index = 0;

                        function uploadFileDelete (obj, fileNo){
                            var str = "<input name=\"fileDeletes\"  value='" +fileNo+ "'/>";
                            $("#uploadDiv").append(str);
                            obj.parent().remove();
                        }


                        $(document).ready(function () {
                            $("#inputImges_"+index).on("change",hadleImgsFileSelect);

                        });


                        function fileUpload() {
                            console.log("fileUpload");
                            var imginput = "#inputImges_"+index;
                            console.log(imginput);
                            $(imginput).trigger("click");
                        }


                        function hadleImgsFileSelect(e) {

                            var files = e.target.files;
                            var filesArr = Array.prototype.slice.call(files);

                            filesArr.forEach(function (f) {
                                if(!f.type.match("image.*")){
                                    alert("확장자는 이미지 확장자만 가능합니다.");
                                    return false;
                                }

                                sel_files.push(f);

                                var reader = new FileReader();

                                reader.onload = function (e) {
                                    var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index +"\"><img src=\""+e.target.result+"\"data-file='"+f.name+"' class='selProductFile' title='Click to remove' style=\"max-width: 50%; height: auto;\"></a>";
                                    $(".imgsWrap").append(html);


                                }
                                reader.readAsDataURL(f);
                            });
                            index++;
                            var inputHtml = "<input type='file' id='inputImges_"+index+"' name='imgfiles'  hidden />";
                            console.log(inputHtml);
                            $(".inputWrap").append(inputHtml);
                            $("#inputImges_"+index).on("change",hadleImgsFileSelect);
                        }

                        function deleteImageAction(index) {

                            console.log("index : "+index);
                            sel_files.splice(index-1,1,null);
                            var img_id= "#img_id_" + index;

                            var input_id = "#inputImges_"+(index-1);
                            $(img_id).remove();
                            $(input_id).remove();
                            console.log(sel_files);
                        }
                        function fileDelete(obj) {
                            obj.parent().remove();
                        }

                        function fileAdd() {
                            var str = "<p><input type='file' name='files"+"'/>\t<a name=\"delete\" href=\"#\" class=\"badge badge-danger\">파일삭제</a><br/></p>";
                            $("#fileDiv").append(str);

                            $("a[name='delete']").on("click",function (e) {
                                e.preventDefault();
                                fileDelete($(this));
                            });
                        }

                        function imgSubmit() {

                            for(var i=0, len=sel_files.length; i<len; i++){
                                var name = "image_"+1;
                                if(sel_files[i]!=null)
                                    append(name,sel_files[i]);
                            }
                        }

                        function wirte() {
                            var str =$("#content").val();
                            $("#content").val(str);
                            $("#myform").removeAttr('onsubmit');
                            $("#myform").submit();
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