<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 튜토리얼</title>
<script>
	function delTut(tseq, no){
		if (confirm("정말 해당 게시물을 삭제하겠습니까?")){
			location.href="/howland/admin/deltut.do?tseq="+tseq+"&no="+no;
		}
	}
</script>
<style>
	#board {
		width: 90%;
		margin: auto;
	}
	#table {
		width: 100%;
		height: auto;
		text-align: center;
	}
	#tr td {
		background-color: #7febe6;
		font-size: 20px;
		font-weight: bold;
	}
	.mainimg {
		width: 120px;
		height: 120px;
	}
</style>
</head>
<body>
	<h1 style="text-align:center; margin: 100px 0 40px 0;">튜토리얼 관리</h1>
	<div id="board">
		<input type="button" value="관리자 메뉴" onclick="location.href='/howland/admin/AdminPage.jsp'"
		style="float:left; width:120px; height:50px; margin-bottom:20px;"/>
		
		<table id="table" border="1">
			<tr id="tr">
				<td>TSEQ</td>
				<td>태그</td>
				<td>제목</td>
				<td>한줄소개</td>
				<td>작성자</td>
				<td>난이도</td>
				<td>소요시간</td>
				<td>대표이미지</td>
				<td>댓글 수</td>
				<td>좋아요 수</td>
				<td>조회수</td>
				<td>작성일</td>
				<td>수정여부</td>
				<td>수정일</td>
				<td>삭제</td>
			</tr>
			<c:forEach var="tut" items="${tutorials}">
				<tr>
					<td>${tut.tseq}</td>
					<td>${tut.tag}</td>
					<td>${tut.title}</td>
					<td>${tut.description}</td>
					<td>${tut.writer}</td>
					<td>${tut.difficulty}</td>
					<td>${tut.time}</td>
					<td><img src="/howland/source/tutorial/${tut.mainimg}" class="mainimg"/></td>
					<td>${tut.reply}</td>
					<td>${tut.likes}</td>
					<td>${tut.view}</td>
					<td>${tut.indate}</td>
					<td>${tut.edit}</td>
					<td>${tut.editdate}</td>
					<td><input type="button" value="삭제"
					onclick="delTut(${tut.tseq}, ${tut.no})"/></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>