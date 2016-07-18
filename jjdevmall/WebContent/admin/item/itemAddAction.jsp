<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String itemname = request.getParameter("itemname");
		int itemprice = Integer.parseInt(request.getParameter("itemprice"));
		double itemrate = Double.parseDouble(request.getParameter("itemrate"));
		
		System.out.println(itemname + "<--itemname");
		System.out.println(itemprice + "<--itemprice");
		System.out.println(itemrate + "<--itemrate");
		
		//값 초기화, 변수에 값 대입
				String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
				String user = "root";
				String userPw = "java0000";
				Connection conn = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				try {
					//db접속
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(url, user, userPw);
					conn.setAutoCommit(false);

					//쿼리문장실행 준비
					String sql = "INSERT INTO item(item_name, item_price, item_rate)VALUES (?, ?, ?)";
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, itemname);
					stmt.setInt(2, itemprice);
					stmt.setDouble(3, itemrate);
					//쿼리 실행
					stmt.executeUpdate();
					//커밋
					conn.commit();
					
				} catch (SQLException ex) {
					out.println(ex.getMessage());
					ex.printStackTrace();
				}
	%>
</body>
</html>