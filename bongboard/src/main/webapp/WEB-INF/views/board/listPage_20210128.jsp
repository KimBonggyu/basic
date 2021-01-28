<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.selectPage {
	font-size:large;
	font-weight:bold;
}
</style>
</head>
<body>

<div id="root">
	<header>
		<%@ include file="include/header.jsp" %>
	</header>

	<%@ include file="include/nav.jsp" %>

	<section id="container">
		<h2>글 목록</h2>
		
		<table>
			<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
			
			<!-- #글 목록 start -->
			<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.bno}</td>
				<td>
				<a href="/board/read?bno=${list.bno}">${list.title}</a>
				</td>
				<td>${list.writer}</td>
				<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			</c:forEach>
			<!-- #글 목록 end -->
		</table>
	</section>
	
<div>
	
	<c:if test="${pageMaker.prev}">
		<span>[ <a href="/board/listPage?page=${pageMaker.startPage - 1}">이전</a>]</span>
	</c:if>
	
	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
		<span
			<c:out value="${pageMaker.cri.page == num? 'class=selectPage' : ''}"/>>
			<a href="listPage?page=${num}">${num}</a>
		</span>
	</c:forEach>
	
	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<span>[ <a href="/board/listPage?page=${pageMaker.endPage + 1}">다음</a> ]</span>
	</c:if>

</div>

<footer>
	<%@ include file="include/footer.jsp" %>
</footer>

</div>

</body>
</html>