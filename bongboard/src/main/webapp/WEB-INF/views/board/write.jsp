<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="include/includelink.jsp" %>
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
	
		<form role="form" method="post" autocomplete="off">
		
			<input type="hidden" name="page" value="${cri.page}">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
			<input type="hidden" name="searchType" value="${cri.searchType}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
			
			<p>
				<label for="title">글 제목</label><input type="text" id="title" name="title" />
			</p>
			<p>
				<label for="content">글 내용</label><textarea id="content" name="content"></textarea>
			</p>
			<p>
				<label for="writer">작성자</label><input type="text" id="writer" name="writer" />
			</p>
			<p>
				<button type="submit">작성</button>
			</p>
		</form>
	
	</section>
	
	<footer>
	
		<%@ include file="include/footer.jsp" %>
		
	</footer>


</div>

</body>
</html>