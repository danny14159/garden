<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
body{font-family: 'Microsoft Yahei'}
</style>
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
        	
            <li<c:if test="${empty param.nav or param.nav == 0 }"> class="active"</c:if>><a href="/">首页</a></li>
            <li<c:if test="${param.nav == 1 }"> class="active"</c:if>><a href="/art">园艺</a></li>
            <li<c:if test="${param.nav == 2 }"> class="active"</c:if>><a href="/plants">植物</a></li>
            <c:if test="${me != null }"><li<c:if test="${param.nav == 3 }"> class="active"</c:if>><a href="/tiezi">贴子</a></li>
            <li<c:if test="${param.nav == 4 }"> class="active"</c:if>><a href="/file">文件</a></li></c:if>
            
          </ul>
          <form class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" placeholder="关键字" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">搜索</button>
            <c:if test="${me != null }">
            <span class="" style="color:#fff;">${me.username }</span><a class="btn btn-default" href="/app/login">退出</a>
            </c:if>
            <c:if test="${me == null }">
            	<a class="btn btn-default" href="/register">注册</a>
            	<a class="btn btn-default" href="/app/login">登录</a>
            </c:if>
            
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>
