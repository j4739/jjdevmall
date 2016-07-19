<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
	<%
	String send_no = request.getParameter("send_no");
	System.out.println(send_no + "<-- send_id itemDelete.jsp");
	
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	
	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/jjdevmall?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "root";
		String dbPass = "java0000";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		pstmt = conn.prepareStatement("DELETE FROM item WHERE item_no=?");
		pstmt.setString(1, send_no);
		pstmt.executeUpdate();
		
		
		response.sendRedirect(request.getContextPath()+"/admin/item/itemAllList.jsp");
	}finally{
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
	%>
	</body>
</html>