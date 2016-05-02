

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
<style type="text/css">
.error{color:red;}
</style>
</head>
<body>

<h1 class="page-header">公告 - 新增</h1>

<form form-ajax class="form-horizontal" id="main-form" action="/notify/insert">


<div class="col-sm-6">
  <div class="form-group">
    <label for="inputid" class="col-sm-4 control-label">
    	id
    </label>
    <div class="col-sm-6">
    
   
      <input type="text" class="form-control required" id="inputid" placeholder="" name="id">
    
    </div>
  </div>
  </div>
 
<div class="col-sm-6">
  <div class="form-group">
    <label for="inputtitle" class="col-sm-4 control-label">
    	标题
    </label>
    <div class="col-sm-6">
    
   
      <input type="text" class="form-control required" id="inputtitle" placeholder="标题" name="title">
    
    </div>
  </div>
  </div>
 
<div class="col-sm-6">
  <div class="form-group">
    <label for="inputcontent" class="col-sm-4 control-label">
    	内容
    </label>
    <div class="col-sm-6">
    
   
      <input type="text" class="form-control required" id="inputcontent" placeholder="内容" name="content">
    
    </div>
  </div>
  </div>
 
<div class="col-sm-6">
  <div class="form-group">
    <label for="inputauthor" class="col-sm-4 control-label">
    	作者
    </label>
    <div class="col-sm-6">
    
   
      <input type="text" class="form-control required" id="inputauthor" placeholder="作者" name="author">
    
    </div>
  </div>
  </div>
 
<div class="col-sm-6">
  <div class="form-group">
    <label for="inputcreate_time" class="col-sm-4 control-label">
    	创建时间
    </label>
    <div class="col-sm-6">
    
      <input type="text" class="form-control required laydate-icon" id="inputcreate_time" placeholder="创建时间" name="create_time" onclick="laydate()">
   
   
    </div>
  </div>
  </div>
 
<div class="col-sm-6">
  <div class="form-group">
    <label for="inputupdate_time" class="col-sm-4 control-label">
    	修改时间
    </label>
    <div class="col-sm-6">
    
      <input type="text" class="form-control required laydate-icon" id="inputupdate_time" placeholder="修改时间" name="update_time" onclick="laydate()">
   
   
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


<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/static/js/messages_zh.min.js"></script>
<script type="text/javascript" src="/static/js/form-ajax.js"></script>
<script type="text/javascript" src="/static/laydate/laydate.js"></script>
<script type="text/javascript">

</script>
</body>
</html>