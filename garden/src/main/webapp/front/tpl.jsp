<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">植物园</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">首页</a></li>
            <li><a href="#about">园艺</a></li>
            <li><a href="#contact">植物</a></li>
            <li><a href="#contact">贴子</a></li>
            <li><a href="#contact">文件</a></li>
            
          </ul>
          <form class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" placeholder="关键字" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">搜索</button>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

      
</div>
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</body>
</html>
