<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 
</head>
<body>
<table border=5 >
	<tr>
	<td>상품번호</td><td>이름</td><td>가격</td><td>할인율</td><td>수정</td><td>삭제</td>
	</tr>
<%
	request.setCharacterEncoding("utf-8");

	//값 초기화, 변수에 값 대입
	String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String user = "root";
	String userPw = "java0000";
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	try {
		//드라이버로딩
		Class.forName("com.mysql.jdbc.Driver");
		//db접속
		conn = DriverManager.getConnection(url, user, userPw);
		conn.setAutoCommit(false);
	
		//쿼리문장실행 준비
		String sql = "select * from item";
		stmt = conn.prepareStatement(sql);
		//쿼리 실행
		rs = stmt.executeQuery();
		while(rs.next()){
%>
		<tr>
		<td><%=rs.getString("item_no") %></td>
		<td><%=rs.getString("item_name") %></td>
		<td><%=rs.getString("item_price") %></td>
		<td><%=rs.getString("item_rate") %></td>
		<td><a href="<%=request.getContextPath()%>/admin/item/itemUpdateForm.jsp?send_no=<%=rs.getString("item_no")%>">수정</a></td>
		<td><a href="">삭제</a></td>
		</tr>
		 
<%
		}
		//커밋
		conn.commit();
	
	} catch (SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	}
%>
</table>
</body>
</html>