<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>

<section>
	<div class="container">
	    <div class="row">
	        <div class="col-xs-12 col-md-9 write-wrap">
	                <div class="titlebox">
	                    <p>수정하기</p>
	                </div>
	                
	                <form action="<c:url value='/freeBoard/freeUpdate' />" name="updateForm" method="post">
	                    <div>
	                        <label>DATE</label>
	                        <p>${article.regdate}</p>
	                    </div>   
	                    <div class="form-group">
	                        <label>번호</label>
	                        <input class="form-control" name='bno' value="${article.bno}" readonly>
	                    </div>
	                    <div class="form-group">
	                        <label>작성자</label>
	                        <input class="form-control" name='writer' value="${article.writer}" readonly>
	                    </div>    
	                    <div class="form-group">
	                        <label>제목</label>
	                        <input class="form-control" name='title' value="${article.title}">
	                    </div>
	
	                    <div class="form-group">
	                        <label>내용</label>
	                        <textarea class="form-control" rows="10" name='content'>${article.content}</textarea>
	                    </div>
	
	                    <button type="button" class="btn btn-dark" id="listBtn">목록</button>    
	                    <button type="button" class="btn btn-primary" id="updateBtn">변경</button>
	                    <button type="button" class="btn btn-info" id="delBtn">삭제</button>
	            </form>
	                            
	        </div>
	    </div>
	</div>
</section>

<%@ include file="../include/footer.jsp" %>

<script>
  
	//목록 이동 처리
	$(function() {
		$('#listBtn').click(function() {
			location.href="<c:url value='/freeBoard/freeList' />"
	 	});
	});
  
  
	//수정 버튼 이벤트 처리
	/*
	 * 1. 폼 데이터가 공백인지 확인 처리
	 * 2. 공백이 없으면 Controller에 freeUpdate 요청으로 데이터 전송
	 * 3. 컨트롤러에서 처리가 완료된 후에 "게시글 수정이 정상 처리되었습니다."라는 알림창이 글 상세보기 페이지에서 처리
	 */
  	
	const $updateBtn = document.getElementById('updateBtn');

	$updateBtn.onclick = function() {
		if(document.updateForm.title.value === '') {
			alert('제목은 필수 항목 입니다.');
			document.updateForm.title.focus();
			return;
		} else if(document.updateForm.content.value === '') {
			alert('내용은 필수 항목 입니다.');
			document.updateForm.content.focus();
			return;
		} else {
			document.updateForm.submit();
		}
		
	};
  
	//삭제 이벤트 처리
	/*
	 * 삭제같은 경우에는 번호가 노출되면 안되기 때문에 form태그를 이용해서 데이터 전송(post)
	 * action 속성을 delete에 맞게 바꿔서 전송
	 */

	$('#delBtn').click(function() {
		if(confirm('삭제 하시겠습니까?')) {
			$('form[name="updateForm"]').attr('action', '<c:url value="/freeBoard/freeDelete"/>');
			
			$('form[name="updateForm"]').submit();
			
		} else {
			return;
		} 
		
	});



</script>