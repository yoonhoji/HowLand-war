<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Point Shop : ${item.name}</title>
<script>

	function buyNow(iseq, oneprice, userPoint){
		if (confirm("상품을 구매하시겠습니까?")){
			var quantity = document.getElementById("quantity").value;
			var price = quantity * oneprice;
			
			if (quantity > 0){
				if (quantity < 10001){
					if (userPoint > price){
						window.location.href="/howland/cart/buynow.do?iseq="+iseq+"&img=${item.img}&quantity="+quantity+"&price="+price;
						
						if (confirm("구매를 완료하였습니다. 쿠폰함으로 이동하시겠습니까?")){
							location.href = "/howland/cart/orderlist.do";	
						}
					} else {
						alert("잔여 포인트가 부족합니다.");
					}
				} else {
					alert("수량은 10000보다 많을 수 없습니다.");
				}
			} else {
				alert("수량은 0보다 적을 수 없습니다.");
			}
		}
	}
	
	function addCart(iseq){
		var quantity = document.getElementById("quantity").value;
		
		if (quantity > 0){
			if (quantity < 10001){
				
				window.location.href="/howland/cart/insert.do?iseq=" + iseq + "&img=${item.img}&quantity=" + quantity;
				
				if (confirm("상품이 장바구니에 담겼습니다. 확인하시겠습니까?")){
					location.href = "/howland/cart/list.do";	
				}
			} else {
				alert("수량은 10000보다 많을 수 없습니다.");
			}
		} else {
			alert("수량은 0보다 적을 수 없습니다.");
		}
	}
</script>
<style>
	#mypoint {
		width: auto;
		height: 30px;
		border: 1px solid #FF6EC7;
		border-radius: 100px;
		padding: 10px 20px 10px 20px;
		position: fixed;
		top: 16px;
		right: 203px;
		z-index: 9999;
		background-color: white;
	}
	#ctg {
		width: 700px;
		height: 20px;
		border: 1px solid #FF6EC7;
		border-radius: 100px;
		float: right;
		margin: 30px 580px 0 0;
		padding: 20px 0 15px 20px;
	}
	#ctg a {
		text-decoration: none;
		color: black;
		margin: 0 22px 0 22px;;
	}
	#ctg a:hover {
		color: #FF6EC7;
	}
	#parent {
		width: 1000px;
		height: 400px;
		margin: 250px auto 180px auto;
		display: flex;
	}
	#left {
		width: 400px;
		height: 400px;
		border: 1px solid lightgray;
	}
	#left img {
		width: 400px;
		height: 400px;
	}
	#right {
		margin: 30px;
	}
	#price {
		color: #FF6EC7;
		font-family: "Malgun Gothic";
	}
	#price img {
		width: 20px;
		height: 20px;
	}
	#category {
		color: gray;
		text-decoration: none;
	}
	.orderBtn {
		position: absolute;
		bottom: 212px;
		left: 832px;
		width: 160px;
		height: 50px;
		border: 2px solid #FF6EC7;
		border-radius: 10px;
		color: white;
		font-size: 16px;
		background-color: #FF6EC7;
	}
	.cartBtn {
		position: absolute;
		bottom: 212px;
		left: 1008px;
		width: 160px;
		height: 50px;
		border: 2px solid #FF6EC7;
		border-radius: 10px;
		color: #FF6EC7;
		font-size: 16px;
		background-color: white;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/hdft/Header.jsp"/>
	</header>
	<br><p style="height:50px;"/>
	
	<h1 style="display:inline; font-family:'나눔명조';
	position:absolute; left:200px; top:120px;">포인트샵</h1>
	
	<div id="mypoint">
		<p style="display:inline; font-size:15px;">내 포인트</p>
		<p style="display:inline; color:#FF6EC7; font-size:22px; margin-left:10px;">${sessionScope.user.point}</p>
	</div>
	
	<div id="ctg">
		<a href="/howland/pointshop/list.do?ctg=all&align=iseq desc">전체</a>
		<a href="/howland/pointshop/list.do?ctg=커피/베이커리&align=iseq desc">커피/베이커리</a>
		<a href="/howland/pointshop/list.do?ctg=문화생활&align=iseq desc">문화생활</a>
		<a href="/howland/pointshop/list.do?ctg=레스토랑&align=iseq desc">레스토랑</a>
		<a href="/howland/pointshop/list.do?ctg=편의점&align=iseq desc">편의점</a>
		<a href="/howland/pointshop/list.do?ctg=상품권/기타&align=iseq desc">상품권/기타</a>
	</div>
	
	<div id="parent">
		<div id="left">
			<img src="/howland/source/pointshop/${item.img}"/>
		</div>
		<div id="right">
			<a href="/howland/pointshop/list.do?ctg=${item.ctg}&align=iseq desc" id="category">${item.ctg}</a>
			<h2>${item.name}</h2>
			<h2 id="price"><img src="/howland/source/user/point_black.png"/>&nbsp;${item.price}</h2>
			<hr style="width:530px; margin-bottom:33px;"/>
			<p>${item.description}</p>
			<p style="font-size:13px; color:gray; margin-top:30px;">사람들이 ${item.buy}번 구매한 상품입니다.</p>
			수량&nbsp;&nbsp;<input type="number" id="quantity" value="1" min="1" max="10"/>
			<input type="button" value="구매하기" onclick="buyNow(${item.iseq}, ${item.price}, ${sessionScope.user.point})" class="orderBtn"/>
			<input type="button" value="장바구니에 담기" onclick="addCart(${item.iseq})" class="cartBtn"/>
		</div>
	</div>
	<footer>
		<jsp:include page="/hdft/Footer.jsp"/>
	</footer>
</body>
</html>