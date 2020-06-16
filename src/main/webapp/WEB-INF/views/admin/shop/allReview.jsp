<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include  file="../includes/admin_header.jsp"%>

   
		<div class="row">
                <div class="col-lg-12">
                	<div class="jumbotron bg-warning">
                    <h1 class="page-header text-center text-white">회원 댓글 관리</h1>
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
        			<c:forEach items="${allReview}" var = "allReview">
        				<li style='border:10px solid #eee; margin-bottom:20px;'>
        				<div class='reviewInfo' style='background:#eee; padding:10px; font-size=20px;'>
        					<p><span style ='font-weight:bold; margin-right:10px;'> 상품 </span><a href = "/board/shopItem?goodsNum=${allReview.gdsNum}">바로 가기</a></p>
        					<p><span style='font-weight:bold; margin-right:10px;'>작성자</span>${allReview.userId}</p>
        					<p><span style='font-weight:bold; margin-right:10px;'>작성일</span><fmt:formatDate pattern="yyyy-MM-dd" value="${allReview.reviewDate}" /></p>
        				</div>
        				<div class='reviewContent' style='padding:10px;'>	
        					<p><span style='font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;'>내용</span>${allReview.reviewCon}</p>       					  					
        				</div>
        				<div class='reviewRmv' style='text-align:right; padding:10px;'>        						
        					<input type='hidden' value='${allReview.reviewNum}' name= 'reviewNum'>
        					<button class='btn btn-outline-danger deleteReviewBtn' data-reviewNum = '${allReview.reviewNum}'>리뷰 삭제하기 </button>
        					<script>
        					$('.deleteReviewBtn').click(function(){
        						var delCheck = confirm('리뷰를 삭제 하시겠어요 ?');
        						if(delCheck){
        							var token = $("meta[name='_csrf']").attr("content");
        							var header = $("meta[name='_csrf_header']").attr("content");
        							var data = {reviewNum : $(this).attr('data-reviewNum')}
        							console.log(data);
        							console.log()
        							$.ajax({
        								url : '/admin/deleteReview',
        								type : 'post',
        								data : data,
        								beforesend : function(xhr) {
        									xhr.setRequestHeader(header, token)
        								},
        								success : function(auth){
        									if(auth=='admin'){
        									alert('댓글이 삭제 됩니다.');
        									return;
        									}else{
        									alert('로그인 상태를 확인해주세요. 관리자만 댓글을 삭제 할 수 있습니다.');
        									}
        								},error : function (){
        									alert('연결을 확인해 주세요 .');
        									return;
        								}
        								
        							});
        							
        						}else{
        							return;
        						}
        						
        					});
        						
        					</script>
        				
        				</div>
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