<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
     String userID = (String)session.getAttribute("userID"); 
     String userPassword = (String)session.getAttribute("userPassword");
%> <!-- 세션에 저장된 로그인 정보 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY TRIP</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
   .nav-left{
     background-color: #f8f9fa;
   width: 15em;
   height: 31em;
   list-style-type: none;
   margin: 3em 0;
   }
.container-pos{
   width: 18em;
}
#container{
   margin-top: 50px;
}
   h5 {
      font-weight: 400;
      margin-left: 0.5em;
   }
   
   h6 {
      font-weight: 400;
      margin-left: 0.5em;
   }
  
   li a{
      display: block;
      color: #000000;
      padding: 8px;
      margin-left: 0.5em;
      text-decoration: none;
   }

   li a:hover{
      background-color: gray;
   }

</style>
<script type="text/javascript">
   function passwordCheckFunction() {
      let userPassword = '<%=(String)session.getAttribute("userPassword")%>';
      let originalPassword = document.getElementById('originalPassword').value;
      let userPassword1 = document.getElementById('userPassword1').value;
      let userPassword2 = document.getElementById('userPassword2').value;
      console.log(originalPassword)
      console.log(userPassword1)
      console.log(userPassword2)
       
      if (userPassword == originalPassword) {
         $('#passwordCheckMessage1').html('')
      } else {
         $('#passwordCheckMessage1').html('기존 비밀번호와 일치하지 않습니다.')
      }
      
      if (userPassword1 == userPassword2) {
         $('#passwordCheckMessage2').html('')
      } else {
         $('#passwordCheckMessage2').html('새 비밀번호가 일치하지 않습니다.')
      }
   }
   
   function changePassword() {
      // ajax를 이용해서 테이블에 저장할 데이터를 얻어온다.
      let userID = '<%=(String)session.getAttribute("userID")%>';
      let userPassword = '<%=(String)session.getAttribute("userPassword")%>';
      let originalPassword = document.getElementById('originalPassword').value;
      let userPassword1 = document.getElementById('userPassword1').value;
      let userPassword2 = document.getElementById('userPassword2').value;
      //console.log(userPassword, originalPassword, userPassword1, userPassword2)
      // jQuery ajax
      $.ajax({
         type: 'POST',
         url: './ChangePassword',
         data: {
            userID: userID,
            userPassword: userPassword,
            originalPassword: originalPassword,
            userPassword1: userPassword1, 
            userPassword2: userPassword2,            
         },
         success: response => {
            console.log('요청성공: ', response);
            
            switch (response) {
            case '1':
               $('#messageType').html('에러메시지');
               $('#messageContent').html('모든 내용을 입력하세요.');
               $('#messageCheck').attr('class', 'modal-content panel-warning');
               console.log('switch 1로 진입성공')
               break;
            case '2':
               $('#messageType').html('에러메시지');
               $('#messageContent').html('기존 비밀번호를 바르게 입력하세요.');
               $('#messageCheck').attr('class', 'modal-content panel-danger');
               break;
            case '3':
               $('#messageType').html('에러메시지');
               $('#messageContent').html('변경 할 비밀번호가 일치하지 않습니다.');
               $('#messageCheck').attr('class', 'modal-content panel-danger');
               break;
            case '4':
               $('#messageType').html('성공메시지');
               $('#messageContent').html('비밀번호 변경에 성공했습니다.');
               $('#messageCheck').attr('class', 'modal-content panel-success');
               break;
            case '5':
               $('#messageType').html('에러메시지');
               $('#messageContent').html('비밀번호 변경에 실패했습니다.');
               $('#messageCheck').attr('class', 'modal-content panel-info');
               break;
         }
         $('#messageModal').modal('show');
         },
         error: error => {
            console.log('요청실패: ', error.status);
         }
      });
   }
   
     $('#closeModalBtn').on('click', function(){
        $('#modalBox').modal('hide'); 
     });
</script>

</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container px-4 px-lg-5">
         <a class="navbar-brand" href="./index1.nhn" style="margin-right:30px;">MY TRIP</a>
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
         <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" style="text-align:center;">
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
<!-- 마이페이지 틀 만들고, form태그로 경로 지정. myContentView.nhn -->
<div class="container-fluid">
   <div class="row content">
      <div class="col-sm-3 sidenav container-pos">
         <ul class="nav-left">
           <h6 style="padding-top:15px;">${userID}</h6>
           <li><a href="logout.nhn">로그아웃</a></li><br/>
            <h5>My Account</h5>
            <li><a href="mypageView.nhn">회원정보수정</a></li>
            <li><a href="#!">여행지 수정</a></li><br/>
            <li>
               <form action="myContentResGo.nhn">
                  <input type="hidden" id="idx" name="userID" value="${userID}"/>
                  <!--<input type="text" id="userID" name="userID" value="${userID}">-->
                  <input type="submit" value="내 컨텐츠 주문내역">
               </form>
           </li>
            <h5>My Order</h5>
            <li>
               <form action="reservationGo.nhn">
              <input type="hidden" id="idx" name="userID" value="${userID}"/>
               <!-- <input type="text" id="userID" name="userID" value="${userID}"> -->
               <input type="submit" value="주문 내역 조회">
               </form>
           </li>
            <li><a href="#">상품 리뷰</a></li><br/>
            <h5>Customer Service</h5>
            <li><a href="#">상품 문의</a></li>
           </ul>
         </div>


      <div class="col-sm-9" id="container">
      <form>
        <h4><small>회원정보수정</small></h4>
            <hr>
            <h2>회원정보</h2>
            <div class="table-responsive">          
              <table class="table">
                  <tr>
                    <th>이메일</th>
                     <td>${userID}</td>
                     <td></td>
                  </tr>
                  <tr>
                       <th>현재 비밀번호 입력</th>
                     <td><input class="form-control" 
                               type="password" 
                               id="originalPassword" 
                               name="originalPassword" 
                               tabindex="2" 
                               placeholder="비밀번호를 입력하세요"
                               onkeyup="passwordCheckFunction()"
                               ></td>   
                  </tr>
                  <tr>
                       <th>새로운 비밀번호 입력</th>
                     <td><input class="form-control" 
                              type="password" 
                              name="userPassword1" 
                              id="userPassword1" 
                              tabindex="2" 
                              placeholder="새로운 비밀번호를 입력하세요"
                               onkeyup="passwordCheckFunction()"                              
                              ><td>
                  <tr>
                  <tr>
                       <th>비밀번호 입력 확인</th>
                     <td><input class="form-control" 
                               type="password" 
                               name="userPassword2" 
                               id="userPassword2" 
                               tabindex="2" 
                               placeholder="비밀번호 입력확인"
                               onkeyup="passwordCheckFunction()"                               
                               ></td>
                  <tr>
                    <th>닉네임</th>
                    <td>${nickname}</td>
                  </tr>
                 <tr>
                    <td>
                       <h5 id="passwordCheckMessage1" style="color: red; font-weight: bold;"></h5>
                       <h5 id="passwordCheckMessage2" style="color: red; font-weight: bold;"></h5>
                     <!-- 오류 메시지가 출력될 영역 --> 
                        <th><input type="button" tabindex="2" class="btn btn-outline-dark" value="업데이트 하기" onclick="changePassword()"></th>
                    </td>
                  <tr>
              </table>
           </div>
         </div>
      </form>
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

<!-- 모달창 -->
   <div id="messageModal" class="modal fade" role="dialog" aria-hidden="true">
      <div class="vertical-alignment-helper">
         <div class="modal-dialog vertical-align-center">
            <div>
                  <!-- messageType id 추가 -->
                  <div id="messageCheck">
                  <div class="modal-header panel-heading">
                     <!-- messageType id 추가 -->
                     <h4 id="messageType" class="modal-title"></h4>
                  </div>   
                  <!-- messageType content 추가 -->
                  <div id="messageContent" class="modal-body"></div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-default" id="closeModalBtn">확인</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- 로그인 메시지 모달 창 -->
</body>
</html>