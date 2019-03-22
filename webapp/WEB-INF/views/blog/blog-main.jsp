<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<Link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/jblog.css?ver=4">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
var render = function(vo, mode){
	var auth = '<tr data-no="'+vo.no+'"><th>'+vo.id+
				'<img class="btn-update" data-no="'+vo.no+'" src="${pageContext.request.contextPath}/assets/images/updatee.png">'+
				'<img class="btn-delete" data-no="'+vo.no+'" src="${pageContext.request.contextPath}/assets/images/delete.jpg"></th>'+
				'<th style="text-align: right; color: #999;">'+vo.regDate+'</th></tr>'+
				'<tr class="td-con" data-no="'+vo.no+'"><td colspan="2">'+vo.content+'</td></tr>';
				
	var htmls = '<tr data-no="'+vo.no+'"><th>'+vo.id+'</th>'+
				'<th style="text-align: right; color: #999;">'+vo.regDate+'</th></tr>'+
				'<tr data-no="'+vo.no+'"><td colspan="2">'+vo.content+'</td></tr>';
	if(mode){
		if($("#authNo").val() == vo.userNo){
			$("#comment-table").append(auth);
		}else{
			$("#comment-table").append(htmls);
		}
	}else{
		$("#comment-table").prepend(auth);
	}
};

var insert = function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/comment/insert",
		type : "post",
		dataType : "json",
		data : {
			"content" : $("#cont").val(),
			"userNo" : "${authUser.no}",
			"postNo" : "${post.no}"
		},
		success : function(response){
			render(response.data, false);
			$("#cont").val("");
		},
		error : function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
};

var deleteCo = function(no){
	$.ajax({
		url : "${pageContext.request.contextPath}/comment/delete/"+no,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response){
			if(response.data){
				$("tr[data-no='"+no+"']").remove();
			}
		},
		error : function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
};

var update = function(no, content){
	$.ajax({
		url : "${pageContext.request.contextPath}/comment/update/"+no,
		type : "post",
		dataType : "json",
		data : {"content" : content},
		success : function(response){
			if(response.data){
				$(".td-update[data-no='"+no+"']").remove();
				$("tr[data-no='"+no+"'] td").text(content).show();
			}
		},
		error : function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
}

var getList = function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/comment/${post.no}",
		type : "get",
		dataType : "json",
		data : "",
		success : function(response){
			$(response.data).each(function(index, vo){
				render(vo, true);
			});
		},
		error : function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
};

$(function(){
	getList();
	$("#btn-comment").click(function(){
		$(".comment-content").show();
		$("#btn-close-comment").show();
		$("#btn-comment").hide();
	});
	$("#btn-close-comment").click(function(){
		$(".comment-content").hide();
		$("#btn-close-comment").hide();
		$("#btn-comment").show();
		$("#cont").val("");
	});
	
	$(".comment-form").submit(function(event){
		event.preventDefault();
		insert();
		$(".blog-content button span").text(($(".blog-content button span").text()*1)+1);
	});
	
	// live event (미래에 동적으로 생성될 엘리먼트의 이벤트)
	// 댓글 삭제 이벤트
	$(document).on("click", "#comment-table tr img.btn-delete", function(event){
		event.preventDefault();
		deleteCo($(this).data("no"));
		$(".blog-content button span").text(($(".blog-content button span").text()*1)-1);
	});
	
	// 댓글 수정 폼 가져오는 이벤트
	$(document).on("click", "#comment-table tr img.btn-update", function(event){
		event.preventDefault();
		var no = $(this).data("no");
		var str = $("tr[data-no='"+no+"'] td").text();
		$("tr[data-no='"+no+"'] td").hide();
		$(".td-con[data-no='"+no+"']").append("<td class='td-update' data-no='"+no+"' colspan='2'><textarea id=cont name='content'>"+str+"</textarea><input type='button' value='수정'></td>");
	});
	
	// 댓글 수정 이벤트
	$(document).on("click", ".td-update input", function(event){
		var no = $(this).parents("td").data("no");
		var content = $(this).prev().val();
		update(no, content);
	});
});
</script>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="wrapper">
			<div id="content">
				<c:choose>
					<c:when test="${post.no ne null}">
						<div class="blog-content">
							<h4>${post.title }</h4>
							<p>${post.content }
							<p>
								<!-- 댓글 -->
							<button id="btn-comment" style="float:right;" type="button">댓글 [<span>${post.totalComment }</span>]</button>
							<button id="btn-close-comment" style="float:right; display:none;" type="button">댓글 숨기기</button>
						</div>
						<div class="comment-content">
							<c:if test="${authUser ne null }">
								<form action="${pageContext.request.contextPath}/comment/insert" class="comment-form">
									<input id="authNo" name="userNo" value="${authUser.no }" type="hidden">
									<textarea id=cont name="content" placeholder="댓글을 입력해주세요."></textarea>
									<input type="submit" value="등록">
								</form>
							</c:if>
							<table id="comment-table">
							</table>
						</div>
						<div class="blog-content">
						<ul class="blog-list">
							<c:forEach items="${postList }" var="vo">
								<li><a href="${pageContext.request.contextPath}/${id}/${vo.categoryNo}/${vo.no}">
										${vo.title }</a> <span>${vo.regDate }</span></li>
							</c:forEach>
						</ul>
						</div>
					</c:when>
					<c:otherwise>
						<div class="blog-content">
							<h4>해당 카테고리의 글이 없습니다.</h4>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="extra">
			<div class="blog-logo">
				<img src="${pageContext.request.contextPath}${blog.logo}">
			</div>
		</div>

		<div id="navigation">
			<h2>카테고리</h2>
			<ul>
				<c:forEach items="${categoryList }" var="vo">
					<li><a
						href="${pageContext.request.contextPath}/${id}/${vo.no}">${vo.name }</a></li>
				</c:forEach>
			</ul>
		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>