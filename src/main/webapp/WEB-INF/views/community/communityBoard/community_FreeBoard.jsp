<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix ="b" tagdir="/WEB-INF/tags/comFreeBoard" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<c:set value="${pageContext.request.contextPath }" var="ContextPath"></c:set>

<%-- div class="body_wrapper"
   <tag:nav></tag:nav>
   div class="main_container"
  <tag:footer></tag:footer>
  <tag:menu></tag:menu> --%>



<!-- 여기에 리다이렉트 하는 코드도 심어놔야함. -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/icon/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/styles.css" />

<title>자유게시판</title>

<style>
	.mainboard{
		font: italic 1.5em/1em Georgia, serif ;
	}
</style>
</head>
<body>
<div class="body_wrapper">

<a href="#">여기에 홈으로 들어가는 링크 들어갈것</a><td>
<a href="#"><i class="fas fa-home"></i></a><td>
  <tag:nav></tag:nav>

  <div class="main_container">
<b:navBar></b:navBar>
  	<div class="row">
  	
  		<div class="col">
  			<h1>자유게시판</h1>
  			<table class="table">
  				<thead>
  					<tr>
  						<th>글번호</th>
  						<th>제목</th>
  						<th>작성자</th>
  						<th>작성일</th>
  					</tr>
  				</thead>
  				<tbody class = "mainboard">
  					<c:forEach items="${list }" var="comFreeBoard">
  					<tr>
  						<td>${comFreeBoard.id }</td>
  						<td>
  						<a href="community_free_get?id=${comFreeBoard.id }">
  						${comFreeBoard.title }
  						</a>
  						
  						</td>
  						<td>${comFreeBoard.nickName }</td>
  						<td>${comFreeBoard.customInserted }</td>
  					</tr>
  					</c:forEach>
  				</tbody>
  			</table>
  		</div>
  	</div>
  <div class="form-inline">
  
  <div class = "search_wrap">
  <div class = "search_area">
  <input class="form-control" type="text" id="keyword" name="keyword" value="${pageInfo.keyword}" placeholder="검색어를 입력하세요"/>
			<button id="searchBtn" class="btn btn-primary">Search</button>
  </div>
  </div>
  </div>
  </div>
  </div>
  
  <!--  pagination -->
  <nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
      <c:if test="${pageInfo.hasPrevButton }">
        <c:url value="/community/communityBoard/community_FreeBoard" var="pageLink">
          <c:param name="page" value="${pageInfo.leftPageNumber - 1 }"></c:param>
        </c:url>
        <li class="page-item">
          <a class="page-link" href="${pageLink }" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
      </c:if>

      <c:forEach begin="${pageInfo.leftPageNumber}" end="${pageInfo.rightPageNumber }" var="pageNumber">
        <c:url value="/community/communityBoard/community_FreeBoard" var="pageLink">
          <c:param name="page" value="${pageNumber }"></c:param>
        </c:url>
        <li class="page-item ${pageInfo.currentPage == pageNumber ? 'active' : '' }">
          <a class="page-link" href="${pageLink }">${pageNumber }</a>
        </li>
      </c:forEach>

      <c:if test="${pageInfo.hasNextButton }">
        <c:url value="/community/communityBoard/community_FreeBoard" var="pageLink">
          <c:param name="page" value="${pageInfo.rightPageNumber + 1 }"></c:param>
        </c:url>
        <li class="page-item">
          <a class="page-link" href="${pageLink }" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </c:if>
    </ul>
  </nav>

<!--  modal -->
  <c:if test="${not empty result }">
    <div class="modal" tabindex="-1" id="modal1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">처리 결과</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <p>${result }</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
  </c:if>
  <form id="moveForm" method = "get">
  <input type="hidden" name="keyword" value="${pageInfo.keyword}">
  </form>


<tag:footer></tag:footer>
<tag:menu></tag:menu>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
  <script>
  
  $(document).ready(function(){
	  $("#modal1").modal('show');
  });
  
  //
  $(".search_area button").on("click", function(e){
        e.preventDefault();
        let val = $("input[name='keyword']").val();
        moveForm.submit();
    });
  
  </script>
  
  <script src="${pageContext.request.contextPath }/resource/js/main.js" type="module"></script>
</body>
</html>
















