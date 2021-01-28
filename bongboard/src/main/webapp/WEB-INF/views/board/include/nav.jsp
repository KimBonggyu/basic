<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function() {
	$("#write_btn").on("click", function(){
		self.location = "/board/write";
		});
});
</script>

</head>
<body>
	<button id="write_btn">글 작성
	<button id="login_btn">로그인</button>
</body>
</html>