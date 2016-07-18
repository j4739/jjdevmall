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
			//�������� span�� �ʱ�ȭ
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
			
			//ȸ�������� ��ȿ�� �˻�
			if ($("#memberId").val() == "") {
				$("#Idhelper").text("���̵� �Է��ϼ���.");
				$("#memberId").focus();
			} else if ($("#memberPw").val() == "") {
				$("#Pwhelper").text("��й�ȣ�� �Է��ϼ���.");
				$("#memberPw").focus();
			} else if ($("#memberName").val() == "") {
				$("#Namehelper").text("�̸��� �Է��ϼ���.");
				$("#memberName").focus();
			} else if ($(".memberSex:checked").length == 0) {
				$("#Sexhelper").text("������ üũ�ϼ���.");
			} else if ($("#memberAge").val() == 0 || isNaN($("#memberAge").val())) {
				$("#Agehelper").text("���̸� �Է��ϼ���.");
				$("#memberAge").focus();
			} else {
				alert("ȸ�������� �Ϸ�Ǿ����ϴ�.");
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
				<h2>ȸ������</h2>
			</legend>
			<div>
				���̵�:<input type="text" id="memberId" name="memberId"> <span
					id="Idhelper"></span>
			</div>
			<div>
				��й�ȣ:<input type="text" id="memberPw" name="memberPw"> <span
					id="Pwhelper"></span>
			</div>
			<div>
				�̸�:<input type="text" id="memberName" name="memberName"> <span
					id="Namehelper"></span>
			</div>
			<div>
				����:<input type="radio" class="memberSex" name="memberSex" value="��">��
				<input type="radio" class="memberSex" name="memberSex" value="��">��
				<span id="Sexhelper"></span>
			</div>
			<div>
				����:<input type="text" id="memberAge" name="memberAge"> <span
					id="Agehelper"></span>
			</div>
			<div>
				<input type="button" id="addbtn" value="ȸ������">
			</div>
		</fieldset>
	</form>
</body>
</html>