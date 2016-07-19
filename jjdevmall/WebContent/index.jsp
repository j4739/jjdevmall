<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#memberBtn").click(function(){
			if($("#memberId").val() == ""){
				alert("아이디을 올바르게 입력하세요.");
			}
			else if($("#memberPw").val() == ""){
				alert("비밀번호를 올바르게 입력하세요.");
			}
			else{
				$("#memberForm").submit();
			}
		});
	});
</script>
</head>
<body>
<%
	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	String sessionMemberNo = (String)session.getAttribute("sessionMemberNo");
	
	System.out.println(sessionMemberId+"<--sessionMemberId");
	System.out.println(sessionMemberNo+"<--sessionMemberNo");
	
	if(sessionMemberId == null) { // 로그인이 안된 상태
%>
		<form id="memberForm" action="<%=request.getContextPath()%>/member/memberLoginAction.jsp" method="post">
			<h1>로그인</h1>
			<div>
			아이디:<input type="text" id="memberId" name="memberId">
			</div>
			<div>
			비밀번호:<input type="password" id="memberPw" name="memberPw">
			</div>
			<div>
			<input type="button" id="memberBtn" value="로그인">
			</div>
		</form>
<%		
	} 
	else { // 로그인이 된 상태
%>
	<ol>
		<li><a href="<%=request.getContextPath()%>/item/itemList.jsp">상품목록</a></li>
		<li><a href="<%=request.getContextPath()%>/member/memberOne.jsp">회원정보</a></li>
		<li><a href="<%=request.getContextPath()%>/member/memberLogoutAction.jsp">로그아웃</a></li>
	</ol>
<%
	}
%>
</body>
</html>