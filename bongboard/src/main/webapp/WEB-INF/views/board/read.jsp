<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

$(document).ready(function() {

	var formObj = $("form[role='form']");

	$("#modify_btn").on("click", function() {

		formObj.attr("action", "/board/modify");
		formObj.attr("method", "get");
		formObj.submit();
	
	});

	$("#delete_btn").on("click", function(){

		var check = confirm("삭제하시겠습니까?");

		if(check){
			formObj.attr("action", "/board/delete");
			formObj.attr("method", "post")
			formObj.submit();
		}
	});

	$("#golist_btn").on("click", function() {
		formObj.attr("method", "get");
		formObj.attr("action", "/board/listPage");
		formObj.submit();
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
	
		<form role="form" action="modify" method="post">
			<input type="hidden" name="bno" value="${read.bno}">
			<input type="hidden" name="page" value="${cri.page}">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		</form>
	
			<p>
				<label for="bno">글 번호</label><input type="text" id="bno" name="bno" value="${read.bno}" readonly="readonly"/>
			</p>	
			<p>
				<label for="title">글 제목</label><input type="text" id="title" name="title" value="${read.title}" readonly="readonly"/>
			</p>
			<p>
				<label for="content">글 내용</label><textarea id="content" name="content" readonly="readonly">${read.content}</textarea>
			</p>
			<p>
				<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}" readonly="readonly"/><br/>
				<label>작성일</label> <span><fmt:formatDate value="${read.regDate}" pattern="yyyy-MM-dd"/></span>
			</p>
			<p>
				<button id="modify_btn">수정</button>
				<button id="delete_btn">삭제</button>
				<button id="golist_btn">목록으로</button>
			</p>
	
	</section>

	<footer>
		<%@ include file="include/footer.jsp" %>
	</footer>


</div>

</body>
</html>