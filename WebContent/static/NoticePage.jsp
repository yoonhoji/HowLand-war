<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HowLand : 이용안내</title>
<style>
	#board {
		width: 80%;
		height: auto;;
		margin: auto;
		text-align: center;
	}
	.imgs {
		width: 100%;
		height: auto;
	}
	.title {
		font-size: 36px;
		font-weight: 700;
	}
	.text {
		font-size: 26px;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/hdft/Header.jsp"/>
	</header>
	<br><p style="height:50px;"/>
	
	<div id="board">
		<img src="/howland/source/tutorial/notice1.png" class="imgs"/>
		<div style="height:30px;"></div>
		<p class="title">숙련도 획득 방법</p>
		<div style="height:20px;"></div>
		<p class="text">✦ &nbsp;튜토리얼 작성 &nbsp;+50 &nbsp;(삭제 시 하락)</p>
		<p class="text">✦ &nbsp;받은 좋아요 1개 &nbsp;+10 &nbsp;(취소 시 하락)</p>
		
		<div style="height:60px;"></div>
		<hr style="width:65%;"/>
		<div style="height:20px;"></div>
		<img src="/howland/source/tutorial/notice2.png" class="imgs"/>
		<div style="height:30px;"></div>
		<p class="title">포인트 획득 방법</p>
		<div style="height:20px;"></div>
		<p class="text">✦ &nbsp;첫 회원가입 &nbsp;+1000</p>
		<p class="text">✦ &nbsp;추천인 등록 &nbsp;+500 &nbsp;(두 명 모두)</p>
		<p class="text">✦ &nbsp;튜토리얼 작성 &nbsp;+200 &nbsp;(삭제 시 하락)</p>
		<p class="text">✦ &nbsp;받은 좋아요 1개 &nbsp;+50 &nbsp;(취소 시 하락)</p>
	</div>
	
	<div style="height:150px;"></div>
	<footer>
		<jsp:include page="/hdft/Footer.jsp"/>
	</footer>
</body>
</html>