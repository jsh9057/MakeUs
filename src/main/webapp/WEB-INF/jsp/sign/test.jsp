<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
로그인 성공
<% 
Object lobj_getdata = session.getAttribute("정승현");
String ls_getdata = (String)lobj_getdata; 

out.println(" 설정된 세션값 [1] =>" + ls_getdata + "<br><br>");
%>
</body>
</html>