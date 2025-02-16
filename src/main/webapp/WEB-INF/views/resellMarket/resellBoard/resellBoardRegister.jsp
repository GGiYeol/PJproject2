<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" tagdir="/WEB-INF/tags/resellBoard" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>resellBoardRegister</title>
</head>
<body>
<rb:navBar></rb:navBar>

<!-- .contatiner>.row>.col>h1{게시물 작성} -->
<div class="container main_container">
	<div class="row">
		<div class="col">
			<h1>게시물 작성</h1>
			<!-- form>.form-group*4>label[for=input$]+input.form-control#input$ -->
			<form action="" method="post">
				<div class="form-group">
					<label for="titleInput">제목</label>
					<input type="text" class="form-control" id="titleInput" name="title">
				</div>
				<div class="form-group">
					<label for="contentInput">내용</label>
					<textarea class="form-control" id="contentInput" name="content"></textarea>
				</div>
				  <div class="form-group">
				    <label for="exampleFormControlFile1"> images files </label>
				    <input type="file" class="form-control-file" id="imgInput" name="files" accept="image/*" multiple>
				  </div>
				<div class="form-group">
					<label for="writerInput">작성자</label>
					<input type="text" class="form-control" id="writerInput" name="writer"  readonly value="${sessionScope.loggedInMember.nickName }">
				</div>
 				<div class="form-group">
					<label for="priceInput">가격</label>
					<input type="text" class="form-control" id="priceInput" name="price">
				</div>	 			
				<button class="btn btn-outline-primary" type="submit">등록</button>
			</form>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>