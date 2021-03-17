<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${user.name}님의 정보</title>
<script>
	function back(){
		history.back();
	}
	
	function userDelete(no, name){
		if (confirm("정말 [ " + name + " ] 계정을 탈퇴하시겠습니까?")){
			location.href = "/howland/user/delete.do?no="+no
		}
	}
</script>
<style>
	#board {
		width: 50%;
		height: 600px;
		margin: auto;
	}
	#board hr {
		width: 50%;
		margin: 30px 0 30px 0;
	}
	#board p {
		display: inline;
		font-size: 14px;
	}
	.input {
		width: 180px;
		height: 25px;
		background-color: white;
	}
	#overlap {
		margin-left: 10px;
		width: 90px;
		height: 28px;
		font-size: 11px;
		border: 1px solid gray;
		border-radius: 5px;
		background-color: white;
		color: gray;
	}
	.tag {
		width: 150px;
		height: 25px;
		background-color: white;
		border: 1px solid #00C6BD;
	}
	#rightside {
		width: fit-content;
		position: absolute;
		top: 240px;
		right: 31%;
	}
	#image {
		width: auto;
		height: 420px;
	}
	#subscriber {
		position: absolute;
		top: 0px;
		left: 18px;
		color: #e3e3e3;
		font-size: 14px;
		font-family: "나눔명조";
	}
	#subscriber img {
		width: 19px;
		height: 19px;
		margin: 0 -4px 0 2px;
	}
	
	#posts {
		position: absolute;
		top: 3px;
		left: 60px;
		color: #e3e3e3;
		font-size: 14px;
		font-family: "나눔명조";
	}
	#posts img {
		width: 16px;
		height: 16px;
		margin: 0 -2px 0 5px;
	}
	#point {
		position: absolute;
		top: 37px;
		left: 60px;
		color: #e3e3e3;
		font-size: 14px;
		font-family: "나눔명조";
	}
	#point img {
		width: 16px;
		height: 16px;
		margin-left: 5px;
	}
	#mstr_point {
		position: absolute;
		top: 70px;
		left: 60px;
		color: #e3e3e3;
		font-size: 14px;
		font-family: "나눔명조";
	}
	#mstr_point img {
		width: 16px;
		height: 16px;
		margin-left: 5px;
	}
	#grade4 {
		position: absolute;
		top: 100px;
		right: 52px;
		color: #e3e3e3;
		font-family: "나눔명조";
		text-align: center;
	}
	#grade5 {
		position: absolute;
		top: 100px;
		right: 56px;
		color: #e3e3e3;
		font-family: "나눔명조";
		text-align: center;
	}
	#grade6 {
		position: absolute;
		top: 100px;
		right: 70px;
		color: #e3e3e3;
		font-family: "나눔명조";
		text-align: center;
	}
	#grade7 {
		position: absolute;
		top: 100px;
		right: 65px;
		color: #e3e3e3;
		font-family: "나눔명조";
		text-align: center;
	}
	#kr { font-size:38px; font-weight:470; margin-bottom:-10px;}
	#en { font-size:20px; }
	
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
</style>
</head>
<body>
	<header>
		<jsp:include page="/hdft/Header.jsp"/>
	</header>
	<div style="height:150px;"></div>
	
	<a class="nowPage" href="/howland/user/info.do?no=${user.no}" style="margin-left:520px;">내 정보</a>
	<a class="menu" href="/howland/tutorial/mylist.do?align=tseq">내 튜토리얼</a>
<%-- 	<a class="menu" href="/howland/subscribe/list.do?no=${user.no}">구독 정보</a> --%>
	<a class="menu" href="/howland/cart/list.do">장바구니</a>
	<a class="menu" href="/howland/cart/orderlist.do">쿠폰함</a>
	<br><p><br><p>
	<hr style="height:2px; width:50%; border:0; background-color:gray; margin-bottom:20px;"/>
	
	<div id="rightside">
		<c:choose>
			<c:when test="${user.mastery < 100}">
				<img src="/howland/source/user/mastery4.png" id="image"/>
			</c:when>
			<c:when test="${user.mastery < 300}">
				<img src="/howland/source/user/mastery5.png" id="image"/>
			</c:when>
			<c:when test="${user.mastery < 600}">
				<img src="/howland/source/user/mastery6.png" id="image"/>
			</c:when>
			<c:otherwise>
				<img src="/howland/source/user/mastery7.png" id="image"/>
			</c:otherwise>
		</c:choose>
		
<%-- 		<p id="subscriber">
			구독자
			<img src="/howland/source/user/subscriber.png"/>
			${user.subscriber}
		</p>
		<br> --%>
		<p id="posts">
			게시물
			<img src="/howland/source/user/pen.png"/>
			${user.post}
		</p>
		<p id="point">
			포인트
			<img src="/howland/source/user/point_white.png"/>
			${user.point}
		</p>
		<p id="mstr_point">
			숙련도
			<img src="/howland/source/user/mstr_white.png"/>
			${user.mastery}
		</p>
		
		<c:choose>
			<c:when test="${user.mastery < 100}">
				<div id="grade4">
					<p id="kr">입문자</p>
					<p id="en">BEGINNER</p>
				</div>
			</c:when>
			<c:when test="${user.mastery < 300}">
				<div id="grade5">
					<p id="kr">중수</p>
					<p id="en">AMATEUR</p>
				</div>
			</c:when>
			<c:when test="${user.mastery < 600}">
				<div id="grade6">
					<p id="kr">고수</p>
					<p id="en">PRO</p>
				</div>
			</c:when>
			<c:otherwise>
				<div id="grade7">
					<p id="kr">장인</p>
					<p id="en">MASTER</p>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div id="board">
		<p style="margin:0 71px 0 50px;">아이디</p><p class="input">${user.id}</p>
		<hr/>
		<p style="margin:0 58px 0 50px;">비밀번호</p><p class="input">${user.pw}</p>
		<hr/>
		<p style="margin:0 87px 0 50px;">이름</p><p class="input">${user.name}</p>
		<hr/>
		<p style="margin:0 58px 0 50px;">전화번호</p><p class="input">${user.phone}</p>
		<hr/>
		<p style="margin:0 38px 0 50px;">관심사 태그</p><p class="input">
			<c:if test="${not empty user.tag1}">
				#${user.tag1}
			</c:if>
			<c:if test="${not empty user.tag2}">
				#${user.tag2}
			</c:if>
			<c:if test="${not empty user.tag3}">
				#${user.tag3}
			</c:if>
		</p>
		<hr style="width:100%;"/>
		
		<input type="button" value="돌아가기"
		style="margin-right:15px; float:right; display:inline; 
		width:110px; height:40px; border:1px solid #00C6BD; border-radius:8px;
		background-color:white; color:#00C6BD;"
		onclick="back()"/>
		
		<input type="button" value="수정"
		style="margin-right:15px; float:left; display:inline; 
		width:110px; height:40px; border:1px solid #00C6BD; border-radius:8px;
		background-color:#00C6BD; color:white;"
		onclick="location.href='/howland/user/update.do?no=${sessionScope.user.no}'"/>
		
		<input type="button" value="회원탈퇴"
		style="margin-right:15px; float:left; display:inline; 
		width:110px; height:40px; border:1px solid #ff3300; border-radius:8px;
		background-color:white; color:#ff3300;"
		onclick="userDelete('${sessionScope.user.no}', '${sessionScope.user.name}')"/>
	</div>
	
	<div style="height:150px;"></div>
	<footer>
		<jsp:include page="/hdft/Footer.jsp"/>
	</footer>
</body>
</html>