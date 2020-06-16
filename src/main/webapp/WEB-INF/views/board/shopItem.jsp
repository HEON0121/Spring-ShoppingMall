<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<%@ include file="../includes/header.jsp" %>

<script>
//상품리뷰 리스트 출력 함수  
function reviewList(){

var gdsNum = ${goods.gdsNum};

$.getJSON("/board/shopItem/reviewList" + "?goodsNum=" + gdsNum, function(data){
	   var str = "";
	  
	   $(data).each(function(){
		   
		   //console.log(data);
		   var reviewDate = new Date(this.reviewDate);
		   reviewDate = reviewDate.toLocaleDateString("ko-US");
		   
		   str += "<div data-gdsNum='"+this.gdsNum+"'>"
		   		+ "<p>"+this.reviewCon+"</p>"
		   		+ "<small class='text-muted' > Posted by "+"<strong>"+this.userId+"</strong>"
		   		+ " on "+reviewDate+"</small> "
		   		+ "<sec:authorize access='isAuthenticated()'>"
		   		+ "<div class='float-right'>"
		   		+ "<button class='btn btn-info' data-reviewNum='"+this.reviewNum+"' id='reviewModify'><small>리뷰 수정하기</small></button>"
		   		+ "<button class='btn btn-outline-danger' data-reviewNum='"+this.reviewNum+"' id='reviewDelete'><small>리뷰 삭제하기</small></button>"
	   			+ "</div> </sec:authorize><hr>"
		   		
	   });
	   $('#reviewList').html(str);
});  
};

</script>
<!-- 상품이미지 900x400 -->
	
       <div class="card mt-4">
    	<form role='form' method='post' id='shopItem_form'>
		<input type='hidden' name="${_csrf.parameterName }" value="${_csrf.token}">
		<input type="hidden" value="${goods.gdsNum}" name="gdsNum">    
          <img class="card-img-top img-fluid" src="${goods.gdsImg}" alt="">
          <div class="card-body">
            <h3 class="card-title">상품명 : ${goods.gdsName }</h3><br>
            <h4>판매가 : <fmt:formatNumber value="${goods.gdsPrice}" pattern = "###,###,###"/>원</h4>
            <p>현재 재고 : ${goods.gdsStock} </p><br>
            <p class="card-text">${goods.gdsInfo}</p>
            
            <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span><br>
            <span> 등록 날짜 : <fmt:formatDate value="${goods.gdsDate }" pattern = "yyyy-MM-dd"/> </span>
          </div>
          <sec:authorize access="hasRole('ROLE_ADMIN')">
          <div class="card-footer">
          	<button type = "button" id = "updateBtn" class= "btn btn-primary">수정</button>
          	<button type = "button" id = "deleteBtn" class= "btn btn-danger">삭제</button>         
          </div>
          </sec:authorize>          
        </form>
        <hr>
        <!-- 로그인 된 member 사용자들에 한해서 장바구니 버튼 보이기  -->
        <sec:authorize access="hasRole('ROLE_MEMBER')">
        <div class="col-sm-12">
        <c:if test='${goods.gdsStock != 0 }'>
            <p class="card-text">
            <span> &nbsp;&nbsp;&nbsp;&nbsp;구입 수량&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <button type="button" class="plus"> + </button>
            <input type="number" class="stockBox" min="0" max="${goods.gdsStock}" value="0" readonly="readonly"/>
            <button type="button" class="minus"> - </button>
            </p>
        
        <p class="addToCart">
        <a href="#" class="addItemToCart">
        <img src="https://img.icons8.com/carbon-copy/100/000000/favorite-cart.png"/>장바구니에 담기</a>
      
        <script>  
        	
        	// 카 버튼 관련 함수 (+ - 버튼)
            $(".plus").click(function(){
            	var num = $('.stockBox').val();
            	var plusNum = Number(num) + 1;
            	
            	if(plusNum >= ${goods.gdsStock}){
            		$('.stockBox').val(num);
            	}else{
            		$('.stockBox').val(plusNum);
            	}
            });
            $(".minus").click(function(){
            	var num = $('.stockBox').val();
            	var minusNum = Number(num) - 1;
            	
            	if(minusNum < 0){
            		$('.stockBox').val(num);
            	}else{
            		$('.stockBox').val(minusNum);
            	}
            });
        
        $('.addItemToCart').click(function(){
        	var token = $("meta[name='_csrf']").attr("content");
     	    var header = $("meta[name='_csrf_header']").attr("content");
        	
     	    var yes = confirm('상품을 장바구니에 담으시겠어요 ?');
        	if(yes){
        	var gdsNum = ${goods.gdsNum};
        	var cartStock = $('.stockBox').val();
        	
        	var data = {
        			gdsNum : gdsNum,
        			cartStock : cartStock
        	}
        	$.ajax({
        		url : "/board/shopItem/addCart",
        		type : "post",
        		data : data,
        		beforeSend : function(xhr){
        			 xhr.setRequestHeader(header, token)
        		},
        		success : function(result){
        			var resultNumber = JSON.parse(JSON.stringify(result));
        			console.log(data);
        			if(resultNumber != null){
        			alert('상품을 장바구니에 추가했습니다.');
        			$('.stockBox').val("0");
        			return;
        			}
        			
        			else{
        			alert('로그인 상태를 확인해주세요.');
        			$('.stockBox').val("0")
        			location.href="/customLogin"; 
        			return;
        			} 
        		},
        		error : function(){
        			alert('장바구니에 상품을 넣는데 실패했어요..');
        		}
        	});
        	}else{return;}
        });
        
       
        </script>
        </p>
        </c:if>
        <c:if test='${goods.gdsStock == 0 }'>
        <p>재고 준비 중입니다. 조금만 기다려주세요, 감사합니다.</p>
        </c:if>
        </div>
        </sec:authorize>
        
        <sec:authorize access="isAnonymous()">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/customLogin">로그인</a> 후 리뷰를 작성하실 수 있습니다.</p>
        </sec:authorize>
        
        <!-- 로그인 된 사용자들에 한해서 댓글 리뷰 작성 가능  -->
        <sec:authorize access="isAuthenticated()">	       
        
        <div class="container">
        
        
         <form method='post' id ='review_form' autocomplete='off'>
        	
        	<input type="hidden" value="${goods.gdsNum}" name="gdsNum" id="gdsNum">         
        	<textarea class="form-control col-sm-12" rows="10" id="reviewCon" name="reviewCon"></textarea>       
       		       	
          	<button type = "button" id ="replyBtn" class="btn btn-success col-sm-12">상품평 올리기</button>
          	
		 </form> 
		 
        </div>
        
        </sec:authorize> 
       </div>
       
       
       
       
    	
    	
       
        <!-- /.card -->
		<!-- /.Post -->					
        <div class="card card-outline-secondary my-4">
          <div class="card-header">
            Product Reviews
          </div>
          <!-- 댓글목록 -->
          
          <div class="card-body" id='reviewList'>
  
        <%-- <c:forEach items="${reviews}" var="reviews">  
            <p>${reviews.reviewContent}</p>
            <small class="text-muted">Posted by ${reviews.userId} on<fmt:formatDate value="${reviews.reviewDate}" pattern="yyyy-MM-dd"/></small>
            <hr>            
                    
          </c:forEach>  --%>
         <script>
         reviewList();
         </script>
          </div>
           <a href="/" class="btn btn-success">Leave a Post</a> 
        </div>
        <!-- /.card -->
        

   <%@ include file="../includes/footer.jsp"%>
   <script>
   $(document).ready(function(){
	
   
   //관리자 권한 영역 // 업데이트 및 삭제 
   var form = $('#shopItem_form');
   $('#updateBtn').on('click',function(e){
	   form.attr('action', '/admin/goods/modify');
	   form.attr('method','get');
	   form.submit();
	  // location.href="/admin/goods/view?goodsNum="+${goods.gdsNum};
   });
   $('#deleteBtn').on('click', function(e){
	   var deleteCheck = confirm('게시글을 삭제하시겠어요?');
	   if(deleteCheck) {
		   form.attr('action','/admin/goods/delete');
		   form.attr('method','get');
		   form.submit();
		   alert('게시글이 삭제되었습니다.');
	   }else{
		   return;
	   }
   });
   
// 일반 사용자 상품 리뷰 
   $('#replyBtn').click(function(){
	 
	   var token = $("meta[name='_csrf']").attr("content");
	   var header = $("meta[name='_csrf_header']").attr("content");
	   var review_form = $('#review_form');
	   var gdsNum = $('#gdsNum').val();
	   var reviewCon = $('#reviewCon').val();
	   
	   var data = {
			   gdsNum : gdsNum,
			   reviewCon : reviewCon
	   };
	   var reviewCheck = confirm('상품리뷰가 등록됩니다.');
	   
	   if(reviewCheck) {   
		   if(!$('#reviewCon').val()){
			   confirm('리뷰 내용을 작성해주세요! ');
			   return;
		   }
	
	   $.ajax({
		   url : "/board/shopItem/registerReview",
		   type : "post",
		   data : data,
		   beforeSend : function(xhr){
			   xhr.setRequestHeader(header, token)
		   },
		   success : function(){
			   reviewList();
			   $('#reviewCon').val('')
		   },
		   error : function(xhr, status, e) {
               console.error(status + " : " + e);
           }
	   });   
	   }else{
		   return;
	   }
   });
 //댓글 삭제 // html코드  동적으로 생성했으므로 click말고 on 함수 사용 
 $(document).on("click", "#reviewDelete", function(){
	 
	 var deleteReviewCheck = confirm('리뷰를 삭제하시겠어요?');
 
	if(deleteReviewCheck){
		 var token = $("meta[name='_csrf']").attr("content");
		 var header = $("meta[name='_csrf_header']").attr("content");
		 var data = 
		 {reviewNum : $(this).attr("data-reviewNum")};
		 console.log("data : " + data);
 $.ajax({
	url : "/board/shopItem/deleteReview",
	type : "POST",
	data : data,
	beforeSend : function(xhr){
		   xhr.setRequestHeader(header, token)
	   },
	success : function(result){
			
		if(result == "Delete"){
			alert('댓글이 삭제됩니다. ');
			reviewList();
			return;
		}else {		
			alert('본인 댓글만 삭제할 수 있습니다.');
			return;
		}
	},
	error : function(){
		alert('로그인 상태를 확인해 주세요! ');
	}
 });
 }else{
	 return;
	 }
});  
 
 //댓글 수정 버튼 눌렀을때 
 $(document).on('click', '#reviewModify', function(e){
	 e.preventDefault();
	 $('#reviewUpdateModal').modal('show');
 }); 
 

   });
   </script>