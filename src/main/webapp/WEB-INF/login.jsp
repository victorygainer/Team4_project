<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
		html, body {
		    margin: 0;
		    padding: 0;
		    height: 100%;
		}
		nav{
			margin-bottom: 50px;
		}
		#wrap{
		    position: relative;
		    padding-bottom: 50px;
		    margin:auto;
		    text-align:center;
		}
		footer{
			position: relative;
			bottom: 0;
		}
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
		@keyframes scaleImage {
		    100% {
		        transform: scale(1);
		    }
		}
		@keyframes fadeInText {
		    100% {
		        opacity: 1;
		    }
		}
    </style>
<title>MY TRIP</title>
</head>
<body>
<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="./index1.nhn" style="margin-right:30px;">MY TRIP</a>
                	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
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
                 			   <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" style="float: right">
                    			<li class="btn btn-light"></li>
                   				 </ul>
                    
              
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit" style="margin: 10px">
                           <a href="./login.nhn" style="text-decoration:none; color:black;">로그인</a>
                        </button>
                       <button class="btn btn-outline-dark" type="submit" style="margin: 10px">
                            <a href="./register.nhn" style="text-decoration:none; color:black;">회원가입</a>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        
	<!-- main -->
	<div class="container" id="wrap" >
		<div class="panel-body">
			<div class="row">
				<div class="col-lg-12">
					<form id="login-form" action="loginOK.nhn" method="post"
						role="form" style="display: inline-block; ">
						<div class="nav nav-pills nav-justified mb-3" id="ex1"
							role="tablist">
							<div class="nav-item" role="presentation">
								<a href="./login.nhn" class="nav-link active" id="tab-login"
									data-mdb-toggle="pill"
									style="background-color: #173B0B; width: 500px;">로그인</a>
							</div>
						</div>
						
						<div class="form-outline mb-4">
							<label class="form-label" for="loginName" >이메일</label> 
							<input
								type="text" name="userID" id="userID" tabindex="1"
								class="form-control" placeholder="아이디(이메일)를 입력하세요" value=""
								style="width: 500px" />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label" for="loginPassword">비밀번호</label> <input
								type="password" name="userPassword" id="userPassword"
								tabindex="2" class="form-control" placeholder="비밀번호를 입력하세요"
								style="width: 500px" />
						</div>
						<div>
							회원이 아니신가요? <a href="register.nhn" id="register-form-link"
								style="text-decoration: none; color: black; font-weight: bold">회원가입</a>
						</div>
						<br />
						<div class="form-group">
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3">
									<input class="btn btn-outline-dark" type="submit" value="로그인"
										style="width: 500px; border-radius: 50px"/>
								</div>
							</div>
						</div>
					</form>
					
				</div>
			</div>
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









