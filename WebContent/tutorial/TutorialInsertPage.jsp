<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>튜토리얼 작성</title>
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
			
/* 			var upmain = uploadmain();
			var up1 = upload1();
			var up2 = upload2();
			var up3 = upload3();
			var up4 = upload4();
			
			if (upmain && up1 && up2 && up3 && up4){
				document.form.action = "insert.do"; */
				return true;
/* 			} else {
				return false;
			} */
		}
	}
	
	/* function uploadmain(){
		var filePath = document.getElementById("uploadmain").value;
		var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
		var fileKind = fileName.split(".")[1];
		
		if (fileKind != "jpg" && fileKind != "jpeg" && fileKind != "png" && fileKind != "gif"){
			alert("대표이미지 : jpg, jpeg, png, gif 확장자명만 업로드 가능합니다.");
			return false;
		}
		var korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var space = /\s/g;
		
		if (korean.test(fileName) || space.test(fileName)){
			alert("대표이미지 : 파일명에는 한글 또는 공백이 들어갈 수 없습니다.");
			return false;
		}
		return true;
	}
	function upload1(){
		var filePath = document.getElementById("upload1").value;
		var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
		var fileKind = fileName.split(".")[1];
		
		if (fileKind != "jpg" && fileKind != "jpeg" && fileKind != "png" && fileKind != "gif"){
			alert("이미지1 : jpg, jpeg, png, gif 확장자명만 업로드 가능합니다.");
			return false;
		}
		var korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var space = /\s/g;
		
		if (korean.test(fileName) || space.test(fileName)){
			alert("이미지1 : 파일명에는 한글 또는 공백이 들어갈 수 없습니다.");
			return false;
		}
		return true;
	}
	function upload2(){
		var filePath = document.getElementById("upload2").value;
		var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
		var fileKind = fileName.split(".")[1];
		
		if (fileKind != "jpg" && fileKind != "jpeg" && fileKind != "png" && fileKind != "gif"){
			alert("이미지2 : jpg, jpeg, png, gif 확장자명만 업로드 가능합니다.");
			return false;
		}
		var korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var space = /\s/g;
		
		if (korean.test(fileName) || space.test(fileName)){
			alert("이미지2 : 파일명에는 한글 또는 공백이 들어갈 수 없습니다.");
			return false;
		}
		return true;
	}
	function upload3(){
		var filePath = document.getElementById("upload3").value;
		var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
		var fileKind = fileName.split(".")[1];
		
		if (fileKind != "jpg" && fileKind != "jpeg" && fileKind != "png" && fileKind != "gif"){
			alert("이미지3 : jpg, jpeg, png, gif 확장자명만 업로드 가능합니다.");
			return false;
		}
		var korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var space = /\s/g;
		
		if (korean.test(fileName) || space.test(fileName)){
			alert("이미지3 : 파일명에는 한글 또는 공백이 들어갈 수 없습니다.");
			return false;
		}
		return true;
	}
	function upload4(){
		var filePath = document.getElementById("upload4").value;
		var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
		var fileKind = fileName.split(".")[1];
		
		if (fileKind != "jpg" && fileKind != "jpeg" && fileKind != "png" && fileKind != "gif"){
			alert("이미지4 : jpg, jpeg, png, gif 확장자명만 업로드 가능합니다.");
			return false;
		}
		var korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var space = /\s/g;
		
		if (korean.test(fileName) || space.test(fileName)){
			alert("이미지4 : 파일명에는 한글 또는 공백이 들어갈 수 없습니다.");
			return false;
		}
		return true;
	} */
	function uploadCheck(fileObj){
		var filePath = fileObj.value;
		var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
		var fileKind = fileName.split(".")[1];
		
		if (fileKind != "jpg" && fileKind != "jpeg" && fileKind != "png" && fileKind != "gif"){
			alert("jpg, jpeg, png, gif 확장자명만 업로드 가능합니다.");
		}
	}
</script>
<style>
	#board {
		width: 50%;
		height: 1100px;
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
</style>
</head>
<body>
	<header>
		<jsp:include page="/hdft/Header.jsp"/>
	</header>
	<div style="height:250px;"></div>
	
	<h1 style="margin:0 0 50px 500px;">튜토리얼 작성</h1>
	<br><p>
	<hr style="height:2px; width:50%; border:0; background-color:gray; margin-bottom:20px;"/>
	
	<div id="board">
		<form name="form" action="insert.do" method="post" enctype="multipart/form-data" onsubmit="return timeLimit()">
			<p style="margin:0 71px 0 50px; width:220px; font-weight:bold;">*제목</p><input type="text" name="title" class="input" required
			maxlength="30" style="width:300px;"/>
			<hr/>
			<p style="margin:0 22px 0 50px; font-weight:bold;">*대표 이미지</p>
			<input type="file" name="mainimg" id="uploadmain" onchange="uploadCheck(this)" required/>
			<p>파일명 조건: 10MB 이하, 한글X, 공백X</p>
			<hr/>
			<p style="margin:0 43px 0 50px; font-weight:bold;">*한줄소개</p><input type="text" name="description" class="input" required
			maxlength="100" style="width:70%;"/>
			<hr/>
			<p style="margin:0 25px 0 50px; font-weight:bold;">*관련 태그</p>
			<p>#&nbsp;
				<select name="tag" class="tag" style="width:100px;" required>
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
					<option value="치료">치료</option>
				</select>
			</p>
			<div style="border-right:1px solid gray; height:38px;
			position:absolute; top:595px; left:42%;"></div>
			<p style="margin:0 20px 0 80px; font-weight:bold;">*난이도</p>
			<select name="difficulty" class="input" required
			style="width:65px;">
				<option value="1">쉬움</option>
				<option value="2">보통</option>
				<option value="3">어려움</option>
			</select>
			<div style="border-right:1px solid gray; height:38px;
			position:absolute; top:595px; left:54%;"></div>
			<p style="margin:0 20px 0 80px; font-weight:bold;">*소요시간</p>
			<input type="number" min="1" max="72" value="1" name="time" class="input" required
			style="width:40px;"/>
			<p style="margin-left:3px;">시간</p>
			<hr/>
			<p style="margin:0 46px 0 50px;">이미지1</p>
			<input type="file" name="img1" style="margin-bottom:30px;" id="upload1" onchange="uploadCheck(this)"/>
			<p>파일명 조건: 10MB 이하, 한글X, 공백X</p>
			<br>
			<p style="margin:0 52px 0 50px; position:relative; bottom:90px; font-weight:bold;">
			*내용1</p>
			<textarea id="contentarea" name="content1" maxlength="1000" required></textarea>
			<div style="height:50px;"></div>
			
			<p style="margin:0 46px 0 50px;">이미지2</p>
			<input type="file" name="img2" style="margin-bottom:30px;" id="upload2" onchange="uploadCheck(this)"/>
			<p>파일명 조건: 10MB 이하, 한글X, 공백X</p>
			<br>
			<p style="margin:0 60px 0 50px; position:relative; bottom:90px;">
			내용2</p>
			<textarea id="contentarea" name="content2" maxlength="1000"></textarea>
			<div style="height:50px;"></div>
			
			<p style="margin:0 46px 0 50px;">이미지3</p>
			<input type="file" name="img3" style="margin-bottom:30px;" id="upload3" onchange="uploadCheck(this)"/>
			<p>파일명 조건: 10MB 이하, 한글X, 공백X</p>
			<br>
			<p style="margin:0 60px 0 50px; position:relative; bottom:90px;">
			내용3</p>
			<textarea id="contentarea" name="content3" maxlength="1000"></textarea>
			<div style="height:50px;"></div>
			
			<p style="margin:0 46px 0 50px;">이미지4</p>
			<input type="file" name="img4" style="margin-bottom:30px;" id="upload4" onchange="uploadCheck(this)"/>
			<p>파일명 조건: 10MB 이하, 한글X, 공백X</p>
			<br>
			<p style="margin:0 60px 0 50px; position:relative; bottom:90px;">
			내용4</p>
			<textarea id="contentarea" name="content4" maxlength="1000"></textarea>
			<div style="height:40px;"></div>
			<hr/>
			
			<input type="button" value="취소"
			style="margin-right:15px; float:right; display:inline; 
			width:110px; height:40px; border:1px solid #00C6BD; border-radius:8px;
			background-color:white; color:#00C6BD;"
			onclick="back()"/>
			
			<input type="submit" value="업로드"
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