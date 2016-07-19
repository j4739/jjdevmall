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
	
	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	System.out.println(adminId+" <--adminId");
	System.out.println(adminPw+" <--adminPw");
	Class.forName(driver);
	try{
		conection = DriverManager.getConnection(url, user, userPw);
		
		String sql = "select admin_id,admin_pw,admin_level from admin where admin_id=?";
		statement = conection.prepareStatement(sql);
		statement.setString(1, adminId);
		resultSet = statement.executeQuery();
		
		
		if(resultSet.next()) {
			System.out.println("관리자 아이디 일치 성공");
			if(resultSet.getString("admin_pw").equals(adminPw)){
				// 세션에 아이디값 저장
				System.out.println("관리자 로그인 성공");
				session.setAttribute("sessionAdminId", resultSet.getString("admin_id"));
				session.setAttribute("sessionAdminPw", resultSet.getString("admin_pw"));
			}
			else{
				System.out.println("관리자 비밀번호 일치 실패");
			}
		} else {
			System.out.println("관리자 아이디 일치 실패");
			
		}
	} catch (Exception e) {
		
	} finally {
		
	}
	// 로그인 성공,실패에 상관없이 adminIndex.jsp로 이동
	response.sendRedirect(request.getContextPath()+"/admin/adminIndex.jsp");
%>
</body>
</html>