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


<title>resellBoardModify</title>
</head>
<body>
<rb:navBar></rb:navBar>

<!-- .contatiner>.row>.col>h1{게시물 수정} -->
<div class="container main_container">
	<div class="row">
		<div class="col">
			<h1>게시물 수정</h1>
			<!-- form>.form-group*4>label[for=input$]+input.form-control#input$ -->
			<form id="modifyForm" method="post">
				<!-- input:hidden[value][name=id] -->
				<input type="hidden" name="id" value="${resellBoard.id }">
				<div class="form-group">
					<label for="titleInput">제목</label>
					<input type="text" class="form-control" id="titleInput" value="${resellBoard.title }"  name="title">
				</div>
				<div class="form-group">
					<label for="contentInput">내용</label>
					<textarea class="form-control" id="contentInput"  name="content">${resellBoard.content }</textarea>
				</div>
				  <div class="form-group">
				    <label for="exampleFormControlFile1"> images files </label>
				    <input type="file" class="form-control-file" id="imgInput" name="files" accept="image/*" multiple>
				  </div>
				<div class="form-group">
					<label for="priceInput">가격</label>
					<input type="text" class="form-control" id="priceInput"  value="${resellBoard.price }"  name="price">
				</div>				
				<div class="form-group">
					<label for="writerInput">작성자</label>
					<input type="text" class="form-control" id="writerInput"  value="${resellBoard.writer }" name="writer" readonly>
				</div>
				<button id="modifySubmitButton" class="btn btn-outline-primary" type="button" data-toggle="modal" data-target="#modifyModal">수정</button>
				<button id="removeSubmitButton" class="btn btn-outline-danger" type="button"  data-toggle="modal" data-target="#deleteModal">삭제</button>
			
			</form>
		</div>
	</div>
</div>

<!-- 수정Modal -->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabelmodify">수정확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>수정하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button id="modifyModalButton" type="button" class="btn btn-secondary" data-dismiss="modal">수정하기</button>
        <button id="notModifyModalButton" type="button" class="btn btn-primary"  data-toggle="modal">취소</button>
      </div>
    </div>
  </div>
</div>



<!-- 삭제Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabeldelete">삭제 확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>정말로 삭제 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button id="removeModalButton"type="button" class="btn btn-secondary" data-dismiss="modal">"삭제하기"</button>
        <button id="notRemoveModalButton" type="button" class="btn btn-primary"  data-toggle="modal" >삭제 취소</button>
      </div>
    </div>
  </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
	$("#removeModalButton").click(function(e) {
		e.preventDefault();  // 기본동작을 진행 안함
		$("#modifyForm").attr("action","ResellBoardRemove").submit();
	});
	
	$("#modifyModalButton").click(function(e){
		e.preventDefault();
		$("#modifyForm").attr("action","resellBoardModify").submit();
	});
	$("#notRemoveModalButton").click(function(e) {
		e.preventDefault();
		$("#deleteModal").modal("hide");
	})
	
	$("#notModifyModalButton").click(function(e) {
		e.preventDefault();
		$("#modifyModal").modal("hide");
	})
	  	
});
/* 	$(document).ready(function() {
		$("#removeSubmitButton").click(function(e) {
			e.preventDefault();  // 기본동작을 진행 안함
			$("#modifyForm").attr("action","ResellBoardRemove").submit();
		});
		
		$("#modifySubmitButton").click(function(e){
			e.preventDefault();
			$("#modifyForm").attr("action","resellBoardModify").submit();
		});
		
	}); */
</script>


</body>
</html>