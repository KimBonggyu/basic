<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript">

$(document).ready(function() {

	var formObj = $("form[role='form']");

	$("#cancel_btn").on("click", function(){

		var check = confirm("돌아가시겠습니까?");

		if(check){
			formObj.attr("action", "/board/read?bno=" + $("#bno").val());
			formObj.attr("method", "get")
			formObj.submit();
		}
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
	
		<form role="form" method="post" autocomplete="off">
		
			<input type="hidden" name="page" value="${cri.page}">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		
			<p>
				<label for="bno">글 번호</label><input type="text" id="bno" name="bno" value="${modify.bno}" readonly="readonly" />
			</p>
		
			<p>
				<label for="title">글 제목</label><input type="text" id="title" name="title" value="${modify.title}" />
			</p>
			<p>
				<label for="content">글 내용</label><textarea id="content" name="content" >${modify.content}</textarea>
			</p>
			<p>
				<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${modify.writer}" readonly="readonly"/><br/>
				<label>작성일</label> <span><fmt:formatDate value="${modify.regDate}" pattern="yyyy-MM-dd"/></span>
			</p>
			<p>
				<button type="submit">수정완료</button>
				<button id="cancel_btn">삭제</button>
			</p>
	
		</form>
			
	</section>

	<footer>
		<%@ include file="include/footer.jsp" %>
	</footer>


</div>

</body>
</html>