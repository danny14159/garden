<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>植物园管理系统 - 个人中心</title>
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

<jsp:include page="/nav.jsp"></jsp:include>
<div class="container">
	<hr/>
	<div class="col-sm-8">
		<div class="row">
		<div class="col-sm-4">
			<img src="/static/avatar/${me.id % 5 }.jpg" width="80%"/>
		</div>
		
		<form form-ajax action="/user/update" forward="/profile" method="post">
		<input type="hidden" name="id" value="${me.id }"/>
		<div class="col-sm-8">
			  <div class="form-group">
			    <label for="">昵称</label>
			    <input type="text" class="form-control" name="nickname" placeholder="填写昵称" value="${me.nickname }">
			  </div>
			  <div class="form-group">
			    <label for="">性别</label>
				<select class="form-control" name="sex">
					<option <c:if test="${me.sex eq '男' }">selected="selected"</c:if>>男</option>
					<option <c:if test="${me.sex eq '女' }">selected="selected"</c:if>>女</option>
				</select>
			  </div>
			  <div class="form-group">
			    <label for="">邮箱</label>
			    <input type="text" class="form-control" name="email" placeholder="填写个人邮箱" value="${me.email }">
			  </div>
			  <div class="form-group">
			    <label for="">出生日期</label>
			    
			    <input type="text" class="form-control" name="birth" placeholder="" onclick="laydate()" value="<fmt:formatDate value="${me.birth }" pattern="yyyy-MM-dd"/>">
			  </div>
			  <div class="form-group">
			    <label for="">个人简介</label>
			    <textarea class="form-control" name="self_intro" placeholder="填写个人简介">${me.self_intro }</textarea>
			  </div>
			  <button type="submit" class="btn btn-primary">保存个人资料</button>
		</div>
		</form>
		
		</div>
		
		<hr/>
		
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
<script type="text/javascript" src="/static/js/form-ajax.js"></script>
<script type="text/javascript" src="/static/laydate/laydate.js"></script>
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
