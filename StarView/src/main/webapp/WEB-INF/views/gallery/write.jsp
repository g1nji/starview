<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script src="https://unpkg.com/@yaireo/tagify"></script>
<!--<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>-->
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	var input = document.querySelector('.tag')
	var tagify = new Tagify(input);

	// 태그가 추가되면 이벤트 발생
	tagify.on('add', function() {
	  console.log(tagify.value); // 입력된 태그 정보 객체
	})
	
  var quill = new Quill('#editor', {
	    theme: 'snow'
	  })
})
</script>

<style type="text/css">
.wrap {
	width: 1350px;
	margin: 0 auto;
	padding: 20px 0;
}

#galleryTitle {
	border: none;
	font-size: 22px;
}

#galleryContent {
	border: none;
}
</style>

<div class="wrap">

<form action="/gallery/write" method="post" enctype="multipart/form-data">

<input type="text" style="width: 100%;" id="galleryTitle" name="galleryTitle" class="gallerytitle" placeholder="제목을 입력하세요">
<hr>

<div id="editor" style="height:400px;">
</div>

<input type="file" id="file" name="file"><br>

<span>지도 추가</span><br>

<input placeholder="type tags" class="tag"><br>

<button class="btn btn-primary" id="btnWrite">작성</button>
</form>

</div>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />