<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dream Come True</title>
    
   	<!-- font awesome -->
	<script src="https://kit.fontawesome.com/ec7c1dce8a.js" crossorigin="anonymous"></script>
    
   	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.css' />">
    <link rel="stylesheet" href="<c:url value='/css/main.css' />">
    
   	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="<c:url value='/js/bootstrap.js' />"></script>
    
    <style>
		/* 맨위로가기 버튼 */
		a.top-control {
		    position: fixed;
		    right: 15px;
		    bottom: 15px;
		    border-radius: 5px;
		    color: #ffffff;
		    text-align: center;
		    width: 45px;
		    height: 45px;
		    font-size: 40px;
		    background-color:#323232; opacity:0.5; filter:alpha(opacity=50);
		    z-index: 999;
		    display: none;
		}
		
		a.top-control:hover{
			background-color:#000
		}

		/* 채팅 버튼 */ 
		.btn-chatting-link {
			font-size: 45px;
			position: fixed;
			background-color: transparent;
			right: 100px;
			bottom: 40px;
		}
		
	</style>	
    
</head>

<body> 
   
<header id="header">
	<nav class="navbar">
		<div class="container">
			<div class="logo">
				<a href="<c:url value='/' />" class="">
					<img class="logo" src="<c:url value='/img/logo.png' />" alt="header-logo">
				</a>
			</div>
			<div class="navbar-menu">
				<div class="navbar-left">
					<div class="">
						<a href="#" class=""><span>강의</span></a>
					</div>
					<div class="">
						<a href="#" class=""><span>멘토링</span></a>
					</div>
					<div class="">
						<a href="#" class=""><span>커뮤니티</span></a>
					</div>
					<div class="">
						<a href="#" class=""><span class="">공지사항</span></a>
					</div>
				</div>
				<div class="navbar-right">
					<div class="btn-movement">
						<c:choose>
							<c:when test="${login == null}">
								<a role="button" href="#" class="btn-login" data-toggle="modal" data-target="#loginModal">로그인</a>
								<a role="button" href="<c:url value='/user/userJoin' />" class="btn-sign-in">회원가입</a>
							</c:when>
							<c:otherwise>
								<a role="button" href="<c:url value='/user/userMypage' />" class="btn-mypage">마이페이지</a>
								<a role="button" href="<c:url value='/'/>" class=>로그아웃</a>	
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>				
		</div>
	</nav>
</header>

<a href="#" class="top-control"><i class="fa-solid fa-angle-up"></i></a>

<button class="btn-chatting-link" onclick="window.open('chatting', 'chatting', 'width=550,height=650');">채팅</button>

<!-- Modal -->
<div id="loginModal" class="modal fade">
	<div class="modal-dialog">
		<form method="post">
			<!-- Modal Content -->
			<div class="modal-content">
				<div class="modal-header-logo">
					<img class="logo" src="<c:url value='/img/logo.png' />" alt="modal-header-logo">
				</div>
				<div class="modal-body">
					<input type="text" placeholder="아이디 또는 이메일을 입력해주세요.">
					<br>
					<input type="password" placeholder="비밀번호를 입력해주세요.">
				</div>
				<div class="modal-sign-more">
					<a href="#">아이디/비밀번호 찾기</a>
					<a href="<c:url value='/user/userJoin' />">회원가입</a>
				</div>
				<div class="btn-modal-footer">
					<button type="submit" class="btn btn-success" data-dismiss="modal">로그인</button>
				</div>
			</div>
		</form>
	</div>
</div>

</body>

<script>
	$(document).ready(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 50) {
				$('.top-control').fadeIn();
			} else {
				$('.top-control').fadeOut();
			}
		});
		$('.top-control').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 200);
			return false;
		});
	});
</script>

</html>