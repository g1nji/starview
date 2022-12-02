<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
p {
	margin: 0 auto;
}

</style>

<c:if test="${count>0}">
<p>중복된 아이디가 있습니다<p>

</c:if>

<c:if test="${count eq 0 }">
<p>사용가능한 아이디입니다.<p>

</c:if>
