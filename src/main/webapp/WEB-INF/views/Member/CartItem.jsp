<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include  file="../includes/header.jsp"%>
<script>
//우편번호 검색 함수
function searchPostCode(){
	new daum.Postcode({
		oncomplete: function(data){
			var fullRoadAddr = data.roadAddress; // 도로명 주소
			var extraRoadAddr = ''; //도로명 조합형 주소 변수
			
			//법정동의 경우 마지막 문자가 "동/로/가"로 끝남
			if(data.bname !== '' 
				&& /[동|로|가]$/g.test(data.bname)){
					extraRoadAddr += data.bname;
			}
			//건물명이 있고, 공동주택일 경우
			if(data.buildingName !== ''
				&& data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			//도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열 
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			//도로명, 지번 주소의 유무에 따라 해당 조합형 주소 추가
			if(fullRoadAddr !== ''){
				fullRoadAddr += extraRoadAddr;
			}
			
			//우폄번호와 주소정보를 해당 필드에 넣기
			$('[name=postCode]').val(data.zonecode);
			$('[name=userAddr1]').val(fullRoadAddr);
			
			document.getElementById('postcode').value = data.zonecode; // 5자리 새우편번호
			document.getElementById('userAddr1').value = fullRoadAddr;
		}
	}).open();
}
</script>
   

        <div class="row">
                <div class="col-lg-12">
                	<div class="jumbotron bg-warning">
                    <h1 class="page-header text-center text-white">장바구니 목록</h1>
                    </div>
                </div>
                 <br>
                 <br>
                 <br>
                <!-- /.col-lg-12 -->
        </div>
      <!-- /.row -->
<!-- 쇼핑몰 페이지당 게시글 6개 씩  2행 3열 그리드  --> 
<!-- 썸네일 700x400 -->
        <div class="col-lg-12">
        <ul>
        <li>
        
        	<div class='allCheck float-left'>
        		<input type="checkbox" name = "allCheck" id = "allCheck" > <label for="allCheck">모두 선택</label>
        		<script>
        			$('#allCheck').click(function(){
        				var check = $('#allCheck').prop('checked');
        				if(check){
        					$('.eachCheck').prop('checked',true);
        				}else{
        					$('.eachCheck').prop('checked',false);
        				}
        			});
        		</script>
        	</div>
        	<div class="allDelete float-right">
        		<button class="btn-danger allDeleteBtn">일괄 삭제</button>
        		<script>
        			$('.allDeleteBtn').click(function(){
        				var token = $("meta[name='_csrf']").attr("content");
        	     	    var header = $("meta[name='_csrf_header']").attr("content");       	        	
        				var deleteCheck = confirm('장바구니 목록이 모두 지워집니다.');
        				if(deleteCheck){        		
        					
        					var checkArr = new Array();
        					$("input[class='eachCheck']:checked").each(function(){
        						checkArr.push($(this).attr('data-cartNum'));
        					});
        					$.ajax({
        						url : "/Member/deleteCart",
        						type : "post",
        						data : { chbox : checkArr },
        						beforeSend : function(xhr){
        		        			 xhr.setRequestHeader(header, token)
        		        		},
        						success : function(result){
        							
        							console.log('data : '+ data);
        							if(result=="delete"){
        								
        							location.href = "/Member/CartItem"
        							}
        							else {
        								alert('장바구니 삭제에 실패했습니다.');
        							}
        						}
        					});
        					
        				}
        			});
        		</script>
        	</div>
        
        </li>
        <hr>
        <br>
        <br>
 <c:set var="sum" value="0"/>
 <c:forEach items="${cartItem}" var = "cartItem">
 <li>
         <div class='checkBox'>
         <input type='checkbox' name='eachCheck' class='eachCheck' data-cartNum='${cartItem.cartNum}'> <label for='eachCheck'>선택</label>
         <script>
         	$('.eachCheck').click(function(){
         		$('#allCheck').prop('checked', false);
         	});
         </script>
         </div>   
            <div class="cartItemThumbnail">            
              <a href="#"><img class="card-img-top" src="${cartItem.gdsImg}" alt=""/></a>
            </div>   
              <div class="cartItemInfo">
              <p>
                <span>
                  상품명 : ${cartItem.gdsName}
                </span><br>
                
                <span>상품 가격 : <fmt:formatNumber value="${cartItem.gdsPrice}" pattern="###,###,###"/>원 </span><br>
                <span>구입 수량 : ${cartItem.cartStock} 개</span><br>
                <span>총 가격 : <fmt:formatNumber value="${cartItem.gdsPrice * cartItem.cartStock}" pattern="###,###,###"/>원</span><br>
                <span>장바구니에 추가한 날짜 : <fmt:formatDate value="${cartItem.addDate}" pattern="yyyy-MM-dd"/></span>
              </p>
              </div>
         
              <div class="card-footer">
                <button class="delete${cartItem.cartNum}Cart btn btn-danger"  data-cartNum='${cartItem.cartNum }'>장바구니 삭제하기 </button>
                <script>
  					$(".delete${cartItem.cartNum}Cart").click(function(){
  						var confirmCheck = confirm('선택하신 물픔을 장바구니에서 삭제하시겠습니까?');
  						var token = $("meta[name='_csrf']").attr("content");
  			     	    var header = $("meta[name='_csrf_header']").attr("content");
  			        	
  						if(confirmCheck){
  							var checkArr = new Array();
  							checkArr.push($(this).attr('data-cartNum'));
  							var data = { chbox : checkArr };
  							$.ajax({
  								url : "/Member/deleteCart",
        						type : "post",
        						data : data,
        						beforeSend : function(xhr){
        		        			 xhr.setRequestHeader(header, token)
        		        		},
        						success : function(result){
        							if(result=="delete"){
        							alert('선택하신 상품이 장바구니에서 삭제되었습니다.');	
        							location.href = "/Member/CartItem"
        							}
        							else {
        								alert('장바구니 삭제에 실패했습니다.');
        							}
        						}
  							});
  						}
  					});
 			    </script>	
              </div>
          
                  
          
 </li>         
 	<hr>
 	<br>
 	<br>
 	<c:set var="sum" value="${sum + (cartItem.cartStock * cartItem.gdsPrice) }"/>
 </c:forEach>         
       	</ul>  
       	<!-- 상품 정보 및 주문하기 --> 
   <div class='col-lg-12'>
   	<div class="listResult p-5 m-3 bg-warning">
 		<div class="sum float-left">
  			<h3 class="text-light">상품금액 총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원</h3>
 		</div>
   		<div class="orderInput float-right">
  			<button type="button" class="btn btn-outline-secondary orderInfoOpenBtn" style='padding:5px 10px;' ><h4>주문 정보 입력하기  </h4></button>
  			<script>
  				$('.orderInfoOpenBtn').click(function(){				
  					$('.orderInfo').slideDown();
  					$('.orderInfoOpenBtn').slideUp();
  				});
  			</script>
   		</div>
  	</div>
  	<div class='orderInfo' style='display:none;'>
  	<form role="form" method='post'>
                            <fieldset>
                            	<input type='hidden' name="${_csrf.parameterName }" value="${_csrf.token}">
                            	<input type='hidden' name='amount' value='${sum}'>
                                
                                <div class="form-group">
                                	
                                <div class="form-group">
                                	<label for="name">수령인</label>
                                    <input class="form-control" placeholder="수령인 성함을 정확히 기입해주세요." id="orderRec" name="orderRec" type="text" required="required">
                                	
                                </div>
                          
                                
                                <div class="form-group">
                                	<label for="phone">연락처</label>
                                    <input class="form-control" placeholder="연락처를 정확히 기입해주세요." id="orderPhone" name="orderPhone" type="text" required="required">
                                	
                                </div>
                                <!-- 우편번호 검색  -->
                                <div class="form-group">
                                	<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호"
                                	name = "postCode" id="postCode" type="text" readonly="readonly">
                                	<button type="button" class="btn btn-success" onclick="searchPostCode();"><i class="fa fa-search"></i>우편번호 검색</button>
                                </div>
                                <!-- 도로명 주소 검색 -->
                                <div class="form-group">
                                	<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
                                	name = "userAddr1" id="userAddr1" type="text" readonly="readonly">
                                </div>
                                 <!-- 상세주소 입력  -->
                                <div class="form-group">
                                	<input class="form-control" style="top: 5px;" placeholder="상세 주소"
                                	name = "userAddr2" id="userAddr2" type="text" required="required">                             	
                                </div>
                                <div class="form-group text-center">
                                	<button type="submit" class="btn btn-warning">주문하기</button>
                                	<button type="button" class="btn btn-danger order_cancle">취소하기</button>
                                	<script>
                                	$('.order_cancle').click(function(){
                                		$('.orderInfo').slideUp();
                                		$('.orderInfoOpenBtn').slideDown();
                                	});
                                	</script>
                                </div>    
                            </fieldset>
                            
                        </form>
  	</div>
  </div>    
        </div>
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
     
      
     				  
  <%@include file="../includes/footer.jsp" %>
  
	

   
   
	
	
