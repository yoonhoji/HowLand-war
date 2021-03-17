<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HowLand</title>
<script>
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

	function bestAlign(){
		var tag = getParameterByName("tag");
		location.href = "/howland/tutorial/list.do?tag="+tag+"&align=likes%20desc";
	}
	
	function newAlign(){
		var tag = getParameterByName("tag");
		location.href = "/howland/tutorial/list.do?tag="+tag+"&align=tseq%20desc";
	}
</script>
<style>
	#align {
		float: right;
		margin: 40px;
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
		width: fit-content;
		position: relative;
		overflow: hidden;
		display: flex;
		border: 1px solid lightgray;
	}
	.tutorial {
		line-height: 0;
		width: 430px;
		height: 430px;
		overflow: hidden;
	}
	.back {
		position: absolute;
		top: 0;
		left: 0;
		transition: 0.6s;
		opacity: 0.7;
		height: 100%;
		width: 100%;
		text-decoration: none;
		background-color: rgba(0, 0, 0, 0.4);
	}
	.listing:hover .back {
		background-color: rgba(0, 0, 0, 0.7);
		opacity: 1;
	}
	#banner {
		width: 450px;
		margin: auto;
		margin-top: 150px;
	}
	#banner p {
		font-family: "나눔명조";
		font-size: 30px;
	}
	.title {
		font-size: 40px;
		font-family: "나눔명조";
		color: white;
		text-align: center;
		position: relative;
		left: 0px;
		top: 205px;
		z-index: 1;
	}
	.view {
		position: absolute;
		right: 100px;
		top: 30px;
		width: 80px;
		height: 30px;
		font-size: 25px;
		color: white;
	}
	.likes {
		position: absolute;
		right: 20px;
		top: 30px;
		width: 80px;
		height: 30px;
		font-size: 25px;
		color: white;
	}
	.tag {
		position: absolute;
		left: 60px;
		bottom: 50px;
		font-size: 20px;
		color: white;
	}
	.reply {
		width: 100px;
		height: 20px;
		position: absolute;
		right: 50px;
		bottom: 30px;
		border: 1px solid white;
		border-radius: 100px;
		text-align: center;
		color: white;
		padding-top: 22px;
	}
	#mainimg {
		width: auto;
		height: 430px;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/hdft/Header.jsp"/>
	</header>
	<br><p style="height:50px;"/>
	<div id="banner">
		<p>자신의 능력을 감추지 마라.</p>
		<p>재능은 쓰라고 주어진 것이다.</p>
		<p>그늘 속의 해시계가 무슨 소용이랴.</p>
		<br>
	</div>
	<p style="padding-left:300px; text-align: center; 
	font-size: 30px; font-family:'Vladimir Script';">
	- Benjamin Franklin</p>
	
	<div id="align">
		<a href="#" onclick="bestAlign()" id="bestalign">인기순</a>
		<div style="border-left:thin solid gray; display:inline;"></div>
		<a href="#" onclick="newAlign()" id="newalign">&nbsp;최신순</a>
	</div>
	<br><p style="height:70px;"/>
	
	<div class="child-page-listing">
		<c:forEach var="tuts" items="${tutorials}">
			<div class="listing">
				<div class="tutorial">
					<c:if test="${sessionScope.user != null}">
						<a href="/howland/tutorial/detail.do?tseq=${tuts.tseq}" style="text-decoration: none;">
					</c:if>
					<c:if test="${sessionScope.user == null}">
						<a href="#" onclick="noLogin()" style="text-decoration: none;">
					</c:if>
					<div class="title">
						${tuts.title}
					</div>
					<div id="filter"></div>
					</a>
					<c:if test="${sessionScope.user != null}">
						<a class="back" href="/howland/tutorial/detail.do?tseq=${tuts.tseq}">
					</c:if>
					<c:if test="${sessionScope.user == null}">
						<a class="back" href="#" onclick="noLogin()">
					</c:if>
						<div class="view">
							<img src="/howland/source/tutorial/white_view.png" style="display:inline; width:30px; height:30px;"/>
							${tuts.view}
						</div>
						<div class="likes">
							<img src="/howland/source/tutorial/white_like.png" style="display:inline; width:30px; height:30px;"/>
							${tuts.likes}
						</div>
						<div class="tag">
							#${tuts.tag}
						</div>
						<div class="reply">
							댓글&nbsp;${tuts.reply}
						</div>
					</a>
					<img src="/howland/source/tutorial/${tuts.mainimg}" id="mainimg"/>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div style="height:150px;"></div>
	<footer>
		<jsp:include page="/hdft/Footer.jsp"/>
	</footer>
</body>
</html>