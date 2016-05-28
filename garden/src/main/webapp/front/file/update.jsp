
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

<h1 class="page-header">文件 - 修改</h1>

<form form-ajax class="form-horizontal" id="main-form" action="/file/update" forward="/file/">


<div class="col-sm-6">
  <div class="form-group">
    <label for="inputid" class="col-sm-4 control-label">
    	id
    </label>
    <div class="col-sm-6">
    
   
      <input type="text" class="form-control required" id="inputid" placeholder="" name="id" value="${data.id}">
    
    </div>
  </div>
  </div>
 
<div class="col-sm-6">
  <div class="form-group">
    <label for="inputname" class="col-sm-4 control-label">
    	文件名	
    </label>
    <div class="col-sm-6">
    
   
      <input type="text" class="form-control required" id="inputname" placeholder="文件名" name="name" value="${data.name}">
    
    </div>
  </div>
  </div>
 
<div class="col-sm-6">
  <div class="form-group">
    <label for="inputpath" class="col-sm-4 control-label">
    	访问路径	
    </label>
    <div class="col-sm-6">
    
   
      <input type="text" class="form-control required" id="inputpath" placeholder="访问路径" name="path" value="${data.path}">
    
    </div>
  </div>
  </div>
 
<div class="col-sm-6">
  <div class="form-group">
    <label for="inputcreate_time" class="col-sm-4 control-label">
    	创建时间	
    </label>
    <div class="col-sm-6">
    
      <input type="text" class="form-control required laydate-icon" id="inputcreate_time" placeholder="创建时间" name="create_time" onclick="laydate()" value="<fmt:formatDate value="${data.create_time}" pattern="yyyy-MM-dd"/>">
   
   
    </div>
  </div>
  </div>
 
<div class="col-sm-6">
  <div class="form-group">
    <label for="inputdownload_times" class="col-sm-4 control-label">
    	下载次数	
    </label>
    <div class="col-sm-6">
    
   
      <input type="text" class="form-control required" id="inputdownload_times" placeholder="下载次数" name="download_times" value="${data.download_times}">
    
    </div>
  </div>
  </div>
 
<div class="col-sm-6">
  <div class="form-group">
    <label for="inputfile_type" class="col-sm-4 control-label">
    	文件类型	
    </label>
    <div class="col-sm-6">
    
   
      <input type="text" class="form-control required" id="inputfile_type" placeholder="文件类型" name="file_type" value="${data.file_type}">
    
    </div>
  </div>
  </div>
 
<div class="col-sm-6">
  <div class="form-group">
    <label for="inputuploader" class="col-sm-4 control-label">
    	uploader
    </label>
    <div class="col-sm-6">
    
   
      <input type="text" class="form-control required" id="inputuploader" placeholder="" name="uploader" value="${data.uploader}">
    
    </div>
  </div>
  </div>
 
<div class="col-sm-6">
  <div class="form-group">
    <label for="inputdescn" class="col-sm-4 control-label">
    	descn
    </label>
    <div class="col-sm-6">
    
   
      <input type="text" class="form-control required" id="inputdescn" placeholder="" name="descn" value="${data.descn}">
    
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
<script type="text/javascript">

</script>
</body>
</html>