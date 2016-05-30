<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>植物园管理系统</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/static/css/jumbotron.css" rel="stylesheet"/>
<style type="text/css">
#carousel-example-generic{width:80%}
</style>
</head>
<body>

<div class="container">

<jsp:include page="/nav.jsp"></jsp:include>

 <div class="masthead">
       <!--  <h3 class="text-muted">欢迎来到植物园</h3> --><hr/>
</div>
      
      <center>
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="/static/img/${month }/2.jpg" alt="" width="100%">
      <div class="carousel-caption">植物园一角
      </div>
    </div>
    <div class="item">
      <img src="/static/img/${month }/1.jpg" alt="" width="100%">
      <div class="carousel-caption">植物园一角
      </div>
    </div>
    <div class="item">
      <img src="/static/img/${month }/3.jpg" alt="" width="100%">
      <div class="carousel-caption">植物园一角
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</center>
</div>
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</body>
</html>
