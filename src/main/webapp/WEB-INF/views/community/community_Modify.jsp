<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "b" tagdir="/WEB-INF/tags/comFreeBoard" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>Insert title here</title>
</head>
<body>
<a href="#"><i class="fas fa-home"></i></a>

<b:navBar></b:navBar>
<div class="main_container">
	<div class="row">
		<div class="col">
			<h1>글수정하기</h1>
			<!-- 현재 경로로 줄 것이 action필요 없ㅇ므 -->
			<form id="modifyForm" method="post">
			
			<!-- input:hidden[value][name=id] -->
			<input type="hidden" name="id" value="${comFreeBoard.id }">
				<div class="form-group">
					<label for="input1">제목</label>
					<input type="text" class="form-control" value="${comFreeBoard.title }" id="input1" name="title">
				</div>
				<div class="form-group">
					<label for="input2">내용</label>
					<textarea class="form-control" id="input2"name="content">${comFreeBoard.content }</textarea>
				</div>
				<div class="form-group">
					<label for="input3">작성자</label>
					<input type="text" class="form-control" id="input3"name="writer" value="${comFreeBoard.writer }"readonly>
				</div>
				
				<button id="modifySubmitButton" class="btn btn-outline-primary"type="submit">등록</button>
				<button id="removeSubmitButton" class="btn btn-outline-danger"type="submit">삭제하기</button>
			</form>
			
		</div>
	</div>
</div>	


<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
	$("#removeSubmitButton").click(function(e){
		e.preventDefault();//더 이상 진행되지 않도록
		
		$("#modifyForm").attr("action", "remove").submit();
	});
	
	$("modifySubmitbutton").click(function(e){
		e.preventDefault();
		$("#modifyForm").attr("action", "modify").submit();
	});
});
</script>
</body>
</html>