<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<!-- <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" /> -->

<!-- <script type="text/javascript"> -->
<!-- // import Tagify from '@yaireo/tagify' -->

<!-- // var tagify = new Tagify(...) -->
<!-- </script> -->

<!-- <script> -->

<!-- </script> -->

<!-- <style type="text/css"> -->

<!-- /* .tagify__tag + .tagify__input::before{ opacity:0; } */ -->


<!-- /* .tagify:not(.tagify--noTags){ */ -->
<!-- /*   --placeholder-color: transparent; */ -->
<!-- /*   --placeholder-color-focus: transparent; */ -->

<!-- </style> -->

<!-- <h1>Tagify 데모</h1> -->
<!-- <input placeholder="type tags"> -->

<!-- <script> -->
<!-- // var input = document.querySelector('input') -->
<!-- // var tagify = new Tagify(input); -->
  
<!-- // // 태그가 추가되면 이벤트 발생 -->
<!-- // tagify.on('add', function() { -->
<!-- //   console.log(tagify.value); // 입력된 태그 정보 객체 -->
<!-- // }) -->


<!-- </script> -->

<div class="container">

<h1>글쓰기</h1>
<hr>

<form action="/gallery/write" method="post" enctype="multipart/form-data">
<label for="galleryTitle">제목</label>
<input type="text" id="galleryTitle" name="galleryTitle" class="form-control">

<label for="galleryContent">본문</label>
<textarea rows="10" style="width: 100%;" id="galleryContent" name="galleryContent"></textarea>

<label for="file">첨부파일</label>
<input type="file" id="file" name="file">

<button class="btn btn-primary" id="btnWrite">작성</button>
</form>

</div><!-- .container end -->


<c:import url="../layout/footer.jsp" />