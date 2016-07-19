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
		
			var quantity = $("#ordersquantity").val();
			var price = $("#orderprice").val();
			var total = quantity * price
			$("#total").text(total);
			
			$("#ordersquantity").click(function(){
				quantity = $("#ordersquantity").val() 
				$("#total").text(total);
			});
		$("#orderBtn").click(function(){
			$("#orderForm").submit();
		});
	});
</script>
</head>
<body>
<%	
	
	
	request.setCharacterEncoding("UTF-8");
	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	String sessionMemberNo = (String)session.getAttribute("sessionMemberNo");
	String send_no = request.getParameter("send_no");
	if(sessionMemberId == null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	} else {
		Connection conection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String userPw = "java0000";
		
		int itemNo = 0;
		String itemName = "";
		int itemPrice = 0;
		double itemRate = 0;
		
		Class.forName(driver);
		try{
			conection = DriverManager.getConnection(url, user, userPw);
			
			String sql = "select * from item where item_no =?";
			
			statement = conection.prepareStatement(sql);
			statement.setString(1, send_no);
			resultSet = statement.executeQuery();
			
			if(resultSet.next()){
				itemNo = resultSet.getInt("item_no");
				itemName = resultSet.getString("item_name");
				itemPrice = resultSet.getInt("item_price");
				itemRate = resultSet.getInt("item_rate");
				System.out.println(itemName);
				System.out.println(itemPrice);
				System.out.println(itemRate);
			}
			
			
		} catch (Exception e) {
			
		} finally {
			
		}
	%>
		<form id="orderForm" action="<%=request.getContextPath()%>/orders/ordersAction.jsp" method ="post">
			<div>
				상품번호 : 
				<input type="text" name ="itemNo" value="<%=itemNo%>" readonly="readonly"/>
			</div>

			<div>
				상품이름 : 
				<input type="text" value="<%=itemName%>" readonly="readonly"/>
			</div>
			
			<div>
				상품 가격 :
				<span>정가:<%=itemPrice%>원</span>
				<span id="orderPrice" >할인가:<%=(itemPrice*(100-itemRate))*(0.01)%>원</span>
				<span id="orderRate">할인율:<%=itemRate%>%</span>
				<input type="hidden" name="orderRate" value="<%=itemRate%>">
			</div>	
				
			<div>
				상품수량 :
				<select id="ordersQuantity" name="ordersQuantity">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</div>
			
			<div>
				합계 :<span id="total"></span>
			</div>
			
			<div>
				<input type="button" id="orderBtn" value="주문하기">
			</div>
		</form>
	<%
	}
	
	%>
</body>
</html>