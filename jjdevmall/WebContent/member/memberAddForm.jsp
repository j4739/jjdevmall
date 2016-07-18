<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
span {
	font-size: xx-small;
	color: red;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#addbtn").click(function() {
			//값받으면 span값 초기화
			if ($("#memberId").val() != "") {
				$("#Idhelper").text("");
			}
			if ($("#memberPw").val() != "") {
				$("#Pwhelper").text("");
			}
			if ($("#memberName").val() != "") {
				$("#Namehelper").text("");
			}
			if ($(".memberSex:checked").length != 0) {
				$("#Sexhelper").text("");
			}
			if ($("#memberAge").val() != 0) {
				$("#Agehelper").text("");
			}
			
			//회원가입폼 유효성 검사
			if ($("#memberId").val() == "") {
				$("#Idhelper").text("아이디를 입력하세요.");
				$("#memberId").focus();
			} else if ($("#memberPw").val() == "") {
				$("#Pwhelper").text("비밀번호를 입력하세요.");
				$("#memberPw").focus();
			} else if ($("#memberName").val() == "") {
				$("#Namehelper").text("이름를 입력하세요.");
				$("#memberName").focus();
			} else if ($(".memberSex:checked").length == 0) {
				$("#Sexhelper").text("성별를 체크하세요.");
			} else if ($("#memberAge").val() == 0 || isNaN($("#memberAge").val())) {
				$("#Agehelper").text("나이를 입력하세요.");
				$("#memberAge").focus();
			} else {
				alert("회원가입이 완료되었습니다.");
				$("#addform").submit();
			}
		});
	});
</script>
</head>
<body>
	<form id="addform" action="<%=request.getContextPath()%>/member/memberAddAction.jsp" method="post">
		<fieldset>
			<legend>
				<h2>회원가입</h2>
			</legend>
			<div>
				아이디:<input type="text" id="memberId" name="memberId"> <span
					id="Idhelper"></span>
			</div>
			<div>
				비밀번호:<input type="text" id="memberPw" name="memberPw"> <span
					id="Pwhelper"></span>
			</div>
			<div>
				이름:<input type="text" id="memberName" name="memberName"> <span
					id="Namehelper"></span>
			</div>
			<div>
				성별:<input type="radio" class="memberSex" name="memberSex" value="남">남
				<input type="radio" class="memberSex" name="memberSex" value="여">여
				<span id="Sexhelper"></span>
			</div>
			<div>
				나이:<input type="text" id="memberAge" name="memberAge"> <span
					id="Agehelper"></span>
			</div>
			<div>
				<input type="button" id="addbtn" value="회원가입">
			</div>
		</fieldset>
	</form>
</body>
</html>