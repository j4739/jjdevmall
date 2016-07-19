<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String user = "root";
	String userPw = "java0000";

	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	System.out.println(sessionMemberId+"<--sessionMemberId");

	Class.forName(driver);
	try{
		conection = DriverManager.getConnection(url, user, userPw);
		
		String sql = "select member_id,member_pw,member_name,member_sex,member_age,member_address from member m inner join address a on m.member_no = a.member_no where member_id=?";
		
		statement = conection.prepareStatement(sql);
		statement.setString(1, sessionMemberId);
		resultSet = statement.executeQuery();
		
		if(resultSet.next()){
			resultSet.getString("member_id");
			resultSet.getString("member_pw");
			resultSet.getString("member_name");
			resultSet.getString("member_sex");
			resultSet.getString("member_age");
			resultSet.getString("member_address");
		}
	} catch (Exception e) {
		
	} finally {
		
	}
%>
	<form>
		<h1>회원 정보</h1>
		<div>
			아이디:<input type="text" name="memberid" readonly="readonly" value="<%=sessionMemberId%>">
		</div>
		<div>
			비밀번호:<input type="password" name="memberpw" value="<%=resultSet.getString("member_pw")%>">
		</div>
		<div>
			이름:<input type="text" name="membername" value="<%=resultSet.getString("member_name")%>">
		</div>
		<div>
			성별:<input type="text" name="membersex" value="<%=resultSet.getString("member_sex")%>">
		</div>
		<div>
			나이:<input type="text" name="memberage" value="<%=resultSet.getString("member_age")%>">
		</div>
		<div>
			주소:<input type="text" name="memberaddr" value="<%=resultSet.getString("member_address")%>">
		</div>
		<div>
			<input type="button" name="upadtebtn" value="수정">
			<input type="button" name="deletebtn" value="탈퇴">
		</div>
	</form>
</body>
</html>