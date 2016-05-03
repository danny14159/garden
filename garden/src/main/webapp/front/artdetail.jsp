<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<jsp:include page="/nav.jsp?nav=${data.type }"></jsp:include>
<hr/>
	<div class="col-sm-8">
		<h1 class="">${data.title }</h1>
		<hr/>
		<p class="text-muted"><%-- 作者：${data.author} --%>创建时间：<fmt:formatDate value="${data.create_time }"/>&nbsp;修改时间：<fmt:formatDate value="${data.update_time }"/></p>
		<p class="text-muted">${data.brief_intro }</p>
		<div>${data.content }</div>
		</div>

	<div class="col-sm-4 pull-right">
	<p class="text-danger">相关推荐</p>
	<table class="table table-bordered">
		<c:forEach items="${list }" var="i">
			<tr>
				<td width="20%"><img src="${i.cover }" width="200px"/></td>
				<td width="70%">
					<table class="table">
						<tr><td><a class="text-info" href="/art/detail?id=${i.id }">${i.title }</a></td></tr>
						<%-- <tr><td><p class="text-muted">${i.brief_intro }</p></td></tr> --%>
					</table>
				</td>
			</tr>
		</c:forEach>
</table>
</div>
	</div>
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</body>
</html>
