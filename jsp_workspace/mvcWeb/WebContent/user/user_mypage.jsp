﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<style type="text/css">
</style>

</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<section>
		<div class="container">
			<div class="row join-wrap">

				<div class="col-xs-12 col-md-9 join-form">

					<div class="titlebox">MEMBER</div>
					<div>
						<p>${user.name}님 회원정보</p>
					</div>
					<div>
						<a href="/mvcWeb/myPageInfo.user">
							<button type="button" class="btn btn-primary">회원정보변경</button>
						</a>
						<button type="button" class="btn btn-primary" id="delCheck">회원탈퇴</button>

					</div>
					<div class="delete-hidden">
						<form action="/mvcWeb/delete.user" method="post">
							<input type="password" class="form-control" name="pw" placeholder="비밀번호를 입력하세요">
							<button type="submit" class="btn btn-primary" onclick="return confirm('정말 삭제하시겠습니까?')">확인</button>
						</form>
					</div>

					<br>
					<div>
						<p>${user.id}님의 작성 게시물</p>
						<table class="table table-striped"
							style="text-align: center; border: 2px solid #737373">
							<thead>
								<tr>
									<th style="text-align: center;">번호</th>
									<th style="text-align: center;">제목</th>
									<th style="text-align: center;">작성자</th>
									<th style="text-align: center;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="b" items="${myInfoList}">
									<tr>
										<td>${b.boardId}</td>
										<td>
											<a href="/mvcWeb/contentPage.board?bId=${b.boardId}&page=${param.page}&countPerPage=${param.countPerPage}">${b.title}</a>
										</td>
										<td>${b.writer}</td>
										<td>
											<fmt:formatDate value="${b.regDate}" pattern="yyyy/MM/dd a hh:mm"/>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>

				</div>

			</div>

		</div>

	</section>

	<%@ include file="../include/footer.jsp"%>

	<script>
        //탈퇴버튼 디스플레이 처리
        var delCheck = document.getElementById("delCheck");
        delCheck.onclick = function() {
            var del  = document.querySelector(".delete-hidden");
            if(del.style.display == "none" || del.style.display == "") {
                del.style.display = "inline";
            } else {
                del.style.display = "none";
            }
        }
    </script>

</body>
</html>