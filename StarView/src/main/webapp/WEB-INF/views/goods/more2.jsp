<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${lowPriceMore }" var="res">

	<ul class="items">
		<li><a href="/goods/detail.jsp?gId=${res.gId }"><img class="thumb" src="${res.fileName }"></li>
		<li class="title">${res.gName }</a></li>
		<li class="price"><fmt:formatNumber value="${res.gPrice }" type="number" groupingUsed="true" />원</li>
	</ul>

</c:forEach>