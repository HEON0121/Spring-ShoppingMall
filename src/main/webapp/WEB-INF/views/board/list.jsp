<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include  file="../includes/header.jsp"%>
<style>
/* .card-img-top {height:400px;}  */
</style>
   

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
          <!-- 900x350 -->
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="https://metree.co.kr/index/_upload/goods/main_1_1329.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="https://metree.co.kr/index/_upload/banner/2020/05/25/main_1_140.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="https://metree.co.kr/index/_upload/banner/2020/05/22/main_1_136.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
<!-- 쇼핑몰 페이지당 게시글 6개 씩  2행 3열 그리드  --> 
<!-- 썸네일 700x400 -->
        <div class="row">
 <c:forEach items="${goods}" var = "goods">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="${goods.gdsImg }" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="/board/shopItem?goodsNum=${goods.gdsNum}">상품명 : ${goods.gdsName}</a>
                </h4>
                <h5>가격 : <fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/> </h5>
                <p class="card-text">${goods.gdsInfo}</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">Update Date : </small>
                <small><fmt:formatDate value="${goods.gdsDate}" pattern="yyyy-MM-dd"/></small>
              </div>
          
            </div>       
          </div>
 </c:forEach>         
          
        </div>
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
     				  <!-- 페이징 자바스크립트 전처리 + 클릭이벤트 히든 액션폼  -->
            			<form id = 'actionForm' action="/board/list" method = 'get'>
            				<input type='hidden' name='pageNum' value=''>
            				<input type='hidden' name='amount' value=''>
            			</form>

  <%@include file="../includes/footer.jsp" %>

 			 <!-- 등록 버튼 눌렀을 시 이벤트 처리 -->
	<!-- 모달 창 보여주기 -->
	

   
   
	
	
