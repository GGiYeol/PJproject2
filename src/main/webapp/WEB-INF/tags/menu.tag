<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="menu_container transfrom">
        	<c:set value="${pageContext.request.contextPath }" var="ContextPath"></c:set>
            <div class="menu_header">
                <div class="menu_title">
                    <i class="fas fa-times"></i>
                    <span>Menu</span>
                </div>
            </div>
            <div class="menu_list_container">
                <div class="menu_list_box">
                    <div class="menu_food">
                        <a href="${ContextPath }/food/foodList">Food</a>
                    </div>
                </div>
                <div class="menu_list_box">
                    <div class="menu_resell">
                        <a href="${ContextPath }/resellMarket/resellBoard/resellBoardList">Resell</a>
                    </div>
                </div>
                <div class="menu_list_box">
                    <div class="menu_community">
                        <a href="#" class="communityBtn">Commnunity</a>
                        <div class="menu_coummunity_inner_el display_none">
                            <a href="${ContextPath }/community/communityBoard/community_FreeBoard">-FreeBoard</a>
                            <a href="#">-QnaBoard</a>
                        </div>
                    </div>
                </div>
                <c:if test="${loggedUser != null }">
                	<div class="menu_list_box">
                    	<div class="menu_user">
                        <a href="${ContextPath }/user/userDetail">UserDetail</a>
                   		</div>
	                </div>
	                <div class="menu_list_box">
	                    <div class="menu_user">
	                        <a href="${ContextPath }/user/logout">LogOut</a>
	                    </div>
	                </div>
                </c:if>
                <c:if test="${loggedUser == null }">
	                <div class="menu_list_box">
	                    <div class="menu_user">
	                        <a href="${ContextPath }/user/login">Login</a>
	                    </div>
	                </div>
	                <div class="menu_list_box">
	                    <div class="menu_user">
	                        <a href="${ContextPath }/user/join">Join</a>
	                    </div>
	                </div>
                </c:if>
            </div>
        </div>