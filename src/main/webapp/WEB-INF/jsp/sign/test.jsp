<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
�α��� ����
<% 
Object lobj_getdata = session.getAttribute("������");
String ls_getdata = (String)lobj_getdata; 

out.println(" ������ ���ǰ� [1] =>" + ls_getdata + "<br><br>");
%>
</body>
</html>