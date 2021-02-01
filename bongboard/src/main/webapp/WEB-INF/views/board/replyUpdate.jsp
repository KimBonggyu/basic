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
	
	<form role="form" method="post">
		
		<input type="hidden" name="bno" value="${readReply.bno}">
		<input type="hidden" name="rno" value="${readReply.rno}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		<input type="hidden" name="searchType" value="${cri.searchType}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		
		<!-- 
		<p>
			<label for="replyWriter">작성자 : ${readReply.replyWriter}</label>
			<input type="text" id="replyWriter" name="replyWriter" readonly="readonly"/>
		</p>
		 -->
		<p>
			<label for="replyContent">내용</label>
			<textarea id="replyContent" name="replyContent"${readReply.replyContent}></textarea>
		</p>
		<p>
			<button type="button" id="replymodifysave_btn">수정완료</button>
			<button type="button" id="cancel_btn">취소</button>
			
			<script>
			var formObj = $("form[role='form']");

			$("#cancel_btn").on("click", function() {
				self.location = "/board/read?bno=${readReply.bno}"
					+"&page=${cri.page}"
				    +"&perPageNum=${cri.perPageNum}"
				    +"&searchType=${cri.searchType}"
				    +"&keyword=${cri.keyword}";
			});

			$("#replymodifysave_btn").on("click", function() {
				formObj.attr("action","/board/replyUpdate");
				formObj.attr("method","post");
				formObj.submit();
			});
			</script>
		</p>
		
	</form>
	
	</section>

	<footer>
		<%@ include file="include/footer.jsp" %>
	</footer>


</div>

</body>
</html>