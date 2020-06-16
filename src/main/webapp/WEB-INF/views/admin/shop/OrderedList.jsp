<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include  file="../includes/admin_header.jsp"%>

   
		<div class="row">
                <div class="col-lg-12">
                	<div class="jumbotron bg-warning">
                    <h1 class="page-header text-center text-white">회원 주문 상품 목록</h1>
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
        		<ol class = "orderedList">
        			<c:forEach items="${orderedList}" var = "orderedList">
        				<li style='border:5px solid #eee; padding:10px 20px; margin-bottom:20px;'>
        					<p><span style ='font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;'>주문 번호</span><a href = "/admin/shop/OrderedView?orderId=${orderedList.orderId}">${orderedList.orderId}</a></p>
        					<p><span style='font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;'>주문인</span>${orderedList.userId}</p>
        					<p><span style='font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;'>수령인</span>${orderedList.orderRec}</p>
        					<p><span style='font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;'>주소</span>${orderedList.postCode} ${orderedList.userAddr1} ${orderedList.userAddr2}</p>
        					<p><span style='font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;'>가격</span><fmt:formatNumber pattern='###,###,###' value='${orderedList.amount}'/>원 </p>
        					<p><span style='font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;'>배송 상태</span>${orderedList.deliveryStatus}</p>
        					
        				</li>
          				
 					</c:forEach>   
        		</ol>
        	</section>
        </div>
       
          
        </section>
        <!-- /.section -->
        
      </div>
      <!-- /.col-lg-9 -->

  <%@include file="../includes/admin_footer.jsp" %>