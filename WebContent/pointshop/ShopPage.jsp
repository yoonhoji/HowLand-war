<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HowLand : Point Shop</title>
<script>
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	function align(){
		var ctg = getParameterByName("ctg");
		var selectBox = document.getElementById("select");
		var selectedValue = selectBox.options[selectBox.selectedIndex].value;
		
		location.href = "/howland/pointshop/list.do?ctg="+ctg+"&align="+selectedValue;
	}
</script>
<style>
	#align {
		float: right;
		margin: 40px 60px 40px 40px;
	}
	#align a {
		text-decoration: none;
		color: gray;
		display: inline;
	}
	
	.child-page-listing {
		width: fit-content;
		position: relative;
		overflow: hidden;
		display: flex;
		flex-wrap: wrap;
		justify-content: space-arround;
		align-items: center;
	}
	.listing {
		margin: 8px;
		width: 340px;
		height: 340px;
		position: relative;
		overflow: hidden;
		display: flex;
		border: 2px solid black;
		border-radius: 30px;
	}
	.item {
		line-height: 0;
		min-width: fit-content;
		text-align: center;
		margin-left: 47px;
	}
	.itemimg {
		width: 240px;
		height: 240px;
	}
	.back {
		position: absolute;
		top: 0;
		left: 0;
		transition: 0.3s;
		opacity: 0;
		background-color: black;
		height: 100%;
		width: 100%;
	}
	.listing:hover .back {
		opacity: 0.3;
	}
	#banner {
		width: 480px;
		margin: auto;
		margin-top: 200px;
	}
	#banner p {
		font-family: "나눔명조";
		font-size: 30px;
	}
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
	.pointimg {
		width: 16px;
		height: 16px;
	}
	.item p {
		font-size: 20px;
		font-weight: 500;
	}
	.itemprice {
		color: #FF6EC7;
	}
	#select {
		width: 120px;
		height: 30px;
		border: 1px solid #FF6EC7;
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
	
	<div id="banner">
		<p>자신의 포인트를 감추지 마라.</p>
		<p>포인트는 쓰라고 주어진 것이다.</p>
		<p>주머니 속의 포인트가 무슨 소용이랴.</p>
		<br>
	</div>
	<p style="padding-left:300px; text-align: center; 
	font-size: 30px; font-family:'Vladimir Script';">
	- Yoonho Ji</p>
	
	<div id="align">
		<select id="select" onchange="align()">
			<option>&nbsp;-- 정렬 방식 --</option>
			<option value="iseq desc">최신순</option>
			<option value="buy desc">인기순</option>
			<option value="price">낮은가격순</option>
			<option value="price desc">높은가격순</option>
		</select>
	</div>
	<br><p style="height:70px;"/>
	
	<div class="child-page-listing">
		<c:forEach var="items" items="${items}">
			<div class="listing">
				<div class="item">
					<a class="back" href="/howland/pointshop/detail.do?iseq=${items.iseq}">
					</a>
					<img src="/howland/source/pointshop/${items.img}" class="itemimg"/>
					<br>
					<p class="itemname">${items.name}</p>
					<p class="itemprice"><img src="/howland/source/user/point_black.png" class="pointimg"/>&nbsp;${items.price}</p>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<footer>
		<jsp:include page="/hdft/Footer.jsp"/>
	</footer>
</body>
</html>