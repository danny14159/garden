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
<style type="text/css">
.tiezi{margin-top: 15px;}
.tiezi li{margin: 15px;list-style: none;}
body{background:url('/static/img/body_bg.jpg') no-repeat; background-color: #b4daf0}
ul{padding-left: 0}
.row{background: rgba(255,255,255,0.5);;border-radius:3px;padding: 25px 0}
.table .table{background-color: transparent;}
.cmt_area .row{padding: 5px 0}
hr{border: none;}
.form-control{border:none;}
</style>
</head>
<body>

<jsp:include page="/nav.jsp?nav=3"></jsp:include>
<div class="container">
	<hr/>
	<div class="col-sm-8">
		<div class="row">
		<div class="col-sm-4">
			<img src="/upd/avatar/${me.id }" onerror="this.src='/static/avatar/${me.id % 5 }.jpg'" width="80%"/>
		</div>
		
		<div class="col-sm-8">
			  <div class="form-group">
			    <label for="exampleInputEmail1">主题</label>
			    <input type="text" class="form-control" id="title" placeholder="写下新帖子的主题">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">内容</label>
			    <textarea class="form-control" id="content" placeholder="填写帖子的内容"></textarea>
			  </div>
			  <button type="button" class="btn btn-primary" onclick="submit()">发表</button>
		</div>
		</div>
		
		<hr/>
		<div class="row">
		<ul class="tiezi">
		
			<c:forEach items="${data }" var="i" varStatus="s">
			<li><div class="row">
				<div class="col-sm-2" style="text-align: center;">
					<img  src="/upd/avatar/${i.create_by }" onerror="this.src='/static/avatar/${i.create_by % 5 }.jpg'" width="100%" class="img-thumbnail"/>
					${i.create_username }
				</div>
				<div class="col-sm-10">
					<p class="text-info"><strong>${i.title }</strong><small class="text-muted">&nbsp;
						<fmt:formatDate value="${i.create_time }" pattern="yyyy-MM-dd HH:mm"/>
					</small></p>
					<p class="">${i.content }</p>
				
					<a href="javascript:;"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>收藏</a>&nbsp;&nbsp;
					<a href="/tiezi/praise?tieziId=${i.id }"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
					<c:if test="${i.hasPraised > 0 }">取消赞</c:if>
					<c:if test="${i.hasPraised eq 0 or i.hasPraised == null}">赞</c:if>
					(${i.nPraise })</a>&nbsp;&nbsp;
					<a href="javascript:;" onclick="comment(this)"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>评论(${i.nComment })</a>
				<div class="comment-area" style="display: none;">
					 <textarea class="form-control" placeholder="填写评论的内容"></textarea>
					 <a href="javascript:;" onclick="sendComment(${i.id},this)">确定</a>
					 <a href="javascript:;" class="text-muted" onclick="cancelComment(this)">取消</a>
				</div>
				
				<ul class="cmt_area">
					<c:forEach items="${i.comments }" var="c">
						<li class="row">
						<div class="col-sm-1"  style="padding: 0;">
							<img src="/upd/avatar/${c.user_id }" onerror="this.src='/static/avatar/${c.user_id % 5 }.jpg'" width="50px" class="img-thumbnail"/>
						</div>
						<div class="col-sm-11" >
							<small class="" style="color:#eb7350">${c.username }&nbsp;：</small>
							<span>${c.content }</span>
							<div class="text-muted"><small><fmt:formatDate value="${c.create_time }" pattern="yyyy-MM-dd HH:mm"/></small></div>
						</div>
						</li>
					</c:forEach>
				</ul>
				
				</div></div>
			</li>
			</c:forEach>
		</ul>
		</div>
		
	</div>
	<div class="col-sm-4">
	<p class="text-danger">热门推荐</p>
	<table class="table table-bordered" style="background: rgba(255,255,255,0.5);">
		<c:forEach items="${list }" var="i">
			<tr>
				<td width="20%"><img src="${i.cover }" width="200px"/></td>
				<td width="70%">
					<table class="table">
						<tr><td><a class="text-info" href="/art/detail?id=${i.id }">${i.title }</a></td></tr>
						<%-- <tr><td><p class="text-muted">${i.brief_intro }</p></td></tr> --%>
					</table>
				</td>
			</tr>
		</c:forEach>
</table>
	</div>
      
</div>
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
function submit(){
	var title = $('#title').val();
	var content = $('#content').val();
	
	if(!title){ alert('写个标题吧~');return;}
	if(!content) alert('写点内容吧~');
	
	$.post('/tiezi/insert',{
		title:title,
		content:content
	},function(data){
		if(data.ok){
			location.reload();
		}
		else{
			alert(data.msg)
		}
	})
}
function cancelComment(btn){
	$(btn).closest('.comment-area').hide(300);
}
function comment(btn){
	$(btn).next('.comment-area').show(300);
}
function sendComment(id,btn){
	var comment = $(btn).closest('.comment-area').children('textarea').val();
	$.post('/tiezicomment/insert',{
		content:comment,
		tiezi_id: id
	},function(data){
		if(data){
			location.reload();
		}
	})
}
</script>
</body>
</html>
