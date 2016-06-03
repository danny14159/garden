<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/static/uploadify/uploadify.css" rel="stylesheet"/>
<style type="text/css">
.error{color:red;}
</style>
</head>
<body>

<h1 class="page-header">编辑文章</h1>

<form form-ajax class="form-horizontal" id="main-form" action="/article/insert" forward="/article/">


<div class="col-sm-12">
  <div class="form-group">
    <label for="inputtitle" class="col-sm-4 control-label">
    	标题
    </label>
    <div class="col-sm-6">
    
   
      <input type="text" class="form-control required" id="inputtitle" placeholder="标题" name="title">
    
    </div>
  </div>
  </div>
<div class="col-sm-12">
  <div class="form-group">
    <label for="inputtitle" class="col-sm-4 control-label">
    	类型
    </label>
    <div class="col-sm-6">
    
   <select name="type">
   	<option value="1">园艺</option>
   	<option value="2">植物</option>
   	</select>
    
    </div>
  </div>
  </div>
  
<div class="col-sm-12">
  <div class="form-group">
    <label for="inputtitle" class="col-sm-4 control-label">
    	封面
    </label>
    <div class="col-sm-6">
    
    <input type="hidden" name="cover" id="cover"/>
    <div id="file_upload"></div>
    <div id="preview"></div>
    </div>
  </div>
  </div>
<div class="col-sm-12">
  <div class="form-group">
    <label for="inputtitle" class="col-sm-4 control-label">
    	简介
    </label>
    <div class="col-sm-6">
    
      <input type="text" class="form-control required" id="inputtitle" placeholder="简介" name="brief_intro">
    
    </div>
  </div>
  </div>
 
<div class="col-sm-12">
  <div class="form-group">
    <label for="inputcontent" class="col-sm-4 control-label">
    	文章内容
    </label>
    <div class="col-sm-6">
    
       <script id="container" name="content" type="text/plain"></script>
    
    </div>
  </div>
  </div>
 
 
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary btn-sm">提交</button>
      <button type="reset" class="btn btn-default btn-sm">重置</button>
    </div>
  </div>
</form>

<!-- <form method="post" enctype="multipart/form-data" action="/upd/cover">
<input type="file" name="img"/><button>go</button>
</form> -->

<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/static/js/messages_zh.min.js"></script>
<script type="text/javascript" src="/static/js/form-ajax.js"></script>
<script type="text/javascript" src="/static/laydate/laydate.js"></script>
<script type="text/javascript" src="/static/uploadify/jquery.uploadify.min.js"></script>
 <!-- 配置文件 -->
<script type="text/javascript" src="/static/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/static/ueditor/ueditor.all.min.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container',{
    	toolbars: [
    	           ['fullscreen', 'source', 'undo', 'redo'],
    	           ['bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc','simpleupload']
    	       ]
    });
</script>
<script type="text/javascript">
$(function() {
    $("#file_upload").uploadify({
        height        : 30,
        swf           : '/static/uploadify/uploadify.swf',
        uploader      : '/upd/cover',
        'fileObjName' : 'img',
        'fileTypeExts':'*.gif; *.jpg; *.png; *.bmp',
   	 	'fileTypeDesc': '图片文件(*.gif; *.jpg; *.png;*.bmp)',
		 'multi'    : false,
        'buttonText': '上传图片',
        width         : 120,
        'onUploadSuccess' : function(file, data, response) {
        	data = JSON.parse(data);
        	$('#cover').val(data.data.path);
        	$('#preview').append($('<img>').attr('src',data.msg));
        }
    });
});
</script>
</body>
</html>