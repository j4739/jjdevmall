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
	<td>넘버</td><td>아이디</td><td>비밀번호</td><td>이름</td><td>성별</td><td>나이</td><td>주소</td>
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
		String sql = "select * from member m inner join address a on m.member_no = a.member_no";
		stmt = conn.prepareStatement(sql);
		//쿼리 실행
		rs = stmt.executeQuery();
		while(rs.next()){
%>
		<tr>
		<td><%=rs.getString("member_no") %></td>
		<td><%=rs.getString("member_id") %></td>
		<td><%=rs.getString("member_pw") %></td>
		<td><%=rs.getString("member_name") %></td>
		<td><%=rs.getString("member_sex") %></td>
		<td><%=rs.getInt("member_age") %></td>
		<td><%=rs.getString("member_address") %></td>
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