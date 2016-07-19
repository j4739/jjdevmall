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
	Connection conection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String user = "root";
	String userPw = "java0000";
	
	String itemno = request.getParameter("itemno");
	String itemname = request.getParameter("itemname");
	String itemprice = request.getParameter("itemprice");
	String itemrate = request.getParameter("itemrate");
	
	Class.forName(driver);
	try{
		conection = DriverManager.getConnection(url, user, userPw);
		
		String sql = "UPDATE item SET item_name=?,item_price=?,item_rate=? WHERE item_no=?";
		
		statement = conection.prepareStatement(sql);
		statement.setString(1, itemname);
		statement.setString(2, itemprice);
		statement.setString(3, itemrate);
		statement.setString(4, itemno);
		
		statement.executeUpdate();
		
		
		
	} catch (Exception e) {
		
	} finally {
		
	}
	response.sendRedirect(request.getContextPath()+"/admin/item/itemAllList.jsp");
%>
</body>
</html>