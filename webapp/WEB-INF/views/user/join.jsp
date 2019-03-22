<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<Link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
var valid = function(str){
	var htmls = '<p style="margin:0; padding:0; font-weight:bold; color:red; text-align: left">'+
				str+'을 입력해주세요.</p>';
	return htmls;
};

$(function(){
	$("#btn-submit").click(function(){
		$("#join-form p").remove();
		
		if($("#name").val() == ""){
			$("#name").after(valid($('label[for="name"]').text())).focus();
			return false;
		}
		
		if($("#blog-id").val() == ""){
			$("#btn-checkid").after(valid($('label[for="blog-id"]').text())).focus();
			return false;
		}
		
		if($("#img-checkid").is(":visible") == false){
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		
		if($("#password").val() == ""){
			$("#password").after(valid($('label[for="password"]').text())).focus();
			return false;
		}
		
		if($("#agree-prov").is(":checked") == false){
			alert("서비스 약관에 동의해주세요.");
			return false;
		}
	});
	
	$("#blog-id").change(function(){
		$("#btn-checkid").show();
		$("#img-checkid").hide();
	});
	
	$("#btn-checkid").click(function(){
		var id = $("#blog-id").val();
		if(id == "") {
			return;
		}
		
		$.ajax({
			url:"${pageContext.servletContext.contextPath }/user/api/checkId?id="+id,
			type:"post",
			dataType:"json",
			data: "",
			success: function(response){
				if(response.result == "fail"){
					console.error(response.message);
					return;
				}
				
				if(response.data == false ){
					alert("이미 존재하는 이메일입니다. 다른 이메일을 사용해주세요.");
					$("#email").val("").focus();
					return;
				}
				
				// 사용가능한 이메일
				$("#btn-checkid").hide();
				$("#img-checkid").show();
			},
			error: function(xhr, status, e){
				console.error(status+":"+e);
			}
		});
	});
});
</script>
</head>
<body>
	<div class="center-content">
		<h1 class="logo" onclick="location.href='${pageContext.request.contextPath}'">JBlog</h1>
		<ul class="menu">
			<c:choose>
				<c:when test="${authUser eq null }">
					<li><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/user/join">회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
					<li><a href="">내블로그</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<form:form class="join-form" id="join-form" method="post"  modelAttribute="userVo" 
					action="${pageContext.request.contextPath}/user/join">
			<label class="block-label" for="name">이름</label>
			<form:input path="name"/>
			<p style="margin:0; padding:0; font-weight:bold; color:red; text-align: left">
				<form:errors path="name"/>
			</p>
			
			
			<label class="block-label" for="blog-id">아이디</label>
			<form:input id="blog-id" path="id"/>
			
			<input id="btn-checkid" type="button" value="id 중복체크">
			<img id="img-checkid" style="display: none;" src="${pageContext.request.contextPath}/assets/images/check.png">
			<p style="margin:0; padding:0; font-weight:bold; color:red; text-align: left">
				<form:errors path="id"/>
			</p>

			<label class="block-label" for="password">패스워드</label>
			<form:input path="password" type="password"/>
			<p style="margin:0; padding:0; font-weight:bold; color:red; text-align: left">
				<form:errors path="password"/>
			</p>
			<fieldset>
				<legend>약관동의</legend>
				<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
				<label class="l-float">서비스 약관에 동의합니다.</label>
			</fieldset>

			<input id="btn-submit"type="submit" value="가입하기">

		</form:form>>
	</div>
</body>
</html>
