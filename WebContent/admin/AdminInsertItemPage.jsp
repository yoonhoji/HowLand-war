<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 상품 등록</title>
<style>
	#board {
		width: 40%;
		margin: auto;
		text-align: center;
	}
	#table {
		width: 100%;
		height: auto;
		text-align: center;
	}
	#col {
		background-color: pink;
		font-size: 20px;
		font-weight: bold;
	}
</style>
</head>
<body>
	<h1 style="text-align:center; margin: 100px 0 40px 0;">상품 등록</h1>
	<div id="board">
		<form action="/howland/admin/insertitem.do" method="post" enctype="multipart/form-data">
			<input type="button" value="관리자 메뉴" onclick="location.href='/howland/admin/AdminPage.jsp'"
			style="float:left; width:120px; height:50px; margin-bottom:20px;"/>
			
			<input type="button" value="상품 목록" onclick="location.href='/howland/admin/itemlist.do'"
			style="float:right; width:120px; height:50px; margin-bottom:20px;"/>
			<table id="table" border="1">
				<tr>
					<td id="col">상품명</td>
					<td><input type="text" name="name"/>
				</tr>
				<tr>
					<td id="col">분류</td>
					<td>
						<select name="ctg">
							<option value="커피/베이커리">커피/베이커리</option>
							<option value="문화생활">문화생활</option>
							<option value="레스토랑">레스토랑</option>
							<option value="편의점">편의점</option>
							<option value="상품권/기타">상품권/기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td id="col">이미지</td>
					<td><input type="file" name="img"/>
				</tr>
				<tr>
					<td id="col">가격</td>
					<td><input type="number" min="500" max="100000" step="100" value="500" name="price"/>
				</tr>
				<tr>
					<td id="col">설명</td>
					<td><textarea name="description"></textarea>
				</tr>
			</table>
			<input type="submit" value="등록"
			style="width:120px; height:50px; margin-top:30px;"/>
		</form>
	</div>
</body>
</html>