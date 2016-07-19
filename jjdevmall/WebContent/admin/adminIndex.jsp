<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#adminBtn").click(function(){
			if($("#adminId").val() == ""){
				alert("아이디을 올바르게 입력하세요.");
			}
			else if($("#adminPw").val() == ""){
				alert("비밀번호를 올바르게 입력하세요.");
			}
			else{
				$("#adminForm").submit();
			}
		});
	});
</script>
</head>
<body>
<%
	String sessionAdminId = (String)session.getAttribute("sessionAdminId");
	System.out.println(sessionAdminId+"<--sessionAdminId");
	if(sessionAdminId == null) { // 로그인이 안된 상태
%>
		<form id="adminForm" action="<%=request.getContextPath()%>/admin/member/adminLoginAction.jsp" method="post">
			<h1>로그인</h1>
			<div>
			아이디:<input type="text" id="adminId" name="adminId">
			</div>
			<div>
			비밀번호:<input type="password" id="adminPw" name="adminPw">
			</div>
			<div>
			<input type="button" id="adminBtn" value="로그인">
			</div>
		</form>
<%		
	} 
	else { // 로그인이 된 상태
%>
	<ol>
		<li><a href="<%=request.getContextPath()%>/admin/item/itemAllList.jsp">상품관리</a></li>
		<li><a href="">주문관리</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/member/memberAllList.jsp">회원관리</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/member/adminLogoutAction.jsp">로그아웃</a></li>
	</ol>
<%
	}
%>
</body>
</html>