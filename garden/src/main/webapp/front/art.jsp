<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>植物园管理系统</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/static/css/jumbotron.css" rel="stylesheet"/>
<style type="text/css">
</style>
</head>
<body>

<div class="container">

<jsp:include page="/nav.jsp?nav=1"></jsp:include>
<hr/>
<table class="table table-striped">
<c:forEach items="${data }" var="i">
	<tr>
		<td width="20%"><img src="${i.cover }" width="200px"/></td>
		<td width="70%">
			<table class="table">
				<tr><td><a class="text-info" href="/art/detail?id=${i.id }">${i.title }</a></td></tr>
				<tr><td><p class="text-muted">${i.brief_intro }</p></td></tr>
			</table>
		</td>
	</tr>
</c:forEach>
</table>
<c:if test="${fn:length(data) == 0 }">
<hr/>
<center>没有找到结果哦~！</center>

</c:if>
</div>
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</body>
</html>
