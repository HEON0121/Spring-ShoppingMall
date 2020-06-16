<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include  file="../includes/admin_header.jsp"%>

   
		<div class="row">
                <div class="col-lg-12">
                	<div class="jumbotron bg-warning">
                    <h1 class="page-header text-center text-white">회원 주문 상품</h1>
                    </div>
                </div>
                 <br>
                 <br>
                 <br>
                <!-- /.col-lg-12 -->
        </div>
        <section id="container">
        <div id="container_box">
        	<section id="content">
        		<div class = "orderedView">
        			<c:forEach items="${orderedView}" var = "orderedView">
        				<div style='border:5px solid #eee; padding:10px 20px; margin-bottom:20px;'>        					
        					<p><span style='font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;'>주문번호</span>${orderedView.orderId}</p>
        					<p><span style='font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;'>주문인</span>${orderedView.userId}</p>
        					<p><span style='font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;'>수령인</span>${orderedView.orderRec}</p>
        					<p><span style='font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;'>주소</span>${orderedView.postCode} ${orderedView.userAddr1} ${orderedView.userAddr2}</p>
        					<p><span style='font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;'>가격</span><fmt:formatNumber pattern='###,###,###' value='${orderedView.amount}'/>원 </p>
        					<p class='deliveryStatus'><span style='font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;'>배송 상태</span>${orderedView.deliveryStatus}</p>
        					
        					<div class='deliveryChange' style='text-align:right' >
        						<form method='post' class='deliveryForm'>
        							<input type='hidden' name="${_csrf.parameterName }" value="${_csrf.token}">
        							<input type='hidden' value='${orderedView.orderId }'>
        							<input type='hidden' class='deliveryStatus' name = 'deliveryStatus' value=''>        							
        						<button class='btn btn-secondary del1'>배송 중</button>
        						<button class='btn btn-success del2'>배송 완료</button>
        						<script>
        							$('.del1').click(function(){
        								$('.deliveryStatus').val('배송 중 ');
        								$('.deliveryForm').submit();
        								alert('상품 배송중 ');
        							});
        							$('.del2').click(function(){
        								$('.deliveryStatus').val('배송 완료');
        								$('.deliveryForm').submit();
        								alert('상품 배송 완료');
        							});
        							
        						</script>
        						</form>
        					</div>
        				</div>
          				
 					</c:forEach>   
        		</div>
        	</section>
        </div>     
        </section>
        <!-- /.section -->
        <c:forEach items='${orderedView}' var='orderedView'>
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="${orderedView.gdsImg }" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="/board/shopItem?goodsNum=${orderedView.gdsNum}">상품명 : ${orderedView.gdsName}</a>
                </h4>
                <h4>가격 : <fmt:formatNumber pattern="###,###,###" value="${orderedView.gdsPrice}" />원 </h4>
   
                <h4>구입 수량 : ${orderedView.cartStock} 개</h4>
                
                <h4>최종가 : <fmt:formatNumber pattern="###,###,###" value="${orderedView.cartStock * orderedView.gdsPrice }" />원 </h4>
              </div>
              <div class="card-footer">
                <small class="text-muted">구입 날짜 : </small>
                <small><fmt:formatDate value="${orderedView.orderDate}" pattern="yyyy-MM-dd"/></small>
              </div>
          
            </div>       
         </div>
         </c:forEach>
      </div>
      <!-- /.col-lg-9 -->

  <%@include file="../includes/admin_footer.jsp" %>