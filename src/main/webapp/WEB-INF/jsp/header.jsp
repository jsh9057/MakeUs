<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="dashboard-header">
    <nav class="navbar navbar-expand-lg bg-white fixed-top">
        <a class="navbar-brand" href="../home">Computer Science</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto navbar-right-top">


                <li class="nav-item dropdown connection"></li>
                <c:choose>
                    <c:when test="${empty user}">
                       <a class="dropdown-item" href="../signin"> <i class="fas fa-user mr-2"></i>Login</a>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item dropdown nav-user"><a
                                class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="../assets/images/avatar-1.jpg" alt=""
                                 class="user-avatar-md rounded-circle">
                        </a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown"
                                 aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name">${user.nick}</h5>
                                    <span class="status"></span><span class="ml-2">${user.name}</span>
                                </div>
<%--                                <a class="dropdown-item" href="../signin"><i class="fas fa-user mr-2"></i>내 정보</a>--%>
                                <a class="dropdown-item" href="../logout"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </nav>
</div>
