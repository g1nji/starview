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
	
	function quilljsediterInit(){
	    var option = {
	        modules: {
            toolbar: [
            	  [{ 'header': [1, 2, 3, false] }],
            	  ['bold', 'italic', 'underline', 'strike'],        // toggled buttons

            	  [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme

            	  [{ 'align': [] }],
            	  
            	  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
            	  [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent

            	  ['blockquote']

            	 ]
	        },
	        placeholder: '자세한 내용을 입력해 주세요!',
	        theme: 'snow'
	    };

	    var quill = new Quill('#editor', option);
	    quill.on('text-change', function() {
	        document.getElementById("quill_html").value = quill.root.innerHTML;
	});
	    
	}

	quilljsediterInit();
	
	$("#btnUpdate").click(function() {
		
		//에디터에 작성된 내용을 #galleryContent에 반영
		var delta = quill.getContents();

		$("form").submit();
	})
	
	var input = document.querySelector('input[name=gTag]')
	new Tagify(input)
	
	if( ${empty boardFile} ) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	$("#deleteFile").click(function() {
		$("#newFile").toggle()
		
// 		$("#originFile").toggle()
		$("#originFile").toggleClass("through")
	})
	
})
</script>

<style type="text/css">
.wrap {
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

<form action="/gallery/update" method="post" enctype="multipart/form-data">

<input type="text" style="width: 100%;" id="galleryTitle" name="galleryTitle" class="gallerytitle" value="${updateGallery.galleryTitle }">
<hr>

<div id="fileBox">

	<div id="originFile">
		<a href="/imagepath/${galleryFile.storedName }">${galleryFile.originName }</a>
		<span id="deleteFile">X</span>
	</div>

	<div id="newFile">
		<label for="file">새로운 첨부파일</label>
		<input type="file" id="file" name="file">
	</div>
	
</div>
	
<div id="editor" style="height:400px;">
${updateGallery.galleryContent }
<input type="hidden" id="quill_html" name="galleryContent">
</div>

<br>
<br>
<span>지도 추가</span>
<br>
<br>

<input placeholder="type tags" class="tag" type="hidden" name="gTag"><br>

<button class="btn btn-primary" id="btnUpdate">수정</button>
<input type="reset" id="cancel" class="btn btn-danger" value="취소">
</form>

</div>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />