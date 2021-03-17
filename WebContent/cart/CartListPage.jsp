<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sessionScope.user.name}님의 카트</title>
<script>
	function deleteItems() {
		if (confirm("선택한 상품을 카트에서 삭제하시겠습니까?")){
			var chkbx = document.getElementsByName("cseqs");
			var cseqs = "";
			
			for (var i = 0; i < chkbx.length; i++) {
				if (chkbx[i].checked) {
					cseqs = cseqs + chkbx[i].value + ",";
				}
			}
			location.href = "/howland/cart/delete.do?cseqs=" + cseqs;
		}
	}
	
	function orderItems(userPoint) {
		if (confirm("선택한 상품을 주문하시겠습니까?")){
			var chkbx = document.getElementsByName("cseqs");
			var cseqs = "";
			
			for (var i = 0; i < chkbx.length; i++) {
				if (chkbx[i].checked) {
					cseqs = cseqs + chkbx[i].value + ",";
				}
			}
			
			var checkSum = document.getElementById("checkSum").value;
			if (userPoint > checkSum){
				location.href = "/howland/cart/order.do?cseqs=" + cseqs + "&checkSum=" + checkSum;
			} else {
				alert("잔여 포인트가 부족합니다.");
			}
		}
	}
	
	function updateSum() {
		var chkbx = document.getElementsByName("cseqs");
		var cseqs = "";
		
		for (var i = 0; i < chkbx.length; i++) {
			if (chkbx[i].checked) {
				cseqs = cseqs + chkbx[i].value + ",";
			}
		}
		var cseq = cseqs.split(",");
		
		var prices = [];
		
		for (var i = 0; i < cseq.length; i++){
			if (!document.getElementById(cseq[i])){
				
			} else {
				prices.push(document.getElementById(cseq[i]).value);
			}
		}
		
		var checkSum = 0;
		for (var i = 0; i < prices.length; i++){
			checkSum = checkSum + parseInt(prices[i]);
		}
		document.getElementById("checkSum").value = checkSum;
	}
</script>
<style>
	#board {
		width: 50%;
		height: auto;
		margin: auto;
	}
	#board hr {
		width: 50%;
		margin: 30px 0 30px 0;
	}
	#board p {
		display: inline;
	}
	.menu {
		text-decoration: none;
		color: black;
		margin-left: 40px;
		font-size: 22px;
	}
	.menu:hover {
		color: #00C6BD;
	}
	.nowPage {
		text-decoration: none;
		color: black;
		margin-left: 40px;
		font-size: 30px;
		font-weight: 900;
	}
	.nowPage:hover {
		color: #00C6BD;
	}
	.cart {
		width: 100%;
		height: 110px;
		padding: 8px 0 20px 0;
	}
	.pointPrice {
		display: inline;
		margin-left: 30px;
		position: relative;
		left: 93px;
		bottom: 65px;
	}
	.pointPrice img {
		width: 17px;
		height: 17px;
	}
	.pointPrice p {
		font-size: 20px;
		font-family: "Malgun Gothic";
		color: #FF6EC7;
	}
	.iname {
		font-size: 30px;
		margin-left: 60px;
		display: inline;
		position: relative;
		right: 35px;
		bottom: 80px;
	}
	.indate {
		color: gray;
		font-size: 20px;
		margin-left: 30px;
		position: relative;
		right: 35px;
		bottom: 83px;
	}
	.quantity {
		font-size: 21px;
		margin-left: 60px;
		position: relative;
		left: 93px;
		bottom: 65px;
	}
	.buyBtn {
		width: 140px;
		height: 50px;
		border: 2px solid #FF6EC7;
		border-radius: 10px;
		font-size: 17px;
		margin: 10px 0 0 10px;
		float: right;
	}
	#sum {
		font-size: 40px;
		margin: 0 30px 0 30px;
	}
	#sum img {
		width: 32px;
		height: 32px;
	}
	#sumValue {
 		font-size: 40px;
		font-family: "Malgun Gothic";
		color: #FF6EC7;
	}
	#sumValue img {
		width: 32px;
		height: 32px;
	}
	#checkSum {
		font-size: 40px;
		font-family: "Malgun Gothic";
		color: #FF6EC7;
		border: none;
		width: 133px;
		margin-bottom: 15px;
	}
	#checkSum:focus {
		outline: none;
	}
	#pointimg {
		width: 32px;
		height: 32px;
	}
	.itemImg {
		width: 120px;
		height: 120px;
		display: inline;
		border: 1px solid lightgray;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/hdft/Header.jsp"/>
	</header>
	<div style="height:150px;"></div>
	
	<a class="menu" href="/howland/user/info.do?no=${sessionScope.user.no}" style="margin-left:520px;">내 정보</a>
	<a class="menu" href="/howland/tutorial/mylist.do?align=tseq">내 튜토리얼</a>
<%-- 	<a class="menu" href="/howland/subscribe/list.do?no=${user.no}">구독 정보</a> --%>
	<a class="nowPage" href="/howland/cart/list.do">장바구니</a>
	<a class="menu" href="/howland/cart/orderlist.do">쿠폰함</a>
	<br><p><br><p>
	<hr style="height:2px; width:50%; border:0; background-color:gray; margin-bottom:10px;"/>
	
	<c:choose>
		<c:when test="${cartList.size() == 0}">
			<h2 style="text-align: center; margin-top:60px;">장바구니가 비었습니다.</h2>
		</c:when>
		<c:otherwise>
			<div id="board">
				<c:forEach var="cart" items="${cartList}">
					<div class="cart">
						<img class="itemImg" src="/howland/source/pointshop/${cart.img}"/>
						<p class="iname">${cart.iname}</p>
						<p class="indate">${cart.indate}</p>
						<input type="checkbox" name="cseqs" value="${cart.cseq}" onchange="updateSum()"
						style="float:right; margin:50px 40px 0 0; width:20px; height:20px;"/>
						<input type="hidden" id="${cart.cseq}" value="${cart.price * cart.quantity}"/>
						<div style="height:16px;"></div>
						<p class="quantity">수량:&nbsp;${cart.quantity}</p>
						<div class="pointPrice">
							<img src="/howland/source/user/point_black.png"/>
							<p>${cart.price * cart.quantity}</p>
						</div>
					</div>
					<hr style="width:100%; margin:10px 0 10px 0;"/>
				</c:forEach>
				<div style="height:30px;"></div>
				<p id="sum">총계</p>
				<p id="sumValue"><img src="/howland/source/user/point_black.png"/>&nbsp;${sum}</p>
				<p id="sum" style="margin-left:280px;">선택</p>
				<img id="pointimg" src="/howland/source/user/point_black.png"/>&nbsp;
				<input type="text" id="checkSum" value="0" readonly/>
				<input type="button" class="buyBtn" value="삭제" onclick="deleteItems()"
				style="background-color:white; color:#FF6EC7; margin-right:15px;"/>
				<input type="button" class="buyBtn" value="구매하기" onclick="orderItems(${sessionScope.user.point})"
				style="background-color:#FF6EC7; color:white;"/>
			</div>
		</c:otherwise>
	</c:choose>
	
	<div style="height:250px;"></div>
	<footer>
		<jsp:include page="/hdft/Footer.jsp"/>
	</footer>
</body>
</html>