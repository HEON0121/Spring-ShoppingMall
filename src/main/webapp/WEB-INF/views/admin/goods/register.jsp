<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include  file="../includes/admin_header.jsp"%>
<!-- include summernote css/js -->
<%-- <%@ include file="/resources/ckeditor/ckeditor.js" %>  --%>  

<script src = "/resources/ckeditor/ckeditor.js"></script>      
<br>  
 			<div class="row">
                <div class="col-lg-12">
                	<div class="jumbotron bg-success">
                    	<h1 class="page-header text-center text-white">Shop Item Register</h1>
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
                    
                        <div class="panel-heading text-primary">
                            상품 등록  
                        </div>
                      
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                            <form role="form" action="/admin/goods/register" method="post" enctype="multipart/form-data"> 
                            <input type='hidden' name="${_csrf.parameterName }" value="${_csrf.token}">
                            	<div class="form-group">
                            		<label>상품 카테고리 이름</label> 
                            		<select name="cateName" id="cateName">
                            		<c:forEach items="${category}" var="category">
                        			<option value="${category.cateName}">${category.cateName}</option>
                        			</c:forEach>
                            		</select>
                            	</div>
                            	<div class="form-group">
                            		<label>상품 카테고리 코드</label> 
                            		<select name="cateCode" id="cateCode">  		
                            		<option value="100">운동식품(100)</option>
                            		<option value="200">운동의류(200)</option>
                            		<option value="300">운동기구(300)</option>                    		
                            		</select>
                            	</div>
                            	<div class="form-group text-warning">
                            		<label>상품명</label> <input class="form-control" name="gdsName">
                            	</div>
                            	<div class="form-group text-warning">
                            		<label>상품가격</label> <input class="form-control" name="gdsPrice">
                            	</div>
                            	<div class="form-group text-warning">
                            		<label>상품재고</label> <input class="form-control" name="gdsStock">
                            	</div>
                            	<div class="form-group text-warning">
                            		<label>상품이미지</label> <br>
                            		<input id="gdsImg" type="file" name="file">
                            		<div class="select_img"><img src=""/></div>
                            		<script>
                            			$('#gdsImg').change(function(){
                            				if(this.files && this.files[0]){
                            					var reader = new FileReader;
                            					reader.onload = function(data) {
                            						$(".select_img img").attr("src", data.target.result).width(900).height(400);
                            						
                            					}
                            					reader.readAsDataURL(this.files[0]);
                            				}
                            			});
                            		</script>
                            		<label>파일 경로</label><br>
                            		<%=request.getRealPath("/") %>
                            	</div>
                         
                            	<div class="form-group text-warning">
                            		<label>상품설명 </label>
                            		<textarea class="form-control" rows="3" name="gdsInfo" id="gdsInfo"></textarea>
                            		<script>
 									/* var ckeditor_config = {
 									resize_enable : false,
 									enterMode : CKEDITOR.ENTER_BR,
 									shiftEnterMode : CKEDITOR.ENTER_P,
 									filebrowserUploadUrl : "/imageUpload"
 									};
 									CKEDITOR.replace("gdsInfo", ckeditor_config);  */ 
 								
  									</script>
                            	</div>
                            
                            	
                            	<button type="submit" class="btn btn-success">등록</button>
                            	<button type="reset" class="btn btn-danger">취소</button>
                            </form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <br>
            

  <%@include file="../includes/admin_footer.jsp" %>
  

  
   
	
	
