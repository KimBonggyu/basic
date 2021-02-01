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
			<input type="hidden" name="searchType" value="${cri.searchType}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
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
				<button type="button" id="modify_btn">수정</button>
				<button type="button" id="delete_btn">삭제</button>
				<button type="button" id="golist_btn">목록으로</button>
			</p>
	
	</section>
	
	
	
	<section class="replysection">
	
	<form role="form" method="post">
	
		<input type="hidden" name="bno" value="${read.bno}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		<input type="hidden" name="searchType" value="${cri.searchType}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		
		<p>
			<label for="writer">작성자</label><input type="text" id="replyWriter" name="replyWriter">
		</p>
		<p>
			<label for="content">댓글 내용</label><textarea id="replyContent" name="replyContent"></textarea>
		</p>
		
			<button type="button" id="replyWrite_btn">댓글작성</button>
	
	</form>
	
	
	<ul>
		<c:forEach items="${replyList}" var="replyList">
		<li>
			<div>
				<p><fmt:formatDate value="${replyList.replyRegDate}" pattern="yyyy-MM-dd"/></p>
				<p>${replyList.replyWriter}</p>
				<p>${replyList.replyContent}</p>
			</div>
			<hr/>
		</li>
		</c:forEach>
	</ul>
	
	</section>
	
	
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

<script>
	$(document).ready(function(e) {
			
		
		var formObj = $(".replysection form[role='form']");

		$("#replyWrite_btn").on("click", function() {
			
			formObj.attr("action", "replyWrite");
			formObj.submit();
			
		});
		
	});
</script>

	<footer>
		<%@ include file="include/footer.jsp" %>
	</footer>


</div>

</body>
</html>