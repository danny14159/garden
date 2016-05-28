<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>植物园管理系统</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet" />
<link href="/static/css/jumbotron.css" rel="stylesheet" />
<style type="text/css">
#myContent {
	position: relative;
}

#myContent li {
	list-style: none;
}

#myContent li img {
	width: 250px
}
</style>
</head>
<body>

	<jsp:include page="/nav.jsp?nav=2"></jsp:include>

	<hr />
	<div class="container">
		<ul id="myContent">

				<%-- <li><a href="/art/detail?id=${i.id }"> <img
						src="${i.cover }" /></a></li> --%>

		</ul>
		<div class="alert alert-danger" style="text-align: center;display: none;" id="alert">就有这么多啦~</div>
	</div>

	<script type="text/javascript" src="/static/js/jquery.min.js"></script>
	<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/static/js/wookmark.min.js"></script>
	<script type="text/javascript">
		/*  (function($) {
			wookmark1 = new Wookmark('#myContent', {
				itemWidth : 250
			// Optional, the width of a grid item
			});
		})(jQuery); */
		$(window).scroll(function() {
			var scrollTop = $(this).scrollTop();
			var scrollHeight = $(document).height();
			var windowHeight = $(this).height();
			if (scrollTop + windowHeight == scrollHeight) {
				loadData();
			}
		});
		var ps = 15;pn = 1;
		function loadData(){
			$.post('/plants/data',{
				ps:ps,pn:pn++
			},function(data){
				if(!data.length){
					$('#alert').fadeIn(300);
					return;
				}
				for(var i in data){
					
					$('#myContent').append('<li><a href="/art/detail?id='+data[i].id+'"> <img\
							src="'+data[i].cover+'" /></a></li>');
					new Wookmark('#myContent', {
						itemWidth : 250
					// Optional, the width of a grid item
					});
				}
			})
		}
		loadData();
	</script>
</body>
</html>
