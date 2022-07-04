<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String userID = (String) session.getAttribute("userID");
String userPassword = (String) session.getAttribute("userPassword");
boolean login = userID != null ? true : false;
%>
<!-- 세션에 저장된 로그인 정보 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY TRIP</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.nav-left {
	background-color: #f8f9fa;
	width: 15em;
	height: 31em;
	list-style-type: none;
	margin: 3em 0;
}

h5 {
	font-weight: 400;
	margin-left: 0.5em;
}

h6 {
	font-weight: 400;
	margin-left: 0.5em;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	font-weight: 900;
}
.container-pos{
	width: 18em;
}
#container{
	margin-top: 50px;
}
li a {
	display: block;
	color: #000000;
	padding: 8px;
	margin-left: 0.5em;
	text-decoration: none;
}

li a:hover {
	background-color: gray;
}
</style>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="./index1.nhn"
				style="margin-right: 30px;">MY TRIP</a>
			<form action="contentSearch.nhn" class="d-flex"
				style="margin-right: 20px;">
				<input id="item" name="item" class="form-control me-2" type="text"
					placeholder="Search" autocomplete="off">
				<button class="btn btn-dark" name="item-submit" id="item-submit"
					type="submit">Search</button>
			</form>
			<!-- 글쓰기 버튼 -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"
				style="text-align: center;">
				<li class="btn btn-light"><a class="nav-link"
					href="./content.nhn">여행 등록하기</a></li>
			</ul>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<li class="btn btn-light"><a class="nav-link"
					href="./mypageView.nhn">여행지 관리</a></li>
			</ul>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<form action="myContentResGo.nhn">
					<input type="hidden" id="idx" name="userID" value="${userID}"/>
					<li class="btn btn-light">
					<input class="nav-link" type="submit" value="주문 내역 확인" style="border:none;"></li>
				</form>
			</ul>
			<form action="logout.nhn">
				<button class="btn btn-outline-dark" type="submit"
					style="margin: 10px">
					<a href="./login.nhn" style="text-decoration: none; color: black;">로그아웃</a>
				</button>
			</form>
		</div>
	</nav>
	<!-- side nav -->
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav container-pos">
				<ul class="nav-left">
					<h6 style="padding-top:15px;">${userID}</h6>
					<li><a href="logout.nhn">로그아웃</a></li><br/>
					<h5>My Account</h5>
					<li><a href="mypageView.nhn">회원정보수정</a></li>
					<li><a href="#!">여행지 수정</a></li>
					<br />
					<li>
						<form action="myContentResGo.nhn">
							<input type="hidden" id="idx" name="userID" value="${userID}" />
							<!--<input type="text" id="userID" name="userID" value="${userID}">-->
							<input type="submit" value="내 컨텐츠 주문내역">
						</form>
					</li>
					<h5>My Order</h5>
					<li>
						<form action="reservationGo.nhn">
							<input type="hidden" id="idx" name="userID" value="${userID}" />
							<!-- <input type="text" id="userID" name="userID" value="${userID}"> -->
							<input type="submit" value="주문 내역 조회">
						</form>
					</li>
					<li><a href="#">상품 리뷰</a></li>
					<br />
					<h5>Customer Service</h5>
					<li><a href="#">상품 문의</a></li>
				</ul>
			</div>

			<!-- Main -->
			<div class="col-sm-9" id="container">
				<div class="container">
					<div class="row">
						<table class="table table-striped"
							style="border: 1px solid #dddddd">
							<thead>
								<div style="padding: 4px; background-color: #173B0B">
									<h1 colspan="5" style="color: white; text-align: center;">
										My Content Reservation List <br />
									</h1>
									<h3 style="color: white; text-align: right;">
										${reservationList.totalCount} (${reservationList.currentPage}
										/ ${reservationList.totalPage}) &nbsp; &nbsp;</h3>
									</h3>
								</div>
								<tr>
									<th style="background-color: #eeeeee; text-align: center;">주문번호</th>
									<th style="background-color: #eeeeee; text-align: center;">콘텐츠
										이름</th>
									<th style="background-color: #eeeeee; text-align: center;">신청자</th>
									<th style="background-color: #eeeeee; text-align: center;">주문일시</th>
									<th style="background-color: #eeeeee; text-align: center;">콘텐츠
										소유자</th>


								</tr>
							</thead>
							<tbody>
								<c:set var="list" value="${reservationList.list}"></c:set>
								<c:if test="${list.size() == 0 }">
									<tr>
										<td colspan="5" align="right"><marquee>테이블에 저장된
												글이 없습니다.</marquee></td>
									</tr>
								</c:if>
								<c:if test="${list.size() != 0 }">
									<c:forEach var="ro" items="${list}">
										<tr>
											<td align="center">${ro.resIdx}</td>
											<td align="center"><c:set var="subject"
													value="${fn:replace(ro.subject, '<', '&lt;')}"></c:set> <c:set
													var="subject"
													value="${fn:replace(ro.subject, '>', '&gt;')}"></c:set> <a
												href="contentView.nhn?idx=${ro.idx}&currentPage=${reservationList.currentPage}">${subject}</a>
											</td>
											<td align="center"><c:set var="resID"
													value="${fn:replace(ro.resID, '<', '&lt;')}"></c:set> <c:set
													var="resID" value="${fn:replace(ro.resID, '>', '&gt;')}"></c:set>
												${resID}</td>
											<td align="center"><c:if
													test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month &&
									date.date == ro.writeDate.date}">
													<fmt:formatDate value="${ro.writeDate}" pattern="a h:mm:ss" />
												</c:if> <c:if
													test="${date.year != ro.writeDate.year || date.month != ro.writeDate.month || date.date != ro.writeDate.date}">
													<fmt:formatDate value="${ro.writeDate}"
														pattern="yyyy.MM.dd(E)" />
												</c:if> <!-- ${vo.writeDate}  --></td>
											<%-- <td align="center">${vo.hit}</td> --%>
											<td align="center">${ro.contentOwner}</td>

										</tr>
									</c:forEach>
								</c:if>
								<!-- 페이지 이동 버튼 -->
								<tr>
									<td colspan="5" align="center">
										<!-- 처음으로 --> <br /> <c:if
											test="${reservationList.currentPage > 1}">
											<button class="btn btn-outline-dark" type="button"
												title="첫 페이지로 이동합니다."
												onclick="location.href='?currentPage=1'">처음</button>
										</c:if> <c:if test="${reservationList.currentPage <= 1}">
											<button class="btn btn-outline-dark" type="button"
												title="이미 첫 페이지 입니다." disabled="disabled">처음</button>
										</c:if> <!-- 10페이지 앞으로 --> <c:if
											test="${reservationList.startPage > 1}">
											<button class="btn btn-outline-dark" type="button"
												title="이전 10 페이지로 이동합니다."
												onclick="location.href='?currentPage=${reservationList.startPage - 1}'">
												이전</button>
										</c:if> <c:if test="${reservationList.startPage <= 1}">
											<button class="btn btn-outline-dark" type="button"
												title="이미 첫 10 페이지 입니다." disabled="disabled">이전</button>
										</c:if> <!-- 페이지 이동 --> <c:forEach var="i"
											begin="${reservationList.startPage}"
											end="${reservationList.endPage}" step="1">

											<c:if test="${reservationList.currentPage == i}">
												<button class="btn btn-outline-dark" type="button"
													disabled="disabled">${i}</button>
											</c:if>

											<c:if test="${reservationList.currentPage != i}">
												<button class="btn btn-outline-dark" type="button"
													onclick="location.href='?currentPage=${i}'">${i}</button>
											</c:if>

										</c:forEach> <!-- 10페이지 뒤로 --> <c:if
											test="${reservationList.endPage < reservationList.totalPage}">
											<button class="btn btn-outline-dark" type="button"
												title="다음 10 페이지로 이동합니다."
												onclick="location.href='?currentPage=${reservationList.currentPage + 10}'">다음</button>
										</c:if> <c:if
											test="${reservationList.endPage >= reservationList.totalPage}">
											<button class="btn btn-outline-dark" type="button"
												title="이미 마지막 10 페이지 입니다." disabled="disabled">다음</button>
										</c:if> <!-- 마지막으로 --> <c:if
											test="${reservationList.currentPage < reservationList.totalPage}">
											<button class="btn btn-outline-dark" type="button"
												title="첫 페이지로 이동합니다."
												onclick="location.href='?currentPage=${reservationList.totalPage}'">마지막</button>
										</c:if> <c:if
											test="${reservationList.currentPage >= reservationList.totalPage}">
											<button class="btn btn-outline-dark" type="button"
												title="이미 마지막 페이지 입니다." disabled="disabled">마지막</button>
										</c:if>

									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- Footer -->
			<footer class="text-center text-lg-start bg-light text-muted">
				<!-- Section: Social media -->
				<section
					class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
				</section>
				<!-- Section: Social media -->

				<!-- Section: Links  -->
				<section class="">
					<div class="container text-center text-md-start mt-5">
						<!-- Grid row -->
						<div class="row mt-3">
							<!-- Grid column -->
							<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
								<!-- Content -->
								<h6 class="text-uppercase fw-bold mb-4">Customer Service</h6>
								<br />
								<h6 class="text-uppercase fw-bold mb-4">1234-1230</h6>
								<br />
								<br />
								<p>AM 10:00 ~ PM 5:00 MON ~ FRI</p>
								<p>Lunch PM 12:00 ~ 1:00</p>
							</div>
							<!-- Grid column -->

							<!-- Grid column -->
							<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
								<!-- Links -->
								<h6 class="text-uppercase fw-bold mb-4">Products</h6>
								<p>
									<a href="#!" class="text-reset">Angular</a>
								</p>
								<p>
									<a href="#!" class="text-reset">React</a>
								</p>
								<p>
									<a href="#!" class="text-reset">Vue</a>
								</p>
								<p>
									<a href="#!" class="text-reset">Laravel</a>
								</p>
							</div>
							<!-- Grid column -->

							<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
								<h6 class="text-uppercase fw-bold mb-4">Products</h6>
								<p>
									<a href="https://ko-kr.facebook.com/" class="list-group-item"
										target="_blank">Facebook</a>
								</p>
								<p>
									<a href="https://www.instagram.com/?hl=ko"
										class="list-group-item" target="_blank">Instagram</a>
								</p>
								<p>
									<a href="https://twitter.com/?lang=ko" class="list-group-item"
										target="_blank">Twitter</a>
								</p>
							</div>

							<!-- Grid column -->
							<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
								<!-- Links -->
								<h6 class="text-uppercase fw-bold mb-4">Contact</h6>
								<p>
									<i class="fas fa-home me-3"></i> New York, NY 10012, US
								</p>
								<p>
									<i class="fas fa-envelope me-3"></i> info@example.com
								</p>
								<p>
									<i class="fas fa-phone me-3"></i> + 01 234 567 88
								</p>
								<p>
									<i class="fas fa-print me-3"></i> + 01 234 567 89
								</p>
							</div>
							<!-- Grid column -->
						</div>
						<!-- Grid row -->
					</div>
				</section>
				<!-- Section: Links  -->

			</footer>
</body>
</html>