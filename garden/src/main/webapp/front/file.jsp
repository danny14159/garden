<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>植物园管理系统</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/static/css/jumbotron.css" rel="stylesheet"/>
<link href="/static/uploadify/uploadify.css" rel="stylesheet"/>
<style type="text/css">
.file-block{margin: 15px;padding: 8px;border:1px solid #eee;border-radius:5px;text-align: center;}
.file-block:hover{background: #eee;cursor: pointer;}
</style>
</head>
<body>

<jsp:include page="/nav.jsp?nav=4"></jsp:include>
<hr/>
<div class="container">

<div class="col-sm-7">
	<table class="table table-striped">
	<c:forEach items="${data }" var="i">
		<c:set var="thumb" value="/static/file_suffix/${i.file_type }.png"/>
		<c:if test="${i.file_type == 'jpeg' or i.file_type == 'jpg' }">
			<c:set var="thumb" value="${i.path }"/>
		</c:if>
		<tr>
			<td width="20%"><img src="${thumb }" width="100px"/></td>
			<td width="70%">
				<table class="table">
					<tr><td><a class="text-info" href="/art/detail?id=${i.id }">${i.name }</a></td></tr>
					<tr><td><p class="text-muted">
						上传于<fmt:formatDate value="${i.create_time }" pattern="yyyy-MM-dd HH:mm"/>
					</p>
					<a class="text-info" href="${i.path }" download="${i.name }">下载</a>
					<a class="text-muted" href="${i.path }" target="_blank">预览</a>
					
					</td></tr>
				</table>
			</td>
		</tr>
	</c:forEach>
	</table>
</div>
<div class="col-sm-5">
	<div id="file_upload"></div>
	<p class="text-danger">下载排行</p>
	<c:forEach items="${data }" var="i">
	<div class="col-sm-4 file-block">
		<img src="/static/file_suffix/${i.file_type }.png" width="80px"/>
		<div class="text-info" style="text-overflow:ellipsis;width:100%;overflow: hidden;">${i.name }</div>
		<div class="text-muted"><small>上传于<fmt:formatDate value="${i.create_time }" pattern="yyyy-MM-dd HH:mm"/></small></div>
	</div>
	</c:forEach>
</div>
      
</div>
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript">
$(function() {
    $("#file_upload").uploadify({
        height        : 30,
        swf           : '/static/uploadify/uploadify.swf',
        uploader      : '/upd/cover',
        'fileObjName' : 'img',
		 'multi'    : false,
        'buttonText': '上传文件',
        width         : 350,
        height:40,
        'onUploadSuccess' : function(file, data, response) {
        	data = JSON.parse(data);
        	if(data.ok){
        		alert('上传成功！');location.reload();
        	}
        	else{
        		alert('上传失败！');
        	}
        }
    });
});
</script>
</body>
</html>
