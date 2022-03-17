<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<div id="wrapper">

	<section class="community-header">
		<div class="container">
			<div class="row">
				<div class=" col-md-12">
					<h2>질문과 답변</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="community-modify">
		<div class="container">
			<div class="row">
				<div class=" col-md-12">
					<div class="modify-body">
						<form action="#">
							<table class="table">
								<tbody class="t-control">
									<tr>
										<td class="t-title">글쓴이</td>
										<td><input type="text" class="form-control"
											value="${article.writer}" readonly></td>
									</tr>
									<tr>
										<td class="t-title">제목</td>
										<td><input type="text" class="form-control"
											value="${article.title}"></td>
									</tr>
									<tr>
										<td class="t-title">내용</td>
										<td><textarea class="form-control" rows="20">${article.content}</textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="modify-bottom">
								<button class="btn">
									<a href="#">목록</a>
								</button>
								<button type="submit" class="btn btn-warning">수정</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp"%>

</div>


