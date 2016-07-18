<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//memberAddForm에서 값 받아오기
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberName = request.getParameter("memberName");
		String memberSex = request.getParameter("memberSex");
		String memberAge = request.getParameter("memberAge");

		System.out.println(memberId + "<--memberId");
		System.out.println(memberPw + "<--memberPw");
		System.out.println(memberName + "<--memberName");
		System.out.println(memberSex + "<--memberSex");
		System.out.println(memberAge + "<--memberAge");

		//값 초기화, 변수에 값 대입
		String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String userPw = "java0000";
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			//db접속
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, userPw);
			conn.setAutoCommit(false);

			//쿼리문장실행 준비
			String sql = "INSERT INTO member(member_id, member_pw, member_name, member_sex, member_age) VALUES (?, ?, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, memberId);
			stmt.setString(2, memberPw);
			stmt.setString(3, memberName);
			stmt.setString(4, memberSex);
			stmt.setString(5, memberAge);
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