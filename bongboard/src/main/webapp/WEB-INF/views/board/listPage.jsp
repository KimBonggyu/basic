<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="include/includelink.jsp" %>
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
<script>
$(document).ready(function() {

	$("#search_btn").on("click", function() {

		self.location="listPage"
			+"${pageMaker.makeSearchQuery(1)}"
			+"&searchType="
			+$("select option:selected").val()
			+"&keyword=" + $("#keywordInput").val();
		});
});

</script>

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
				<a href="/board/read${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${list.bno}">${list.title}</a>
				</td>
				<td>${list.writer}</td>
				<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			</c:forEach>
			<!-- #글 목록 end -->
		</table>
	</section>

<div>

	<select name="searchType">
		<option value="n"
		<c:out value="${cri.searchType == null? 'selected':''}"/>>
		-----</option>
		<option value="t"
		<c:out value="${cri.searchType eq 't'? 'selected':''}"/>>
		제목</option>
		<option value="c"
		<c:out value="${cri.searchType eq 'c'? 'selected':''}"/>>
		내용</option>
		<option value="w"
		<c:out value="${cri.searchType eq 'w'? 'selected':''}"/>>
		작성자</option>
		<option value="tc"
		<c:out value="${cri.searchType eq 'tc'? 'selected':''}"/>>
		제목+내용</option>
		<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
		<button id="search_btn">검색</button>
	</select>

</div>
	
	
<div>
	
	<c:if test="${pageMaker.prev}">
		<span>[ <a href="/board/listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>]</span>
	</c:if>
	
	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
		<span
			<c:out value="${pageMaker.cri.page == num? 'class=selectPage' : ''}"/>>
			<a href="listPage${pageMaker.makeQuery(num)}">${num}</a>
		</span>
	</c:forEach>
	
	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<span>[ <a href="/board/listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a> ]</span>
	</c:if>

</div>

<footer>
	<%@ include file="include/footer.jsp" %>
</footer>

</div>

</body>
</html>