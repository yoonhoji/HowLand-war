<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="dto.TutorialVO,
    		java.net.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tutorial : ${tutorial.title}</title>
<script>
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

	window.onload = function(){
		var show = getParameterByName("show");		
		if (show == 'reply'){
			var element = document.getElementById("showReply");
			element.scrollIntoView({block:'start', behavior:'instant'});
		} else if (show == 'like'){
			var element = document.getElementById("title");
			element.scrollIntoView({block:'start', behavior:'instant'});
		}
	}
	
	function showReply(){
		var element = document.getElementById("showReply");
		element.scrollIntoView({block:'start', behavior:'smooth'});
	}
	function replDelete(rseq, tseq){
		if (confirm("정말 댓글을 삭제하시겠습니까?")){
			location.href = "/howland/reply/delete.do?rseq="+rseq+"&tseq="+tseq;
		}
	}
	function deleteTut(tseq){
		if (confirm("정말 이 튜토리얼을 삭제하시겠습니까?")){
			location.href='/howland/tutorial/delete.do?tseq='+tseq;
		}
	}
	function back(){
		history.back();
	}
</script>
<style>
	#subject {
		width: 1000px;
		hegith: auto;
		margin: auto;
	}
	#subject img {
		width: 1000px;
		height: auto;
	}
	#back {
		font-size: 14px;
		width: 120px;
		height: 40px;
		background-color: white;
		border: 1px solid gray;
		border-radius: 40px;
		position: relative;
		left: 400px;
		bottom: 25px;
	}
	#back:hover {
		border: 1px solid #00C6BD;
		color: #00C6BD;
	}
	#back:focus {
		outline:none;
	}
	#editBtn {
		font-size: 14px;
		width: 100px;
		height: 40px;
		background-color: white;
		border: 1px solid gray;
		border-radius: 8px;
		position: relative;
		left: 1050px;
		bottom: 25px;
		margin-left: 10px;
	}
	#editBtn:hover {
		border: 1px solid #00C6BD;
		color: #00C6BD;
	}
	#editBtn:focus {
		outline:none;
	}
	
	#delBtn {
		font-size: 14px;
		width: 100px;
		height: 40px;
		background-color: white;
		border: 1px solid gray;
		border-radius: 8px;
		position: relative;
		left: 1050px;
		bottom: 25px;
		margin-left: 10px;
	}
	#delBtn:hover {
		border: 1px solid red;
		color: red;
	}
	#delBtn:focus {
		outline:none;
	}
	#title {
		font-size: 56px;
		font-family: "나눔명조";
	}
	#description {
		color: #a6a6a6;
		font-size: 26px;
	}
	#writer {
		font-size: 26px;
		font-family: "나눔명조";
		width: fit-content;
		display: inline;
	}
	#writer img {
		width: 40px;
		height: 40px;
		margin-left: 5px;
	}
	#diff {
		display: inline;
		color: #a6a6a6;
		font-size: 20px;
		margin-right: 5px;
	}
	#time {
		display: inline;
		color: #a6a6a6;
		font-size: 20px;
		margin-right: 5px;
	}
	#like {
		display: inline;
		color: #a6a6a6;
		font-size: 22px;
		margin-right: 5px;
	}
	
	
	
	
	#content {
		width: 800px;
		height: auto;
		margin: auto;
	}
	#content img {
		width: 800px;
		height: auto;
	}
	#content p {
		width: 90%;
		height: auto;
		text-align: center;
		margin: 20px auto 80px auto;
	}
	
	
	
	
	#reply {
		margin: auto;
		width: 900px;
		height: auto;
	}
	#comm {
		position: relative;
		left: 20px;
		top: 0px;
		font-size: 38px;
		font-family: "나눔명조";
	}
	#comm2 {
		position: relative;
		left: 150px;
		top: -65px;
		font-size: 17px;
		font-family: "나눔명조";
		color: gray;
	}
	.comment {
		margin: 0 auto auto auto;
		width: 90%;
		height: auto;
	}
	#repler {
		font-size: 20px;
		font-weight: bold;
		font-family: "나눔명조";
		display: inline;
	}
	#repler img {
		width: 30px;
		height: 30px;
		margin-left: 5px;
		margin-right: 20px;
		display: inline;
	}
	#replytime {
		display: inline;
		font-size: 14px;
		font-family: "나눔명조";
		color: gray;
	}
	#replycontent {
		font-size: 15px;
		font-family: "나눔명조";
	}
	#newcomment {
		width: 700px;
		height: 200px;
		margin: auto;
	}
	#commentpost {
		font-size: 25px;
		font-family: "나눔명조";
	}
	#commentarea {
		resize: none;
		width: 100%;
		height: 100px;
		overflow-y: scroll;
	}
	#commentbtn {
		margin-top: 10px;
		float: right;
		width: 100px;
		height: 34px;
		border: 1px solid #00C6BD;
		border-radius: 8px;
		background-color: #00C6BD;
		color: white;
		font-size: 14px;
	}
	#replDelBtn {
		border: 1px solid red;
		border-radius: 5px;
		background-color: white;
		color: red;
		margin-left: 10px;
	}
	#showReplyBtn {
		margin: 53px 15px 0 0;
		float: right;
		display: inline; 
		width: 110px;
		height: 40px;
		border: 1px solid #00C6BD;
		border-radius: 8px;
		background-color: white;
		color: #00C6BD;
		font-size: 16px;
		transition: 0.3s;
	}
	#showReplyBtn:hover {
		background-color: #00C6BD;
		color: white;
	}
	#likea {
		text-decoration: none;
	}
	#editdate {
		color: gray;
		float: right;
		display: inline;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/hdft/Header.jsp"/>
	</header>
	<div style="height:230px;"></div>
	
	<input type="button" value="돌아가기" id="back" onclick="back()"/>
	<c:if test="${sessionScope.user.no eq tutorial.no}">
		<input type="button" id="editBtn" value="수정" onclick="location.href='/howland/tutorial/updateform.do?tseq=${tutorial.tseq}'"/>
		<input type="button" id="delBtn" value="삭제" onclick="deleteTut(${tutorial.tseq})"/>
	</c:if>
		
	<div id="subject">
		<img src="/howland/source/tutorial/${tutorial.mainimg}"/>
		<p id="title">${tutorial.title}</p>
		<p id="description">${tutorial.description}</p>
		<p id="writer">
			${tutorial.writer}
			<c:choose>
				<c:when test="${tutorial.mastery < 100}">
					<img src="/howland/source/user/mstr4.png"/>
				</c:when>
				<c:when test="${tutorial.mastery < 300}">
					<img src="/howland/source/user/mstr5.png"/>
				</c:when>
				<c:when test="${tutorial.mastery < 600}">
					<img src="/howland/source/user/mstr6.png"/>
				</c:when>
				<c:otherwise>
					<img src="/howland/source/user/mstr7.png"/>
				</c:otherwise>
			</c:choose>
		</p>
		<c:if test="${tutorial.edit eq '2'}">
			<p id="editdate">수정됨 :&nbsp; ${tutorial.editdate}</p>
		</c:if>
		<div style="height:60px;"></div>
		
		<p id="diff">난이도</p>
		<c:if test="${tutorial.difficulty == 1}">
			<img src="/howland/source/tutorial/diff1.png" 
			style="width:90px; height:90px; margin-bottom:-8px;"/>
		</c:if>
		<c:if test="${tutorial.difficulty == 2}">
			<img src="/howland/source/tutorial/diff2.png" 
			style="width:90px; height:90px; margin-bottom:-8px;"/>
		</c:if>
		<c:if test="${tutorial.difficulty == 3}">
			<img src="/howland/source/tutorial/diff3.png" 
			style="width:90px; height:90px; margin-bottom:-8px;"/>
		</c:if>
		
		<img src="/howland/source/tutorial/clock.png" 
		style="width:50px; height:50px; margin:0 0 -16px 60px;"/>
		<p id="time">${tutorial.time}시간</p>
		
		<img src="/howland/source/tutorial/view.png"
		style="width:35px; height:35px; margin:0 0 -10px 300px;"/>
		<p id="like">${tutorial.view}</p>	
		
		<c:if test="${likeCheck eq 'n'}">
			<a href="/howland/tutorial/like.do?tseq=${tutorial.tseq}&updown=up&no=${sessionScope.user.no}" id="likea">
				<img src="/howland/source/tutorial/like1.png"
				style="width:35px; height:35px; margin:0 0 -10px 20px;"/>
			</a>
			<p id="like">${tutorial.likes}</p>
		</c:if>
		<c:if test="${likeCheck eq 'y'}">
			<a href="/howland/tutorial/like.do?tseq=${tutorial.tseq}&updown=down&no=${sessionScope.user.no}" id="likea">
				<img src="/howland/source/tutorial/like2.png"
				style="width:35px; height:35px; margin:0 0 -10px 20px;"/>
			</a>
			<p id="like">${tutorial.likes}</p>
		</c:if>
		
		<input type="button" value="댓글 ${tutorial.reply}" id="showReplyBtn" onclick="showReply()"/>
	</div>
	
	<hr style="width:70%; margin-top:40px;"/>
	
	<div style="height:100px;"></div>
	<div id="content">
		<c:if test="${tutorial.img1 != 'null'}">
			<img src="/howland/source/tutorial/${tutorial.img1}"/>
		</c:if>
		<c:if test="${tutorial.content1 != 'null'}">
			<p>${tutorial.content1}</p>
		</c:if>
		<c:if test="${tutorial.img2 != 'null'}">
			<img src="/howland/source/tutorial/${tutorial.img2}"/>
		</c:if>
		<c:if test="${tutorial.content2 != 'null'}">
			<p>${tutorial.content2}</p>
		</c:if>
		<c:if test="${tutorial.img3 != 'null'}">
			<img src="/howland/source/tutorial/${tutorial.img3}"/>
		</c:if>
		<c:if test="${tutorial.content3 != 'null'}">
			<p>${tutorial.content3}</p>
		</c:if>
		<c:if test="${tutorial.img4 != 'null'}">
			<img src="/howland/source/tutorial/${tutorial.img4}"/>
		</c:if>
		<c:if test="${tutorial.content4 != 'null'}">
			<p>${tutorial.content4}</p>
		</c:if>
	</div>
	
	<br id="showReply">
	<hr style="width:70%; margin-top:200px; margin-bottom:100px;"/>
	
	<div id="reply">
		<p id="comm">댓글 ${tutorial.reply}</p>
		<p id="comm2">타인에게 상처를 주는 언행은 삼가해주세요.</p>
		<hr style="width:100%; margin-bottom:0px;"/>
		
		<c:forEach var="repl" items="${replies}">
			<div class="comment">
				<p id="repler">
					${repl.writer}
					<c:choose>
						<c:when test="${repl.mastery < 100}">
							<img src="/howland/source/user/mstr4.png"/>
						</c:when>
						<c:when test="${repl.mastery < 300}">
							<img src="/howland/source/user/mstr5.png"/>
						</c:when>
						<c:when test="${repl.mastery < 600}">
							<img src="/howland/source/user/mstr6.png"/>
						</c:when>
						<c:otherwise>
							<img src="/howland/source/user/mstr7.png"/>
						</c:otherwise>
					</c:choose>
				</p>
				<p id="replytime">${repl.indate}</p>
				<c:if test="${sessionScope.user.no eq repl.no}">
					<input type="button" id="replDelBtn" value="삭제" onclick="replDelete(${repl.rseq}, ${tutorial.tseq})"/>
				</c:if>
				<p id="replycontent">${repl.content}</p>
			</div>
			<hr style="width:100%; margin-bottom:0px; margin-top:40px;"/>
		</c:forEach>
		
		<div style="height:40px;"></div>
		<div id="newcomment">
			<form action="/howland/reply/insert.do?tseq=${tutorial.tseq}" method="post">
				<p id="commentpost">댓글 작성</p>
				<textarea name="content" id="commentarea" maxlength="500"></textarea>
				<input type="submit" value="작성" id="commentbtn"/>
			</form>
		</div>
	</div>
	
	<div style="height:150px;"></div>
	<footer>
		<jsp:include page="/hdft/Footer.jsp"/>
	</footer>
</body>
</html>