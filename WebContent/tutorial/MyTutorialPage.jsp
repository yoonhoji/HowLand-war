<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sessionScope.user.name}님의 튜토리얼</title>
<script>
	function align(){
		var selectBox = document.getElementById("select");
		var selectedValue = selectBox.options[selectBox.selectedIndex].value;
		
		location.href = "/howland/tutorial/mylist.do?align="+selectedValue;
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
	.tutorial {
		width: 100%;
		height: 110px;
		padding: 18px 0 30px 0;
	}
	.lvContainer {
		display: inline;
		margin-left: 30px;
		position: relative;
		left: 93px;
		bottom: 100px;
	}
	.lvContainer img {
		width: 30px;
		height: 30px;
	}
	.lvContainer p {
		font-size: 21px;
	}
	.tutTitle {
		font-size: 30px;
		margin-left: 60px;
		display: inline;
		position: relative;
		left: 90px;
		bottom: 105px;
		text-decoration: none;
		color: black;
	}
	.indate {
		color: gray;
		font-size: 20px;
		margin-left: 30px;
		position: relative;
		left: 90px;
		bottom: 108px;
	}
	.comments {
		font-size: 21px;
		margin-left: 60px;
		position: relative;
		left: 93px;
		bottom: 100px;
	}
	.tutImg {
		width: auto;
		height: 120px;
	}
	.imgDiv {
		width: 120px;
		height: 120px;
		overflow: hidden;
		margin: 0;
		border: 1px solid lightgray;
	}
	#select {
		margin-left: 1250px;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/hdft/Header.jsp"/>
	</header>
	<div style="height:150px;"></div>
	
	<a class="menu" href="/howland/user/info.do?no=${sessionScope.user.no}" style="margin-left:520px;">내 정보</a>
	<a class="nowPage" href="/howland/tutorial/mylist.do?no=${sessionScope.user.no}">내 튜토리얼</a>
<%-- 	<a class="menu" href="/howland/subscribe/list.do?no=${user.no}">구독 정보</a> --%>
	<a class="menu" href="/howland/cart/list.do">장바구니</a>
	<a class="menu" href="/howland/cart/orderlist.do">쿠폰함</a>
	<br><p><br><p>
	<select id="select" onchange="align()">
		<option>&nbsp;-- 정렬 방식 --</option>
		<option value="tseq desc">최신</option>
		<option value="tseq">오래됨</option>
	</select>
	<hr style="height:2px; width:50%; border:0; background-color:gray; margin-bottom:10px;"/>
	
	<c:choose>
		<c:when test="${tutorials.size() == 0}">
			<h2 style="text-align: center; margin-top:60px;">아직 게시한 튜토리얼이 없습니다.</h2>
		</c:when>
		<c:otherwise>
			<div id="board">
				<c:forEach var="tut" items="${tutorials}">
					<div class="tutorial">
						<div class="imgDiv">
							<a href="/howland/tutorial/detail.do?tseq=${tut.tseq}">
								<img class="tutImg" src="/howland/source/tutorial/${tut.mainimg}"/>
							</a>
						</div>
						<a class="tutTitle" href="/howland/tutorial/detail.do?tseq=${tut.tseq}">${tut.title}</a>
						<p class="indate">${tut.indate}</p>
						<div style="height:16px;"></div>
						<p class="comments">댓글&nbsp;${tut.reply}</p>
						<div class="lvContainer">
							<img src="/howland/source/tutorial/under_like_black.png"/>
							<p style="margin-right:40px;">${tut.likes}</p>
							<img src="/howland/source/tutorial/black_view.png"/>
							<p>${tut.view}</p>
						</div>
					</div>
					<hr style="width:100%; margin:10px 0 10px 0;"/>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
	
	<div style="height:250px;"></div>
	<footer>
		<jsp:include page="/hdft/Footer.jsp"/>
	</footer>
</body>
</html>