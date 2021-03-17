<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<script>
	function noLogin(){
		if(confirm("로그인 후 이용하실 수 있습니다. 로그인 페이지로 이동하시겠습니까?")){
			location.href = "/howland/auth/LoginPage.jsp";
		}
	}
</script>
<style>
#hllogo {
	position: absolute;
	left: 30px;
	top: 10px;
}
.dropbtn {
	display: inline;
	color: black;
	margin: 16px;
	padding-bottom: 10px;
	font-size: 20px;
	text-align: center;
}

.btn {
	display: inline;
	color: black;
	margin: 16px;
	padding-bottom: 10px;
	font-size: 20px;
	text-align: center;
}
.btn:hover {
	color: #00C6BD;
}

.dropdown {
	position: relative;
	display: inline-block;
	margin: 20px;
}

.dropdown-content {
	text-align: center;
	display: none;
	position: absolute;
	background-color: white;
	border: 1px solid #00C6BD;
	border-radius: 15px;
	min-width: 150px;
	z-index: 2;
	padding-top: 8px;
	padding-bottom: 8px;
	margin-top: 10px;
}

.dropdown-content a {
	color: gray;
	font-size: 16px;
	padding: 5px;
	text-decoration: none;
	display: block;
	margin-top: 16px;
	margin-bottom: 5px;
}
.dropdown-content a:hover {
	color: #00C6BD;
}
.dropdown:hover .dropdown-content {
	display: block;
}
.dropdown:hover .dropbtn {
	color: #00C6BD;
}
#vertical-line1 {
	position: absolute;
	left: 25%;
	top: 15%;
	border-right: thin solid lightgray;
	height: 70%;
}
#vertical-line2 {
	position: absolute;
	left: 50%;
	top: 15%;
	border-right: thin solid lightgray;
	height: 70%;
}
#vertical-line3 {
	position: absolute;
	left: 75%;
	top: 15%;
	border-right: thin solid lightgray;
	height: 70%;
}
.horizontal-line {
	border: none;
	width: 100px;
	height: 1px;
	background-color: lightgray;
}
.brdbtn {
	font-size: 13px;
	width: 80px;
	height: 30px;
	background-color: white;
	border: 1px solid gray;
	border-radius: 18px;
}
.brdbtn:hover {
	border: 1px solid #00C6BD;
	color: #00C6BD;
}
.brdbtn:focus {
	outline:none;
}
#username {
	text-decoration: none;
	color: black;
	font-family: "나눔명조";
	font-weight: bold;
	font-size: 16px;
	margin-right: 10px;
	display: inline;
}
#post {
	width: 140px;
	height: 40px;
	border: 2px solid #00C6BD;
	border-radius: 10px;
	background-color: white;
	color: #00C6BD;
	font-size: 15px;
	margin-right: 65px;
	position: absolute;
	top: 22px;
	right: 150px;
	transition: 0.3s;
}
#post:hover {
	background-color: #00C6BD;
	color: white;
}
#username:hover {
	color: #00C6BD;
}
#pinkpoint:hover {
	color: #FF6EC7;
}
#logo {
	text-decoration: none;
}
#logo img {
	width: auto;
	height: 65px;
}
</style>
</head>
<body style="margin:0;">
	<div style="position:fixed; width:100%; background-color:white; z-index:9999;">
	<div style="height:10px;"></div>
		<div id="hllogo">
			<a href="/howland/tutorial/list.do?tag=all&align=tseq desc" id="logo">
				<img src="/howland/source/tutorial/HowLand_logo_black.png"/>
			</a>
		</div>
		<div class="dropdown" style="margin-left:300px;">
			<h3 class="dropbtn">고객센터</h3>
			<div class="dropdown-content" style="margin-left:-20px;">
				<a href="/howland/static/NoticePage.jsp" style="font-size:16px; margin-top:10px;">이용안내</a>
				<hr class="horizontal-line"/>
				<a href="/howland/static/FAQPage.jsp" style="font-size:16px;">FAQ</a>
			</div>
		</div>
		<div class="dropdown">
			<h3 class="dropbtn">카테고리</h3>
			<div class="dropdown-content" style="min-width:660px; margin-left:-190px; min-height:150px;">
				<div id="vertical">
					<div style="float:left; margin:0 57px 0 57px;">
						<a href="/howland/tutorial/list.do?tag=all&align=tseq%20desc">전체</a>
						<a href="/howland/tutorial/list.do?tag=패션&align=tseq%20desc">패션</a>
						<a href="/howland/tutorial/list.do?tag=글쓰기&align=tseq%20desc">글쓰기</a>
					</div>
					<div id="vertical-line1"></div>
					<div style="float:left; margin:0 57px 0 55px;">
						<a href="/howland/tutorial/list.do?tag=요리&align=tseq%20desc">요리</a>
						<a href="/howland/tutorial/list.do?tag=그림&align=tseq%20desc">그림</a>
						<a href="/howland/tutorial/list.do?tag=사진&align=tseq%20desc">사진</a>	
					</div>
					<div id="vertical-line2"></div>
					<div style="float:left; margin:0 57px 0 66px;">
						<a href="/howland/tutorial/list.do?tag=음악&align=tseq%20desc">음악</a>
						<a href="/howland/tutorial/list.do?tag=공예&align=tseq%20desc">공예</a>
						<a href="/howland/tutorial/list.do?tag=게임&align=tseq%20desc">게임</a>
					</div>
					<div id="vertical-line3"></div>
					<div style="float:left; margin:0 0 0 57px;">
						<a href="/howland/tutorial/list.do?tag=스포츠&align=tseq%20desc">스포츠</a>
						<a href="/howland/tutorial/list.do?tag=컴퓨터&align=tseq%20desc">컴퓨터</a>
						<a href="/howland/tutorial/list.do?tag=치료&align=tseq%20desc">치료</a>
					</div>
				</div>
			</div>
		</div>
		
		<c:if test="${sessionScope.user == null}">
			<div style="display:inline; margin:20px;">	
				<a href="#" onclick="noLogin()" style="text-decoration: none;">
					<h3 class="btn" style="color:#BDBDBD;">마이페이지</h3>
				</a>
			</div>
			<div style="display:inline; margin:20px;">
				<a href="#" onclick="noLogin()" style="text-decoration: none;">
					<h3 class="btn" style="color:#BDBDBD;">포인트샵</h3>
				</a>
			</div>
		</c:if>
		
		<c:if test="${sessionScope.user != null}">
			<div class="dropdown">
				<h3 class="dropbtn">마이페이지</h3>
				<div class="dropdown-content" style="margin-left:-10px;">
					<a href="/howland/user/info.do?no=${sessionScope.user.no}" style="font-size:15px; margin-top:10px;">내 정보</a>
					<hr class="horizontal-line"/>
					<a href="/howland/tutorial/mylist.do?align=tseq" style="font-size:15px;">내 튜토리얼</a>
					<hr class="horizontal-line"/>
					<a href="/howland/cart/list.do" style="font-size:15px;">장바구니</a>
					<hr class="horizontal-line"/>
					<a href="/howland/cart/orderlist.do" style="font-size:15px;">쿠폰함</a>
				</div>
			</div>
			<div style="display:inline; margin:20px;">
				<a href="/howland/pointshop/list.do?ctg=all&align=iseq desc" style="text-decoration: none;">
					<h3 class="btn" id="pinkpoint">포인트샵</h3>
				</a>
			</div>
		</c:if>
		
		<c:if test="${sessionScope.user == null}">
			<div style="float:right; margin:20px;">
				<input class="brdbtn" type="button" value="로그인" style="margin-right:10px;"
				onclick="location.href='/howland/auth/LoginPage.jsp'"/>
				<input class="brdbtn" type="button" value="회원가입" style="margin-right:10px;"
				onclick="location.href='/howland/user/JoinPage.jsp'"/>
			</div>
		</c:if>
		
		<c:if test="${sessionScope.user != null}">
			<div style="float:right; margin:19px;">
				<input type="button" value="튜토리얼 작성" id="post" onclick="location.href='/howland/tutorial/TutorialInsertPage.jsp'"/>
				<a href="/howland/user/info.do?no=${sessionScope.user.no}" id="username">${sessionScope.user.name}</a>				
				<input class="brdbtn" type="button" value="로그아웃" style="margin-right:10px;"
				onclick="location.href='/howland/auth/logout.do'"/>
			</div>
		</c:if>
		
		<div style="height:10px;"></div>
		<div style="height:1px; border:0; background-color:black;"></div>
	</div>
</body>
</html>