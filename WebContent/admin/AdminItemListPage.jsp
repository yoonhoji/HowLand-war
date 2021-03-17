<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 포인트샵</title>
<script>
	function delItem(iseq){
		if (confirm("정말 해당 상품을 삭제하겠습니까?")){
			location.href="/howland/admin/delitem.do?iseq="+iseq;
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
		background-color: pink;
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
	<h1 style="text-align:center; margin: 100px 0 40px 0;">포인트샵 관리</h1>
	<div id="board">
		<input type="button" value="관리자 메뉴" onclick="location.href='/howland/admin/AdminPage.jsp'"
		style="float:left; width:120px; height:50px; margin-bottom:20px;"/>
		
		<input type="button" value="상품 등록" onclick="location.href='/howland/admin/AdminInsertItemPage.jsp'"
		style="float:right; width:120px; height:50px; margin-bottom:20px;"/>
		<table id="table" border="1">
			<tr id="tr">
				<td>ISEQ</td>
				<td>분류</td>
				<td>이미지</td>
				<td>상품명</td>
				<td>설명</td>
				<td>가격</td>
				<td>구매횟수</td>
				<td>삭제</td>
			</tr>
			<c:forEach var="item" items="${items}">
				<tr>
					<td>${item.iseq}</td>
					<td>${item.ctg}</td>
					<td><img src="/howland/source/pointshop/${item.img}" class="itemimg"/></td>
					<td>${item.name}</td>
					<td>${item.description}</td>
					<td>${item.price}</td>
					<td>${item.buy}</td>
					<td><input type="button" value="삭제"
					onclick="delItem(${item.iseq})"/></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>