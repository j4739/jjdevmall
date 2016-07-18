<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
span {
	font-size: xx-small;
	color: red;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#addbtn").click(function() {
			//값받으면 span값 초기화
			if ($("#itemname").length != 0) {
				$("#namehelper").text("");
			}
			if ($("#itemprice").val() != 0) {
				$("#pricehelper").text("");
			}
			if ($("#itemrate").val() != "") {
				$("#ratehelper").text("");
			}

			//상품등록폼 유효성 검사
			if ($("#itemname").val() == "") {
				$("#namehelper").text("상품 이름을 입력하세요.");
				$("#itemname").focus();
			} else if ($("#itemprice").val() == "" || isNaN($("#itemprice").val())) {
				$("#pricehelper").text("상품 가격을 입력하세요.");
				$("#itemprice").focus();
			} else if ($("#itemrate").val() == "" || isNaN($("#itemprice").val()) < -1) {
				$("#ratehelper").text("상품 할인율을 입력하세요.");
				$("#itemrate").focus();
			} else {
				alert("상품이 등록되었습니다.");
				$("#addform").submit();
			}
		});
	});
</script>
</head>
<body>
	<form id="addform" action="<%=request.getContextPath()%>/admin/item/itemAddAction.jsp" method="post">
		<fieldset>
			<legend>
				<h2>상품 등록</h2>
			</legend>
			<div>
				상품 이름:<input type="text" id="itemname" name="itemname"> 
				<span id="namehelper"></span>
			</div>
			<div>
				상품 가격:<input type="text" id="itemprice" name="itemprice">원
				<span id="pricehelper"></span>
			</div>
			<div>
				할인율:<input type="text" id="itemrate" name="itemrate">%
				<span id="ratehelper"></span>
			</div>
			<div>
				<input type="button" id="addbtn" value="상품등록">
			</div>
		</fieldset>
	</form>
</body>
</html>