<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String itemNo = request.getParameter("itemNo");
	String sessionMemberNo = (String)session.getAttribute("sessionMemberNo");
	String ordersQuantity = request.getParameter("ordersQuantity");
	String orderRate = request.getParameter("orderRate");
	
	System.out.println(itemNo+"<--itemNo");
	System.out.println(sessionMemberNo+"<--sessionMemberNo");
	System.out.println(orderRate+"<--orderRate");
	System.out.println(ordersQuantity+"<--ordersQuantity");
	
		Connection conection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String userPw = "java0000";
		
		Class.forName(driver);
		try{
			conection = DriverManager.getConnection(url, user, userPw);
			conection.setAutoCommit(false);
			String sql = "INSERT INTO orders(item_no, member_no, orders_quantity, orders_rate, orders_date)VALUES (?, ?, ?, ?, SYSDATE())";
			
			statement = conection.prepareStatement(sql);
			statement.setString(1, itemNo);
			statement.setString(2, sessionMemberNo);
			statement.setString(3, ordersQuantity);
			statement.setString(4, orderRate);
			statement.executeUpdate();
			
			conection.commit();
		} catch (Exception e) {
			
		} finally {
			
		}
%>
</body>
</html>