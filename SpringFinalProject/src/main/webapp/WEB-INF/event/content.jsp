<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>

<style type="text/css">
* {
	font-family: 'Gowun Dodum', sans-serif;
}

div.likes {
	cursor: pointer;
}
</style>

</head>

<body>

	<table class="table table-lg"
		style="margin-left: 340px; margin-top: 50px; width: 1200px;">
		<tr>

			<td style="font-size: 1.8em;">&nbsp;&nbsp;&nbsp;&nbsp;${dto.subject }</td>
			<td>
				<div class="likes" style="margin-left: 400px; margin-right: -80px;">
					<i class="bi bi-heart"></i>&nbsp;&nbsp;좋아요&nbsp;&nbsp;<b>${dto.likes }</b>
				</div>
			</td>

			<td style="font-size: 1.1em;"><i class="bi bi-eye"></i>&nbsp;&nbsp;조회수&nbsp;&nbsp;<b>${dto.readcount }</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate
					value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm" /></td>

		</tr>

		<tr>
			<td colspan="6"><br>
			<br>
			<br> ${dto.content } <br>
			<br>
			<br></td>
		</tr>
		<tr>
			<td colspan="6" align="center"><c:if test="${myid=='admin' }">
					<button class="btn btn-light"
						onclick="location.href='updateform?num=${dto.num }&currentPage=${currentPage}'">수정</button>
					<button class="btn btn-light"
						onclick="location.href='delete?num=${dto.num }&currentPage=${currentPage}'">삭제</button>
				</c:if>
				<button class="btn btn-dark" onclick="location.href='list'">목록</button>
			</td>
		</tr>
	</table>

	<script type="text/javascript">
		$("div.likes").click(
				function() {
					var heart = $(this).find("i").attr("class");

					if (heart == 'bi bi-heart') {
						$(this).find("i").attr("class", "bi bi-heart").css(
								"color", "red");
					} else {
						$(this).find("i").attr("class", "bi bi-heart").css(
								"color", "black");
					}
					var num = ${dto.num};
					console.log(num);

					$.ajax({

						type : "get",
						url : "likes",
						dataType : "json",
						data : {"num" : num},
						success : function(res) {
							$("div.likes").find("b").text(res.likes);
						}
					});
				});
	</script>
</body>
</html>