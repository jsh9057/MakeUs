<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<script type="text/javascript">
    var message = "${msg}";
    var returnUrl = "${url}";
    if(message != ""){
        alert(message);
        document.location.href = returnUrl;
    }
    document.location.href = returnUrl;
</script>
</body>
</html>