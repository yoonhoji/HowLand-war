<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HowLand : 회원정보 수정</title>
<script>
	function back(){
		history.back();
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
		width: 80px;
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
	
	<h1 style="margin:0 0 50px 500px;">회원정보 수정</h1>
	<br><p>
	<hr style="height:2px; width:50%; border:0; background-color:gray; margin-bottom:20px;"/>
	
	<div id="board">
		<form name="form" action="update.do" method="post">
			<input type="hidden" name="no" value="${user2.no}"/>
			<p style="margin:0 71px 0 50px;">아이디</p><input type="text" name="id" value="${user2.id}" class="input" readonly
			style="border: none;"/>
			<hr/>
			
			<p style="margin:0 58px 0 50px;">비밀번호</p><input type="password" name="pw" value="${user2.pw}" class="input"
			pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
			title="8자 이상 영문, 숫자, 특수문자 필수 조합" required="required"/>
			<p class="pattern">8자 이상 영문, 숫자, 특수문자 필수적으로 조합</p>
			<hr/>
			
			<p style="margin:0 25px 0 50px;">비밀번호 확인</p><input type="password" name="pwc" class="input"
			required="required" onchange="javascript:pwCheck()"/>
			<input type="text" id="pwSame" class="input" readonly/>
			<hr/>
			
			<p style="margin:0 87px 0 50px;">이름</p><input type="text" name="name" value="${user2.name}" class="input"
			pattern="[가-힣A-Za-z]{2,30}" title="2~30자 영문, 한글 조합" required="required"/>
			<p class="pattern">2 ~ 30자 영문, 한글 자유롭게 조합</p>
			<hr/>
			
			<p style="margin:0 58px 0 50px;">전화번호</p><input type="text" name="phone" value="${user2.phone}" class="input"
			pattern="(010)?\d{3,4}?\d{4}" title="ex) 01033337777" required="required"/>
			<p class="pattern">하이픈(-) 제외하고 입력</p>
			<hr/>
			
			<p style="margin:0 50px 0 50px;">관심사 태그</p>
			<p>#&nbsp;
				<c:if test="${user2.tag1 eq '패션'}">
					<select name="tag1" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag1 eq '글쓰기'}">
					<select name="tag1" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag1 eq '요리'}">
					<select name="tag1" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag1 eq '그림'}">
					<select name="tag1" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag1 eq '사진'}">
					<select name="tag1" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag1 eq '음악'}">
					<select name="tag1" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag1 eq '공예'}">
					<select name="tag1" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag1 eq '게임'}">
					<select name="tag1" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag1 eq '스포츠'}">
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
						<option value="스포츠" selected>스포츠</option>
						<option value="컴퓨터">컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${user2.tag1 eq '컴퓨터'}">
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
						<option value="컴퓨터" selected>컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${user2.tag1 eq '치료'}">
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
						<option value="치료" selected>치료</option>
					</select>
				</c:if>
			</p>
			
			<div style="height:8px;"></div>
			
			
			<p style="margin:20px 0 0 177px;">#&nbsp;
				<c:if test="${user2.tag2 eq '패션'}">
					<select name="tag2" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag2 eq '글쓰기'}">
					<select name="tag2" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag2 eq '요리'}">
					<select name="tag2" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag2 eq '그림'}">
					<select name="tag2" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag2 eq '사진'}">
					<select name="tag2" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag2 eq '음악'}">
					<select name="tag2" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag2 eq '공예'}">
					<select name="tag2" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag2 eq '게임'}">
					<select name="tag2" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag2 eq '스포츠'}">
					<select name="tag2" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag2 eq '컴퓨터'}">
					<select name="tag2" class="tag" required>
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
						<option value="컴퓨터" selected>컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${user2.tag2 eq '치료'}">
					<select name="tag2" class="tag" required>
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
						<option value="치료" selected>치료</option>
					</select>
				</c:if>
			</p>
			
			<div style="height:8px;"></div>
			
			
			<p style="margin:20px 0 0 177px;">#&nbsp;
				<c:if test="${user2.tag3 eq '패션'}">
					<select name="tag3" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag3 eq '글쓰기'}">
					<select name="tag3" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag3 eq '요리'}">
					<select name="tag3" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag3 eq '그림'}">
					<select name="tag3" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag3 eq '사진'}">
					<select name="tag3" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag3 eq '음악'}">
					<select name="tag3" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag3 eq '공예'}">
					<select name="tag3" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag3 eq '게임'}">
					<select name="tag3" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag3 eq '스포츠'}">
					<select name="tag3" class="tag" required>
						<option value="">-- 선택 --</option>
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
				<c:if test="${user2.tag3 eq '컴퓨터'}">
					<select name="tag3" class="tag" required>
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
						<option value="컴퓨터" selected>컴퓨터</option>
						<option value="치료">치료</option>
					</select>
				</c:if>
				<c:if test="${user2.tag3 eq '치료'}">
					<select name="tag3" class="tag" required>
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
						<option value="치료" selected>치료</option>
					</select>
				</c:if>
			</p>
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