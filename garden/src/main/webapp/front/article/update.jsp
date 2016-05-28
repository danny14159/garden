
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
<style type="text/css">
.error{color:red;}
</style>
</head>
<body>

<h1 class="page-header">文章 - 修改</h1>

<form form-ajax class="form-horizontal" id="main-form" action="/article/update" forward="/article/?type=1">


   
      <input type="hidden" class="form-control required" id="inputid" placeholder="" name="id" value="${data.id}">
    
 
<div class="col-sm-12">
  <div class="form-group">
    <label for="inputtitle" class="col-sm-4 control-label">
    	标题	
    </label>
    <div class="col-sm-6">
    
   
      <input type="text" class="form-control required" id="inputtitle" placeholder="标题" name="title" value="${data.title}">
    
    </div>
  </div>
  </div>
 
<div class="col-sm-12">
  <div class="form-group">
    <label for="inputcontent" class="col-sm-4 control-label">
    	文章内容	
    </label>
    <div class="col-sm-6">
     <script id="container" name="content" type="text/plain">${data.content}</script>
    </div>
  </div>
  </div>
 
 
<div class="col-sm-12">
  <div class="form-group">
    <label for="inputbrief_intro" class="col-sm-4 control-label">
    	简介
    </label>
    <div class="col-sm-6">
    
   
      <textarea type="text" class="form-control required" id="inputbrief_intro" name="brief_intro" rows="5">${data.brief_intro}</textarea>
    
    </div>
  </div>
  </div>
 
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary btn-sm">修改</button>
    </div>
  </div>
</form>


<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/static/js/messages_zh.min.js"></script>
<script type="text/javascript" src="/static/js/form-ajax.js"></script>
<script type="text/javascript" src="/static/laydate/laydate.js"></script>
 <!-- 配置文件 -->
<script type="text/javascript" src="/static/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/static/ueditor/ueditor.all.min.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container',{
    	toolbars: [
    	           ['fullscreen', 'source', 'undo', 'redo'],
    	           ['bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc']
    	       ]
    });
</script>
<script type="text/javascript">

</script>
</body>
</html>