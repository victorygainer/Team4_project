<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
	  String userID = (String)session.getAttribute("userID"); 
	  String item = (String)session.getAttribute("item"); 

	  boolean login = userID != null ? true : false;
%>
<!-- 세션에 저장된 로그인 정보 -->
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js">
<script type="text/javascript" src="./contentSearch.nhn"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/team4.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.text {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	font-family: 'Roboto', Arial, sans-serif;
	font-size: 40px;
	font-weight: bold;
	line-height: 1.2;
	letter-spacing: 0.05em;
	white-space: nowrap;
	text-transform: uppercase;
	color: #fff;
	background-color: #000;
	mix-blend-mode: multiply;
	opacity: 0;
	animation: fadeInText 3s 2s ease-out forwards;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	font-weight: 900;
}

@
keyframes scaleImage { 100% {
	transform: scale(1);
}

}
@
keyframes fadeInText { 100% {
	opacity: 1;
}
}
</style>
<title>MY TRIP</title>
</head>
<body>
	<% 
	if(login){
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="./index1.nhn"
				style="margin-right: 30px;">MY TRIP</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
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
			<form action="logout.nhn">
				<button class="btn btn-outline-dark" type="submit"
					style="margin: 10px">
					<button style="text-decoration: none; color: black;">로그아웃</button>
				</button>
				
			</form>
		</div>
	</nav>
	<%	
	} else{
%>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="./index1.nhn"
				style="margin-right: 30px;">MY TRIP</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<!--  <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li> -->
							<form action="contentSearch.nhn" class="d-flex"
									style="margin-right: 20px;">
									<input id="item" name="item" class="form-control me-2" type="text"
										placeholder="Search" autocomplete="off">
									<button class="btn btn-dark" name="item-submit" id="item-submit"
										type="submit">Search</button>
							</form>
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"
					style="float: right">
					<li class="btn btn-light"></li>
				</ul>


				<form class="d-flex">
					<button class="btn btn-outline-dark" type="submit"
						style="margin: 10px">
						<a href="./login.nhn" style="text-decoration: none; color: black;">로그인</a>
					</button>
					<button class="btn btn-outline-dark" type="submit"
						style="margin: 10px">
						<a href="./register.nhn" style="text-decoration: none; color: black;">회원가입</a>
					</button>
			</div>
		</div>
	</nav>
	<%  
	}
%>
	<!-- Main -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="border: 1px solid #dddddd">
				<thead>
					<div style="padding: 4px; background-color: #173B0B">
						<%
					if (item != "") {
					%>
						<h1 colspan="5" style="color: white; text-align: center;">'${item}'
							의 검색결과</h1>
						<% 
					} else {
					%>
						<h1 colspan="5" style="color: white; text-align: center;">Contents
							List</h1>
						<%
					}
					%>
						<h3 style="color: white; text-align: right;">
							${contentList.totalCount} (${contentList.currentPage} /
							${contentList.totalPage}) &nbsp; &nbsp;</h3>
						</h3>
					</div>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">글번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">이름</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="list" value="${contentList.list}"></c:set>
					<c:if test="${list.size() == 0 }">
						<tr>
							<td colspan="5" align="right"><marquee>테이블에 저장된 글이
									없습니다.</marquee></td>
						</tr>
					</c:if>
					<c:if test="${list.size() != 0 }">
						<c:forEach var="vo" items="${list}">
							<tr>
								<td align="center">${vo.idx}</td>
								<td align="center"><c:set var="subject"
										value="${fn:replace(vo.subject, '<', '&lt;')}"></c:set> <c:set
										var="subject" value="${fn:replace(vo.subject, '>', '&gt;')}"></c:set>
									<a
									href="increment.nhn?idx=${vo.idx}&currentPage=${contentList.currentPage}">${subject}</a>
								</td>
								<td align="center"><c:set var="userID"
										value="${fn:replace(vo.userID, '<', '&lt;')}"></c:set> <c:set
										var="userID" value="${fn:replace(vo.userID, '>', '&gt;')}"></c:set>
									${userID}</td>
								<td align="center"><c:if
										test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month &&
								date.date == vo.writeDate.date}">
										<fmt:formatDate value="${vo.writeDate}" pattern="a h:mm:ss" />
									</c:if> <c:if
										test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month || date.date != vo.writeDate.date}">
										<fmt:formatDate value="${vo.writeDate}"
											pattern="yyyy.MM.dd(E)" />
									</c:if> <!-- ${vo.writeDate}  --></td>
								<td align="center">${vo.hit}</td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- 페이지 이동 버튼 -->
					<tr>
						<td colspan="5" align="center">
							<!-- 처음으로 --> <br />
						<c:if test="${contentList.currentPage > 1}">
								<button class="btn btn-outline-dark" type="button"
									title="첫 페이지로 이동합니다." onclick="location.href='?currentPage=1'">처음</button>
							</c:if> <c:if test="${contentList.currentPage <= 1}">
								<button class="btn btn-outline-dark" type="button"
									title="이미 첫 페이지 입니다." disabled="disabled">처음</button>
							</c:if> <!-- 10페이지 앞으로 --> <c:if test="${contentList.startPage > 1}">
								<button class="btn btn-outline-dark" type="button"
									title="이전 10 페이지로 이동합니다."
									onclick="location.href='?currentPage=${contentList.startPage - 1}'">
									이전</button>
							</c:if> <c:if test="${contentList.startPage <= 1}">
								<button class="btn btn-outline-dark" type="button"
									title="이미 첫 10 페이지 입니다." disabled="disabled">이전</button>
							</c:if> <!-- 페이지 이동 --> <c:forEach var="i"
								begin="${contentList.startPage}" end="${contentList.endPage}"
								step="1">

								<c:if test="${contentList.currentPage == i}">
									<button class="btn btn-outline-dark" type="button"
										disabled="disabled">${i}</button>
								</c:if>

								<c:if test="${contentList.currentPage != i}">
									<button class="btn btn-outline-dark" type="button"
										onclick="location.href='?currentPage=${i}'">${i}</button>
								</c:if>

							</c:forEach> <!-- 10페이지 뒤로 --> <c:if
								test="${contentList.endPage < contentList.totalPage}">
								<button class="btn btn-outline-dark" type="button"
									title="다음 10 페이지로 이동합니다."
									onclick="location.href='?currentPage=${contentList.currentPage + 10}'">다음</button>
							</c:if> <c:if test="${contentList.endPage >= contentList.totalPage}">
								<button class="btn btn-outline-dark" type="button"
									title="이미 마지막 10 페이지 입니다." disabled="disabled">다음</button>
							</c:if> <!-- 마지막으로 --> <c:if
								test="${contentList.currentPage < contentList.totalPage}">
								<button class="btn btn-outline-dark" type="button"
									title="첫 페이지로 이동합니다."
									onclick="location.href='?currentPage=${contentList.totalPage}'">마지막</button>
							</c:if> <c:if test="${contentList.currentPage >= contentList.totalPage}">
								<button class="btn btn-outline-dark" type="button"
									title="이미 마지막 페이지 입니다." disabled="disabled">마지막</button>
							</c:if>

						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<!-- Footer -->
	<footer class="text-center text-lg-start bg-light text-muted" >
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
						<h6 class="text-uppercase fw-bold mb-4">
						Customer Service
						</h6><br/>
						<h6 class="text-uppercase fw-bold mb-4">1234-1230</h6>
						<br/><br/>
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
							<a href="https://ko-kr.facebook.com/" class="list-group-item" target="_blank">Facebook</a>
						</p>
						<p>
							<a href="https://www.instagram.com/?hl=ko" class="list-group-item" target="_blank">Instagram</a>
						</p>
						<p>
							<a href="https://twitter.com/?lang=ko" class="list-group-item" target="_blank">Twitter</a>
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


<!-- https://whakscjs.tistory.com/entry/2012513-MVC%ED%8C%A8%ED%84%B4%EC%9D%84-%ED%99%9C%EC%9A%A9%ED%95%9C-%EC%9D%B4%EB%A6%84%EC%9C%BC%EB%A1%9C-%ED%9A%8C%EC%9B%90-%EC%A1%B0%ED%9A%8C%ED%95%98%EA%B8%B0like-%EC%82%AC%EC%9A%A9 -->