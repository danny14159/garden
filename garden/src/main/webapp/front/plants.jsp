<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>植物园管理系统</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/static/css/jumbotron.css" rel="stylesheet"/>
<style type="text/css">
#myContent{position:relative;}
#myContent li{list-style: none;}
#myContent li img{width:250px}
</style>
</head>
<body>

<jsp:include page="/nav.jsp?nav=2"></jsp:include>

<hr/>
<div class="container">
<ul id="myContent">

<c:forEach items="${list }" var="i">
	<li><a href="/art/detail?id=${i.id }">
		<img src="${i.cover }"/></a>
	</li>
</c:forEach>
<c:forEach items="${list }" var="i">
	<li>
		<img src="${i.cover }"/>
	</li>
</c:forEach>
<c:forEach items="${list }" var="i">
	<li>
		<img src="${i.cover }"/>
	</li>
</c:forEach>
<c:forEach items="${list }" var="i">
	<li>
		<img src="${i.cover }"/>
	</li>
</c:forEach>
</ul>
</div>
      
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/wookmark.min.js"></script>
<script type="text/javascript">
(function ($) {
    var wookmark1 = new Wookmark('#myContent', {
        itemWidth: 250 // Optional, the width of a grid item
    });
  })(jQuery);
</script>
</body>
</html>
