<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url value = "/community/communityBoard/community_FreeBoard" var = "community_FreeBoardUrl"></c:url>
<c:url value = "/community/communityBoard/community_Register" var = "community_RegisterUrl"></c:url>
<c:url value = "/community/communityMember/community_signup" var = "community_signupUrl"></c:url>
<c:url value = "/community/communityMember/community_login" var = "community_loginUrl"></c:url>
<c:url value = "/community/communityMember/logout" var = "logoutUrl"></c:url>
<c:url value = "/community/communityMember/community_Info" var = "community_InfoUrl"></c:url>
<c:url value = "/community/communityMember/community_List" var = "community_ListUrl"></c:url>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
	
<ul class="navbar-nav mr-auto">
    <li class="nav-item active">
      <a class="nav-link" href="${community_FreeBoardUrl }">목록</a>
    </li>
    
     <li class="nav-item active">
        <a class="nav-link" href="${community_RegisterUrl }">글쓰기</a>
      </li>
      <c:if test="${empty sessionScope.loggedInMember }">
      <li class="nav-item active">
      	<a class="nav-link" href="${community_signupUrl }">회원가입</a>
      </li>
       <li class="nav-item active">
      	<a class="nav-link" href="${community_loginUrl }">로그인</a>
      </li>
      </c:if>
      <c:if test="${not empty sessionScope.loggedInMember }">
       <li class="nav-item active">
      	<a class="nav-link" href="${community_InfoUrl }">회원정보 보기</a>
      </li>
      <li class="nav-item active">
      	<a class="nav-link" href="${community_ListUrl }">회원정보 보기</a>
      </li>
       <li class="nav-item active">
      	<a class="nav-link" href="${logoutUrl }">로그아웃</a>
      </li>
      </c:if>
	</ul>
</nav>