<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>튜토리얼 수정</title>
<script>
	function back(){
		history.back();
	}

	function timeLimit(){
		var time = document.form.time.value * 1;
		
		if (time > 72){
			alert("소요 시간은 72시간 이하로 해주세요.");
			return false;
		} else if (time < 1){
			alert("소요 시간은 1시간보다 적을 수 없습니다.");
			return false;
		} else {
			document.form.action = "update.do";
			return true;
		}
	}
</script>
<style>
	#board {
		width: 50%;
		height: auto;
		margin: auto;
	}
	#board hr {
		margin: 20px 0 20px 0;
	}
	#board p {
		display: inline;
		font-size: 14px;
	}
	.input {
		width: 180px;
		height: 25px;
		background-color: white;
		border: 1px solid #00C6BD;
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
	#contentarea {
		border: 1px solid #00C6BD;
		resize: none;
		width: 70%;
		height: 100px;
		overflow-y: scroll;
	}
	#orgImg {
		width: 40%;
		height: auto;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/hdft/Header.jsp"/>
	</header>
	<div style="height:250px;"></div>
	
	<h1 style="margin:0 0 50px 500px;">튜토리얼 수정</h1>
	<br><p>
	<hr style="height:2px; width:50%; border:0; background-color:gray; margin-bottom:20px;"/>
	
	<div id="board">
		<form name="form" method="post" enctype="multipart/form-data" onsubmit="return timeLimit()">
			<input type="hidden" name="tseq" value="${tutorial2.tseq}"/>
			<p style="margin:0 71px 0 50px; width:220px">*제목</p><input type="text" name="title" value="${tutorial2.title}" class="input"
			 maxlength="30" style="width:300px;"/>
			<hr/>
			<p style="margin:0 22px 0 50px;">*대표 이미지</p>
			<img src="/howland/source/tutorial/${tutorial2.mainimg}" id="orgImg"/>
			<input type="file" name="mainimg" style="margin-left:20px;"/>
			<input type="hidden" name="mainimage" value="${tutorial2.mainimg}"/>
			<hr/>
			<p style="margin:0 43px 0 50px;">*한줄소개</p><input type="text" name="description" value="${tutorial2.description}" class="input"
			 maxlength="100" style="width:70%;"/>
			<hr/>
			<p style="margin:0 25px 0 50px;">*관련 태그</p>
			<p>#&nbsp;
				<c:if test="${tutorial2.tag eq '패션'}">
					<select name="tag" class="tag" style="width:100px;">
						<option value="">없음</option>
						<option value="패션" selected>패션</option>
						<option value="글쓰기">글쓰기</option>
						<option value="요리">요리</option>
						<option value="그림">그림</option>
						<option value="사진">사진</option>
						<option value="음악">음악</option>
						<option value="공예">공예</option>
						<option value="게임">게임</option>
						<option value="스포츠">스포츠</option>
						<option value="컴퓨터">컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${tutorial2.tag eq '글쓰기'}">
					<select name="tag" class="tag" style="width:100px;">
						<option value="">없음</option>
						<option value="패션">패션</option>
						<option value="글쓰기" selected>글쓰기</option>
						<option value="요리">요리</option>
						<option value="그림">그림</option>
						<option value="사진">사진</option>
						<option value="음악">음악</option>
						<option value="공예">공예</option>
						<option value="게임">게임</option>
						<option value="스포츠">스포츠</option>
						<option value="컴퓨터">컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${tutorial2.tag eq '요리'}">
					<select name="tag" class="tag" style="width:100px;">
						<option value="">없음</option>
						<option value="패션">패션</option>
						<option value="글쓰기">글쓰기</option>
						<option value="요리" selected>요리</option>
						<option value="그림">그림</option>
						<option value="사진">사진</option>
						<option value="음악">음악</option>
						<option value="공예">공예</option>
						<option value="게임">게임</option>
						<option value="스포츠">스포츠</option>
						<option value="컴퓨터">컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${tutorial2.tag eq '그림'}">
					<select name="tag" class="tag" style="width:100px;">
						<option value="">없음</option>
						<option value="패션">패션</option>
						<option value="글쓰기">글쓰기</option>
						<option value="요리">요리</option>
						<option value="그림" selected>그림</option>
						<option value="사진">사진</option>
						<option value="음악">음악</option>
						<option value="공예">공예</option>
						<option value="게임">게임</option>
						<option value="스포츠">스포츠</option>
						<option value="컴퓨터">컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${tutorial2.tag eq '사진'}">
					<select name="tag" class="tag" style="width:100px;">
						<option value="">없음</option>
						<option value="패션">패션</option>
						<option value="글쓰기">글쓰기</option>
						<option value="요리">요리</option>
						<option value="그림">그림</option>
						<option value="사진" selected>사진</option>
						<option value="음악">음악</option>
						<option value="공예">공예</option>
						<option value="게임">게임</option>
						<option value="스포츠">스포츠</option>
						<option value="컴퓨터">컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${tutorial2.tag eq '음악'}">
					<select name="tag" class="tag" style="width:100px;">
						<option value="">없음</option>
						<option value="패션">패션</option>
						<option value="글쓰기">글쓰기</option>
						<option value="요리">요리</option>
						<option value="그림">그림</option>
						<option value="사진">사진</option>
						<option value="음악" selected>음악</option>
						<option value="공예">공예</option>
						<option value="게임">게임</option>
						<option value="스포츠">스포츠</option>
						<option value="컴퓨터">컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${tutorial2.tag eq '공예'}">
					<select name="tag" class="tag" style="width:100px;">
						<option value="">없음</option>
						<option value="패션">패션</option>
						<option value="글쓰기">글쓰기</option>
						<option value="요리">요리</option>
						<option value="그림">그림</option>
						<option value="사진">사진</option>
						<option value="음악">음악</option>
						<option value="공예" selected>공예</option>
						<option value="게임">게임</option>
						<option value="스포츠">스포츠</option>
						<option value="컴퓨터">컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${tutorial2.tag eq '게임'}">
					<select name="tag" class="tag" style="width:100px;">
						<option value="">없음</option>
						<option value="패션">패션</option>
						<option value="글쓰기">글쓰기</option>
						<option value="요리">요리</option>
						<option value="그림">그림</option>
						<option value="사진">사진</option>
						<option value="음악">음악</option>
						<option value="공예">공예</option>
						<option value="게임" selected>게임</option>
						<option value="스포츠">스포츠</option>
						<option value="컴퓨터">컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${tutorial2.tag eq '스포츠'}">
					<select name="tag" class="tag" style="width:100px;">
						<option value="">없음</option>
						<option value="패션">패션</option>
						<option value="글쓰기">글쓰기</option>
						<option value="요리">요리</option>
						<option value="그림">그림</option>
						<option value="사진">사진</option>
						<option value="음악">음악</option>
						<option value="공예">공예</option>
						<option value="게임">게임</option>
						<option value="스포츠" selected>스포츠</option>
						<option value="컴퓨터">컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${tutorial2.tag eq '컴퓨터'}">
					<select name="tag" class="tag" style="width:100px;">
						<option value="">없음</option>
						<option value="패션">패션</option>
						<option value="글쓰기">글쓰기</option>
						<option value="요리">요리</option>
						<option value="그림">그림</option>
						<option value="사진">사진</option>
						<option value="음악">음악</option>
						<option value="공예">공예</option>
						<option value="게임">게임</option>
						<option value="스포츠">스포츠</option>
						<option value="컴퓨터" selected>컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${tutorial2.tag eq '치료'}">
					<select name="tag" class="tag" style="width:100px;">
						<option value="">없음</option>
						<option value="패션">패션</option>
						<option value="글쓰기">글쓰기</option>
						<option value="요리">요리</option>
						<option value="그림">그림</option>
						<option value="사진">사진</option>
						<option value="음악">음악</option>
						<option value="공예">공예</option>
						<option value="게임">게임</option>
						<option value="스포츠">스포츠</option>
						<option value="컴퓨터">컴퓨터</option>
						<option value="치료" selected>치료</option>
					</select>
				</c:if>
			</p>
			<p style="margin:0 20px 0 80px;">*난이도</p>
			<c:if test="${tutorial2.difficulty == 1}">
				<select name="difficulty" class="input" style="width:65px;">
					<option value="1" selected>쉬움</option>
					<option value="2">보통</option>
					<option value="3">어려움</option>
				</select>
			</c:if>
			<c:if test="${tutorial2.difficulty == 2}">
				<select name="difficulty" class="input" style="width:65px;">
					<option value="1">쉬움</option>
					<option value="2" selected>보통</option>
					<option value="3">어려움</option>
				</select>
			</c:if>
			<c:if test="${tutorial2.difficulty == 3}">
				<select name="difficulty" class="input" style="width:65px;">
					<option value="1">쉬움</option>
					<option value="2">보통</option>
					<option value="3" selected>어려움</option>
				</select>
			</c:if>
			<p style="margin:0 20px 0 80px;">*소요시간</p>
			<input type="number" min="1" max="72" value="${tutorial2.time}" name="time" class="input"
			style="width:40px;"/>
			<p style="margin-left:3px;">시간</p>
			<hr/>
			<p style="margin:0 46px 0 50px;">이미지1</p>
			<img src="/howland/source/tutorial/${tutorial2.img1}" id="orgImg"/>
			<input type="file" name="img1" style="margin:0 0 30px 20px;"/>
			<input type="hidden" name="image1" value="${tutorial2.img1}"/>
			<br>
			<p style="margin:0 60px 0 50px; position:relative; bottom:90px;">
			*내용1</p>
			<textarea id="contentarea" name="content1" maxlength="1000">${tutorial2.content1}</textarea>
			<div style="height:50px;"></div>
			
			<p style="margin:0 46px 0 50px;">이미지2</p>
			<img src="/howland/source/tutorial/${tutorial2.img2}" id="orgImg"/>
			<input type="file" name="img2" style="margin:0 0 30px 20px;"/>
			<input type="hidden" name="image2" value="${tutorial2.img2}"/>
			<br>
			<p style="margin:0 60px 0 50px; position:relative; bottom:90px;">
			내용2</p>
			<textarea id="contentarea" name="content2" maxlength="1000">${tutorial2.content2}</textarea>
			<div style="height:50px;"></div>
			
			<p style="margin:0 46px 0 50px;">이미지3</p>
			<img src="/howland/source/tutorial/${tutorial2.img3}" id="orgImg"/>
			<input type="file" name="img3" style="margin:0 0 30px 20px;"/>
			<input type="hidden" name="image3" value="${tutorial2.img3}"/>
			<br>
			<p style="margin:0 60px 0 50px; position:relative; bottom:90px;">
			내용3</p>
			<textarea id="contentarea" name="content3" maxlength="1000">${tutorial2.content3}</textarea>
			<div style="height:50px;"></div>
			
			<p style="margin:0 46px 0 50px;">이미지4</p>
			<img src="/howland/source/tutorial/${tutorial2.img4}" id="orgImg"/>
			<input type="file" name="img4" style="margin:0 0 30px 20px;"/>
			<input type="hidden" name="image4" value="${tutorial2.img4}"/>
			<br>
			<p style="margin:0 60px 0 50px; position:relative; bottom:90px;">
			내용4</p>
			<textarea id="contentarea" name="content4" maxlength="1000">${tutorial2.content4}</textarea>
			<div style="height:40px;"></div>
			<hr/>
			
			<input type="button" value="취소"
			style="margin-right:15px; float:right; display:inline; 
			width:110px; height:40px; border:1px solid #00C6BD; border-radius:8px;
			background-color:white; color:#00C6BD;"
			onclick="back()"/>
			
			<input type="submit" value="적용"
			style="margin-right:15px; float:right; display:inline; 
			width:110px; height:40px; border:1px solid #00C6BD; border-radius:8px;
			background-color:#00C6BD; color:white;"/>
		</form>
	</div>
	
	<div style="height:150px;"></div>
	<footer>
		<jsp:include page="/hdft/Footer.jsp"/>
	</footer>
</body>
</html>