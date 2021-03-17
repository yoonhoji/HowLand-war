<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 유저관리</title>
<script>
	function validate(no){
		if (confirm("해당 계정을 활성화 하겠습니까?")){
			location.href="/howland/admin/status.do?no="+no+"&status=Valid";
		}
	}
	function invalidate(no){
		if (confirm("해당 계정을 비활성화 하겠습니까?")){
			location.href="/howland/admin/status.do?no="+no+"&status=Invalid";
		}
	}
</script>
<style>
	#board {
		width: 70%;
		margin: auto;
	}
	#table {
		width: 100%;
		height: auto;
		text-align: center;
	}
	#tr td {
		background-color: lightgreen;
		font-size: 20px;
		font-weight: bold;
	}
	.itemimg {
		width: 120px;
		height: 120px;
	}
</style>
</head>
<body>
	<h1 style="text-align:center; margin: 100px 0 40px 0;">유저 관리</h1>
	<div id="board">
		<input type="button" value="관리자 메뉴" onclick="location.href='/howland/admin/AdminPage.jsp'"
		style="float:left; width:120px; height:50px; margin-bottom:20px;"/>
		
		<table id="table" border="1">
			<tr id="tr">
				<td>NO</td>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>닉네임</td>
				<td>전화번호</td>
				<td>관심사1</td>
				<td>관심사2</td>
				<td>관심사3</td>
				<td>추천인</td>
				<td>게시물 수</td>
				<td>포인트</td>
				<td>숙련도</td>
				<td>활성화/비활성화</td>
			</tr>
			<c:forEach var="user" items="${userList}">
				<tr>
					<td>${user.no}</td>
					<td>${user.id}</td>
					<td>${user.pw}</td>
					<td>${user.name}</td>
					<td>${user.phone}</td>
					<td>${user.tag1}</td>
					<td>${user.tag2}</td>
					<td>${user.tag3}</td>
					<td>${user.recommend}</td>
					<td>${user.post}</td>
					<td>${user.point}</td>
					<td>${user.mastery}</td>
					<c:if test="${user.status eq 'Valid'}">
						<td><input type="button" value="비활성화"
						onclick="invalidate(${user.no})"/></td>
					</c:if>
					<c:if test="${user.status eq 'Invalid'}">
						<td><input type="button" value="활성화"
						onclick="validate(${user.no})"/></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>