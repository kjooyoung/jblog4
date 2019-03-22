<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<Link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
var insert = function(){
	$.ajax({
		url:"${pageContext.request.contextPath}/${authUser.id}/admin/category",
		type: "post",
		dataType: "json",
		data : {
			"name" : $("#input-name").val(),
			"description" : $("#input-desc").val(),
		},
		success: function(response){
			console.log(response.data.length);
			render(response.data.length, response.data.vo);
			$("#input-name").val("");
			$("#input-desc").val("");
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
};

var getList = function(){
	$.ajax({
		url:"${pageContext.request.contextPath}/${authUser.id}/admin/category/list",
		type: "get",
		dataType: "json",
		data : "",
		success: function(response){
			$(response.data).each(function(index, vo){
				render(index+1, vo);
			});
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
}

var render = function(index, vo){
	var htmls = '<tr data-no="'+vo.no+'"><td class="index">'+index+'</td><td>'+vo.name+'</td>'+
				'<td>'+vo.totalPost+'</td><td>'+vo.description+'</td>'+
				'<td><a data-no="'+vo.no+'" href="">'+
				'<img src="${pageContext.request.contextPath}/assets/images/delete.jpg"></a></tr>';
	$(".admin-cat").append(htmls);
};

var deleteCat = function(no){
	$.ajax({
		url:"${pageContext.request.contextPath}/${authUser.id}/admin/category/"+no,
		type: "post",
		dataType: "json",
		data : "",
		success: function(response){
			if(response.data){
				$("tr[data-no='"+no+"']").remove();
			}
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
}
$(function(){
	getList();
	
	$("#cat-form").submit(function(event){
		event.preventDefault();
		insert();
	});
	
	// live event (미래에 동적으로 생성될 엘리먼트의 이벤트)
	$(document).on("click", ".admin-cat tr a", function(event){
		event.preventDefault();
		var totalCat = ($(".admin-cat tr").length)-1;
		var deleteNo = $(this).data("no");
		var curIndex = $("tr[data-no='"+deleteNo+"'] .index").text()

		$(".index").each(function(){
			if($(this).text() > curIndex){
				$(this).text(($(this).text())-1);
			}
		});
		
		deleteCat(deleteNo);
		
	});
	
});
</script>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp"/>
		<div id="wrapper">
			<div id="content" class="full-screen">
				<ul class="admin-menu">
					<li><a href="${pageContext.request.contextPath}/${authUser.id}/admin/basic">기본설정</a></li>
					<li class="selected">카테고리</li>
					<li><a href="${pageContext.request.contextPath}/${authUser.id}/admin/write">글작성</a></li>
				</ul>
		      	<table class="admin-cat">
		      		<tr>
		      			<th>번호</th>
		      			<th>카테고리명</th>
		      			<th>포스트 수</th>
		      			<th>설명</th>
		      			<th>삭제</th>  
		      		</tr>
				</table>
      			<h4 class="n-c">새로운 카테고리 추가</h4>
      			<form id="cat-form" action="${pageContext.request.contextPath}/${authUser.id}/admin/category" method="post">
			      	<table id="admin-cat-add">
			      		<tr>
			      			<td class="t">카테고리명</td>
			      			<td><input type="text" id="input-name" name="name"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">설명</td>
			      			<td><input type="text" id="input-desc" name="description"></td>
			      		</tr>
			      		<tr>
			      			<td class="s">&nbsp;</td>
			      			<td><input type="submit" value="카테고리 추가"></td>
			      		</tr>      		      		
			      	</table> 
		      	</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp"/>
	</div>
</body>
</html>