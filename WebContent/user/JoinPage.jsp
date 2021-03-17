<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HowLand : 회원가입</title>
<script>
	function back(){
		history.back();
	}
	
	function IDCheck() {
		var id = form.id.value;

		if (id == "") {
			alert("아이디란이 비어 있습니다.");
			form.id.focus();
		} else {
			var child = window.open("/howland/user/idcheck.do?id=" + id + "&for=insert", "", "innerWidth=530, innerHeight=150, left=1200, top=300"
				+ "scrollbars=no,toolbar=no,location=no,resizable=no,status=no,menubar=no,resizable=no");
		}
	}
	
	function RCMDCheck() {
		var rcmd = form.recommend.value;

		if (rcmd == "") {
			alert("추천인란이 비어 있습니다.");
			form.recommend.focus();
		} else {
			window.open("/howland/user/idcheck.do?id=" + rcmd + "&for=rcmd", "", "innerWidth=530, innerHeight=150, left=1200, top=300"
				+ "scrollbars=no,toolbar=no,location=no,resizable=no,status=no,menubar=no,resizable=no");
		}
	}
	
	function pwCheck(){
		var pw = form.pw.value;
		var pwc = form.pwc.value;
		var input = document.getElementById("pwSame");
		
		if (pw == pwc){
			input.style.color = "#4DED30";
			input.value = "비밀번호가 일치합니다.";
		} else {
			input.style.color = "red";
			input.value = "비밀번호가 다릅니다.";
		}
		
	}
	
	function idChange(){
		document.getElementById("checkbtn1").style.color = "gray";
		document.getElementById("checkbtn1").style.border = "1px solid gray";
		document.getElementById("checkbtn1").value = "중복 확인";
	}
	
	function joinCheck(){
		var pwSame = document.getElementById("pwSame").value;
		var checkbtn1 = document.getElementById("checkbtn1").value;
		var checkbtn2 = document.getElementById("checkbtn2").value;
		
		if (pwSame == "비밀번호가 일치합니다."){
			if (checkbtn1 == "중복 확인 완료"){
				if (checkbtn2 == "가능" || checkbtn2 == "찾기"){
					
					return true;
				
				} else {
					alert("등록이 불가한 추천인 아이디입니다.");
					return false;
				}
			} else {
				alert("아이디 중복 확인을 해주세요.");
				return false;
			}
		} else {
			alert("비밀번호가 서로 다릅니다.");
			return false;
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
	#checkbtn1 {
		margin-left: 10px;
		width: 90px;
		height: 28px;
		font-size: 11px;
		border: 1px solid gray;
		border-radius: 5px;
		background-color: white;
		color: gray;
	}
	#checkbtn2 {
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
	.pattern {
		margin-left: 40px;
		color: gray;
	}
	#pwSame {
		font-size: 15px;
		border: none;
		margin-left: 40px;
	}
	#pwSame:focus {
		outline: none;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/hdft/Header.jsp"/>
	</header>
	<div style="height:250px;"></div>
	
	<h1 style="margin:0 0 50px 500px;">회원가입</h1>
	<br><p>
	<hr style="height:2px; width:50%; border:0; background-color:gray; margin-bottom:20px;"/>
	
	<div id="board">
		<form name="form" action="insert.do" method="post" onsubmit="return joinCheck()">
			<p style="margin:0 71px 0 50px;">*아이디</p><input type="text" name="id" class="input"
			pattern="[a-zA-Z0-9]{3,10}" title="3~10자 영문, 숫자 조합" required="required" onchange="javascript:idChange()"/>
			<input type="button" value="중복 확인" id="checkbtn1" onclick="IDCheck()"/>
			<p class="pattern">3 ~ 10자 영문, 숫자 자유롭게 조합</p>
			<hr/>
			
			<p style="margin:0 58px 0 50px;">*비밀번호</p><input type="password" name="pw" class="input"
			pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
			title="8자 이상 영문, 숫자, 특수문자 필수 조합" required="required"/>
			<p class="pattern">8자 이상 영문, 숫자, 특수문자 필수적으로 조합</p>
			<hr/>
			
			<p style="margin:0 25px 0 52px;">*비밀번호 확인</p><input type="password" name="pwc" class="input"
			required="required" onchange="javascript:pwCheck()"/>
			<input type="text" id="pwSame" class="input" readonly/>
			<hr/>
			
			<p style="margin:0 87px 0 50px;">*이름</p><input type="text" name="name" class="input"
			pattern="[가-힣A-Za-z]{2,30}" title="2~30자 영문, 한글 조합" required="required"/>
			<p class="pattern">2 ~ 30자 영문, 한글 자유롭게 조합</p>
			<hr/>
			
			<p style="margin:0 58px 0 50px;">*전화번호</p><input type="text" name="phone" class="input"
			pattern="(010)?\d{3,4}?\d{4}" title="ex) 01033337777" required="required"/>
			<p class="pattern">하이픈(-) 제외하고 입력</p>
			<hr/>
			
			<p style="margin:0 46px 0 50px;">*관심사 태그</p>
			<p>#&nbsp;
				<select name="tag1" class="tag" required>
					<option value="">-- 선택 --</option>
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
			</p><p class="pattern">최소한 하나의 관심사를 등록해주세요</p>
			<div style="height:8px;"></div>
			<p style="margin:20px 0 0 181px;">#&nbsp;
				<select name="tag2" class="tag">
					<option value="">-- 선택 --</option>
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
			<div style="height:8px;"></div>
			<p style="margin:20px 0 0 181px;">#&nbsp;
				<select name="tag3" class="tag">
					<option value="">-- 선택 --</option>
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
			<hr/>
			
			<p style="font-size:13px; margin-left:10px; color:gray;">이 사이트를 추천해 준 사람이 있다면 아이디를 적어주세요. (추천인과 신규가입자 모두 각자 500포인트 지급)</p>
			<div style="height:15px;"></div>
			<p style="margin:0 25px 0 50px;">추천인 아이디</p><input type="text" name="recommend" class="input"/>
			<input type="button" value="찾기" id="checkbtn2" onclick="RCMDCheck()" style="width:60px;"/>
			<hr/>
			
			<input type="button" value="취소"
			style="margin-right:15px; float:right; display:inline; 
			width:110px; height:40px; border:1px solid #00C6BD; border-radius:8px;
			background-color:white; color:#00C6BD;"
			onclick="back()"/>
			
			<input type="submit" value="확인"
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