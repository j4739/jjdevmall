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
		int memberAge = Integer.parseInt(request.getParameter("memberAge"));
		String address_addr = request.getParameter("address_addr");

		System.out.println(memberId + "<--memberId");
		System.out.println(memberPw + "<--memberPw");
		System.out.println(memberName + "<--memberName");
		System.out.println(memberSex + "<--memberSex");
		System.out.println(memberAge + "<--memberAge");
		System.out.println(address_addr + "<--address_addr");

		//값 초기화, 변수에 값 대입
		String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String userPw = "java0000";
		Connection conn = null;
		PreparedStatement memstmt = null;
		PreparedStatement addrstmt = null;
		ResultSet rs = null;

		try {
			//db접속
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, userPw);
			conn.setAutoCommit(false);

			//쿼리문장실행 준비
			String sql1 = "INSERT INTO member(member_id, member_pw, member_name, member_sex, member_age) VALUES (?, ?, ?, ?, ?)";
			memstmt = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
			memstmt.setString(1, memberId);
			memstmt.setString(2, memberPw);
			memstmt.setString(3, memberName);
			memstmt.setString(4, memberSex);
			memstmt.setInt(5, memberAge);
			//쿼리 실행
			memstmt.executeUpdate();
			
			rs = memstmt.getGeneratedKeys();
			System.out.println(rs + " : rs memberAddAction.jsp");
			
			int lastKey = 0;
			//memstmt이 제대로 executeUpdate가 됬다면 rs에 PRIMARY KEY 값이 담겨있을 것이다.
			if(rs.next()) {
				lastKey = rs.getInt(1);
				//변수 lastKey에 담겨있는 값은 address테이블의 member_no컬럼의 데이터로 넣을 것이다.
				System.out.println(lastKey + " : lastKey");
			}
			
			if(address_addr != null) {
				//member테이블에 방금 INSERT한 데이터의 PRIMARY KEY 값인 member_no컬럼의 데이터를 가져와서
				//address테이블의 member_no컬럼의 데이터로 넣는다.
				String sql2 = "INSERT INTO address(member_no, member_address) VALUES(?,?)";
				addrstmt = conn.prepareStatement(sql2);
				addrstmt.setInt(1, lastKey);
				addrstmt.setString(2, address_addr);
				System.out.println(addrstmt + " : addrstmt memberAddAction.jsp");
				addrstmt.executeUpdate();
				
				//커밋
				conn.commit();
			}
			
		} catch (SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		}finally{
			rs.close();
			memstmt.close();
			addrstmt.close();
			conn.close();
		}
	%>
</body>
</html>