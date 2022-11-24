<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 

<c:set var="root" value="${root }" />
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="${root }/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="${root }/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	
	<style type="text/css">
	*{
	font-family: 'Gowun Dodum', sans-serif;
	
	}
	
	
	</style>
	<script type="text/javascript">
	//이미지 미리보기, 사용자함수
	function readURL(input){
		
		if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        $('#blah').attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	</script>
</head>
<body>

<!-- 이미지 미리보기 -->


<form action="update" method="post" enctype="multipart/form-data">
	<table class="table table-bordered" style="width: 800px;margin-left: 550px;margin-top:150px;">
		<input type="hidden" name="num" value="${dto.num }">
		<input type="hidden" name="currentPage" value="${currentPage }">
		<tr>
			<th width="100">제목</th>
			<td>
				<input type="text" name="subject" class="form-control"
					value="${dto.subject }" style="width: 130px;">
			</td>
		
			<th width="100">메인 이미지</th>
			<td>
				<input type="file" name="upload" class="form-control">
			</td>
		</tr>
				
		
		<tr>
			<td colspan="4">
				<textarea name="content" id="content" style="width: 100%;height: 300px;display: none;">${dto.content }</textarea>		
			
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="button" class="btn btn-dark"
					style="width: 120px;"
					onclick="submitContents(this)">상품 수정</button>
				
				<button type="button" class="btn btn-dark"
					style="width: 120px;"
					onclick="location.href='list'">목록</button>
			</td>
		</tr>
		
	</table>   
</form>

<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "${root }/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="${root }/save/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}
</script>

</body>
</html>
