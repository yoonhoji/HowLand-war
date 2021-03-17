<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sessionScope.user.name}님의 쿠폰함</title>
<style>
	#board {
		width: 50%;
		height: auto;
		margin: auto;
		display: flex;
		overflow: hidden;
		flex-wrap: wrap;
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
	.order {
		width: 182px;
		height: 360px;
		margin: 20px;
		background-color: #FEE5EB;
		text-align: center;
		border: 2px solid gray;
	}
	.iname {
		font-size: 18px;
	}
	.buydate {
		color: gray;
		font-size: 14px;
	}
	.quantity {
		font-size: 17px;
	}
	.itemimg {
		width: 180px;
		height: 180px;
		border: 1px solid lightgray;
		margin-bottom: 13px;
	}
	.showCoupon {
		width: fit-content;
		margin: auto;
	}
	.showCouponBtn {
		background-color: white;
		border: 1px solid black;
		border-radius: 3px;
	}
	.couponNum {
		display: none;
	}
	.showCoupon:hover .couponNum {
		display: block;
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
	<a class="menu" href="/howland/cart/list.do">장바구니</a>
	<a class="nowPage" href="/howland/order/mylist.do">쿠폰함</a>
	<br><p><br><p>
	<hr style="height:2px; width:50%; border:0; background-color:gray; margin-bottom:10px;"/>
	
	<c:choose>
		<c:when test="${orderList.size() == 0}">
			<h2 style="text-align: center; margin-top:60px;">쿠폰함이 비었습니다.</h2>
		</c:when>
		<c:otherwise>
			<div id="board">
				<c:forEach var="order" items="${orderList}">
					<div class="order">
						<img class="itemimg" src="/howland/source/pointshop/${order.img}"/>
						<p class="iname">${order.iname}</p><br>
						<div style="height:17px;"></div>
						<p class="quantity">수량:&nbsp;${order.quantity}개</p><br>
						<div style="height:5px;"></div>
						<p class="buydate">구매일:&nbsp;${order.buydate}</p>
						<div style="height:17px;"></div>
						<div class="showCoupon">
							<input type="button" class="showCouponBtn" value="쿠폰번호 확인"/>
							<input type="text" class="couponNum" value="  ${order.coupon}" readonly/>
						</div>
					</div>
				</c:forEach>
				<div style="height:30px;"></div>
			</div>
		</c:otherwise>
	</c:choose>
	
	<div style="height:250px;"></div>
	<footer>
		<jsp:include page="/hdft/Footer.jsp"/>
	</footer>
</body>
</html>