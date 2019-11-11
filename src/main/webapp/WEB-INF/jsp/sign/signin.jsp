<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="../assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/libs/css/style.css">
    <link rel="stylesheet" href="../assets/vendor/fonts/fontawesome/css/fontawesome-all.css">

    <style>
    html,
    body {
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
    }
    </style>
</head>

<body>
    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><a href="../home"><img class="logo-img" src="../assets/images/logo.png" alt="logo"></a><span class="splash-description">서경대 컴퓨터과학과 홈페이지.</span></div>
            <div class="card-body">
            <!-- login form -->
                <form id= "signin_form" method="post" action="/signinpost">
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="username" name="userId" type="text" placeholder="학번" autocomplete="off" required="">
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="password" name="password" type="password" placeholder="비밀번호" required="">
                    </div>
                    <div class="form-group">
                        <label class="custom-control custom-checkbox">
<%--                            <input class="custom-control-input" type="checkbox" checked="checked"><span class="custom-control-label">Remember Me</span>--%>
                        </label>
                    </div>
                    <button id = "signin_btn" class="btn btn-primary btn-lg btn-block" >Sign in</button>
                </form>
            </div>
<%--            <div class="card-footer bg-white p-0  ">--%>
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="/signup" class="footer-link" >Create An Account</a></div>
<%--                <div class="card-footer-item card-footer-item-bordered">--%>
<%--                    <a href="#" class="footer-link">Forgot Password</a>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
    </div>
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="../assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../assets/libs/js/signin.js"></script>
</body>
 
</html>