<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#updatebtn").click(function() {
			//값받으면 span값 초기화
			if ($("#itemname").length != 0) {
				$("#namehelper").text("");
			}
			if ($("#itemprice").val() != 0) {
				$("#pricehelper").text("");
			}
			if ($("#itemrate").val() != "") {
				$("#ratehelper").text("");
			}

			//상품등록폼 유효성 검사
			if ($("#itemname").val() == "") {
				$("#namehelper").text("상품 이름을 입력하세요.");
				$("#itemname").focus();
			} else if ($("#itemprice").val() == "" || isNaN($("#itemprice").val())) {
				$("#pricehelper").text("상품 가격을 입력하세요.");
				$("#itemprice").focus();
			} else if ($("#itemrate").val() == "" || isNaN($("#itemprice").val()) < -1) {
				$("#ratehelper").text("상품 할인율을 입력하세요.");
				$("#itemrate").focus();
			} else {
				alert("상품이 수정되었습니다.");
				$("#updateform").submit();
			}
		});
	});
</script>
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
	String dbno = "";
	String dbname = "";
	String dbprice = "";
	String dbrate = "";
	
	String send_no = request.getParameter("send_no");
	System.out.println(send_no+"<--send_no");
	
	Class.forName(driver);
	try{
		conection = DriverManager.getConnection(url, user, userPw);
		
		String sql = "select * from item where item_no= ?";
		
		statement = conection.prepareStatement(sql);
		statement.setString(1, send_no);
		resultSet = statement.executeQuery();
		
		if(resultSet.next()){
			dbno = resultSet.getString("item_no");
			dbname = resultSet.getString("item_name");
			dbprice = resultSet.getString("item_price");
			dbrate = resultSet.getString("item_rate");
		}
	} catch (Exception e) {
		
	} finally {
		
	}

%>
	<form id="updateform" action="<%=request.getContextPath()%>/admin/item/itemUpdateAction.jsp" method="post">
		<fieldset>
			<legend>
				<h2>상품 수정</h2>
			</legend>
			<div>
				상품 번호:<input type="text" id="itemno" name="itemno" readonly="readonly" value="<%=dbno %>"> 
				<span id="nohelper"></span>
			</div>
			<div>
				상품 이름:<input type="text" id="itemname" name="itemname" value="<%=dbname %>"> 
				<span id="namehelper"></span>
			</div>
			<div>
				상품 가격:<input type="text" id="itemprice" name="itemprice" value="<%=dbprice %>">원
				<span id="pricehelper"></span>
			</div>
			<div>
				할인율:<input type="text" id="itemrate" name="itemrate" value="<%=dbrate %>">%
				<span id="ratehelper"></span>
			</div>
			<div>
				<input type="button" id="updatebtn" value="상품수정">
			</div>
		</fieldset>
	</form>
</body>
</html>