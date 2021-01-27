<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<footer>
	<%@ include file="include/footer.jsp" %>
</footer>

</div>

</body>
</html>