<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'imageAdd.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
function check(){
	var name = document.getElementById("file").value;
	if("" == name){
		alert("图片不可为空");
		return false;
	}else {
		return true;
	}
}
function upimg(imgfile){
	var file=document.getElementById("file");
    var div=document.getElementById("picshow");  
    div.innerHTML="<img  src="+file.value+" border='0' width='200px' height='300px'>"; 
} 
$(function() {
	var x = '<%=request.getParameter("result")%>';
		if (x != "" && x != null) {
			if (x == "success")
				alert("上传成功!");
			else if (x == "failed")
				alert("上传失败");
		}
	})
</script>
</head>

<body>
<div style="float: right;">
		<font size="5">图片上传&nbsp<a href="Image!datagrid.do">返回</a></font>
	</div>
	<br>
	<div id="picshow"></div>
	<form action="Image!add.do?methodType=add" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="user" value="${sessionScope.homeData[0].user_Name}">
		<input id="file" type="file" name="image" >
		<br> <input type="submit">
	</form>
</body>
</html>
