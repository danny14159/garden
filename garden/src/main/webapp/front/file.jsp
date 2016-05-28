<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
td{border:none!important;}
.upload_btn{width:350px;height: 40px;text-align: center;border-radius:5px;line-height: 40px;background: #446e9b;
    color: #fff;}
.upload_btn:hover{cursor: pointer;}
#filetpl{display: none;}
</style>
</head>
<body>

<jsp:include page="/nav.jsp?nav=4"></jsp:include>
<hr/>
<div class="container">

<div class="col-sm-7">

<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"0","bdPos":"right","bdTop":"100"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
	<table class="table table-striped table-noborder">
	<c:forEach items="${data }" var="i">
		<c:set var="thumb" value="/static/file_suffix/${fn:toLowerCase(i.file_type) }.png"/>
		<c:if test="${fn:toLowerCase(i.file_type) == 'jpeg' or fn:toLowerCase(i.file_type) == 'jpg' }">
			<c:set var="thumb" value="/upd/download/${i.id }"/>
		</c:if>
		<tr>
			<td width="20%"><img src="${thumb }" width="100px"/></td>
			<td width="70%">
				<table class="table">
					<tr><td><a class="text-info" href="javascript:;">${i.name }</a>
					
					<div class="pull-right">
					<a class="text-danger" href="/upd/download/${i.id }" download="${i.name }">下载</a>
					</div>
					
					</td></tr>
					<tr><td><p class="text-muted">
						上传于<fmt:formatDate value="${i.create_time }" pattern="yyyy-MM-dd HH:mm"/>
					</p>
					<p class="text-muted">
						<c:if test="${empty i.descn }">该文件还没有编辑描述哦~</c:if>
						<c:if test="${!empty i.descn }">${i.descn }</c:if>
					</p>
					
					
					</td></tr>
				</table>
			</td>
		</tr>
	</c:forEach>
	</table>
</div>
<div class="col-sm-5">
	<!-- <div class="upload_btn" onclick="">上传文件</div> -->
	<div id="file_upload"></div>
	<p class="text-danger">下载排行</p>
	<c:forEach items="${data }" var="i">
	<div class="col-sm-4 file-block">
		<img src="/static/file_suffix/${fn:toLowerCase(i.file_type) }.png" width="80px"/>
		<div class="text-info" style="text-overflow:ellipsis;width:100%;overflow: hidden;">${i.name }</div>
		<div class="text-muted"><small>上传于<fmt:formatDate value="${i.create_time }" pattern="yyyy-MM-dd HH:mm"/></small></div>
	</div>
	</c:forEach>
</div>

<div id="filetpl">
<div style="padding: 15px;">
文件名：
<input type="text" class="form-control upload_file_name" placeholder="">
	添加文件描述：<textarea class="form-control file_descn" rows="3" placeholder="请填写文档简介，帮助别人了解文件"></textarea>
	</div>
</div>

</div>
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="/static/layer/layer.js"></script>
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
        		//alert('上传成功！');location.reload();
        		finishUpload(data.data.id,data.data.name);
        	}
        	else{
        		alert('上传失败！');
        	}
        }
    });
});
function finishUpload(id,name){
	//页面层
	layer.open({
		type: 1,
		closeBtn: 0,
		//skin: 'layui-layer-rim', //加上边框
		area: ['420px', '400px'], //宽高
		content: $('#filetpl').html(),
		success:function(){
			$('.upload_file_name').val(name);
		},
		yes: function(index, layero){
		    //do something
		    
		    $.post('/file/update',{
		    	id:id,
		    	name:$('.layui-layer-content .upload_file_name').val(),
		    	descn:$('.layui-layer-content .file_descn').val()
		    },function(data){
		    	if(data.ok){
		    		location.reload();
				    layer.close(index); //如果设定了yes回调，需进行手工关闭
		    	}
		    	else{
		    		alert('修改失败！');
		    	}
		    })
		  },
		btn:['确定']
	});
	
}
</script>
</body>
</html>
