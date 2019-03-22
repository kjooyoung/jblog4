<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="header">
	<a style="text-decoration: none;" href="${pageContext.servletContext.contextPath }/${id}"><h1>${blog.title }</h1></a>
	<ul>
		<c:choose>
			<c:when test="${authUser eq null }">
				<li><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
				<c:if test="${authUser.id eq id}">
					<li><a
						href="${pageContext.request.contextPath}/${authUser.id}/admin/basic">블로그
							관리</a></li>
				</c:if>
			</c:otherwise>
		</c:choose>
		<li><a href="${pageContext.request.contextPath}">메인화면</a></li>
	</ul>
</div>
