<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include  file="../includes/admin_header.jsp"%>

   

<br>        
 			<div class="row">
                <div class="col-lg-12">
                	<div class="jumbotron bg-primary">
                    <h1 class="page-header text-center text-white">shopItem Update</h1>
                    </div>
                </div>
                 <br>
                 <br>
                 <br>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading text-danger">
                            상품 수정
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                            <form role="form" action="/admin/goods/modify" method="post" enctype="multipart/form-data"> 
                            <input type='hidden' name="${_csrf.parameterName }" value="${_csrf.token}">
                            <input type="hidden" value = "${goods.gdsNum }" name="gdsNum">
                            	<div class="form-group text-success">
                            		<label>상품 카테고리</label> 
                            		<select name="cateName" id="cateName">
                            		<c:forEach items="${category}" var="category"> 
                            			<option value="${category.cateName}">${category.cateName}</option>
                            		</c:forEach>
                            		</select>
                            	</div>
                            	<div class="form-group text-success">
                            		<label>상품 카테고리 코드</label> 
                            		<select name="cateCode" id="cateCode">  		
                            		<option value="100">운동식품(100)</option>
                            		<option value="200">운동의류(200)</option>
                            		<option value="300">운동기구(300)</option>                    		
                            		</select>
                            	</div>
                            	<div class="form-group text-success">
                            		<label>상품명</label> <input class="form-control" name="gdsName" value="${goods.gdsName}">
                            	</div>
                            	<div class="form-group text-success">
                            		<label>상품가격</label> <input class="form-control" name="gdsPrice" value="${goods.gdsPrice }">
                            	</div>
                            	<div class="form-group text-success">
                            		<label>상품재고</label> <input class="form-control" name="gdsStock" value="${goods.gdsStock }">
                            	</div>
                            	<div class="form-group text-success">
                            		<label>상품이미지</label> <br>
                            		<input type="file" name="file" id="gdsImg">
                            		<div class="select_img">
                            			<img src="${goods.gdsImg}"/>
                            			<input type="hidden" name="gdsImg" value="${goods.gdsImg}">
                            			<input type="hidden" name="gdsThumbnail" value="${goods.gdsThumbnail}">
                            		</div>
                            		<script>                
                            		$('#gdsImg').change(function(){
                        				if(this.files && this.files[0]){
                        					var reader = new FileReader;
                        					reader.onload = function(data) {
                        						$(".select_img img").attr("src", data.target.result).width(500);
                        						
                        					}
                        					reader.readAsDataURL(this.files[0]);
                        				}
                        			});
                            		</script>
                            		<label>파일 경로</label><br> 
                            		<%= request.getRealPath("/") %>
                            	</div>
                            	<!-- <div class="form-group text-warning">
                            		<label>파일</label> <input class="form-control-file" name="file" type="file">
                            	</div> -->
                            	<div class="form-group text-success">
                            		<label>상품설명 </label>
                            		<textarea class="form-control" rows="3" name="gdsInfo" value="${goods.gdsInfo }"></textarea>
                            	</div>
                            
                            	
                            	<button type="submit" class="btn btn-success">등록하기</button>
                            	<button type="button" class="btn btn-warning text-white">돌아가기</button>
                            </form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            

  <%@include file="../includes/admin_footer.jsp" %>
	
  <script>
  
  $(".btn-warning").click(function(){
	  location.href="/board/shopItem?goodsNum="+${goods.gdsNum};
	  //or 
	  //history.back();
  });
  
  
  </script>
   
	
	
