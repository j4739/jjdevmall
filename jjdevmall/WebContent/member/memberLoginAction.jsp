<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
	
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	System.out.println(memberId+" <--memberId");
	System.out.println(memberPw+" <--memberPw");
	Class.forName(driver);
	try{
		conection = DriverManager.getConnection(url, user, userPw);
		
		String sql = "select * from member m inner join address a on m.member_no = a.member_no where member_id=?";
		
		statement = conection.prepareStatement(sql);
		statement.setString(1, memberId);
		resultSet = statement.executeQuery();
		
		
		if(resultSet.next()) {
			System.out.println("회원 아이디 일치 성공");
			if(resultSet.getString("member_pw").equals(memberPw)){
				// 세션에 아이디값 저장
				System.out.println("회원 로그인 성공");
				session.setAttribute("sessionMemberId", resultSet.getString("member_id"));
				session.setAttribute("sessionMemberNo", resultSet.getString("member_no"));
			}
			else{
				System.out.println("회원 비밀번호 일치 실패");
			}
		} else {
			System.out.println("회원 아이디 일치 실패");
			
		}
	} catch (Exception e) {
		
	} finally {
		
	}
	// 로그인 성공,실패에 상관없이 adminIndex.jsp로 이동
	response.sendRedirect(request.getContextPath()+"/index.jsp");
%>
</body>
</html>