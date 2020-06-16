<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="../includes/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>마이 페이지</h1> 
<h6>개인정보 상세보기</h6> 
<!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
          								
                        <div class="panel-heading">
                            마이 페이지
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        		
                        		<div class="form-group">
                            		<label>아이디</label> 
                            		<input class="form-control" name="userId"
                            		value='<c:out value="${member.userId}"/>'readonly="readonly">                        		
                            	</div>
                            	
                            	<div class="form-group">
                            		<label>비밀 번호</label> 
                            		<input class="form-control" name="userPw"
                            		value='<c:out value="${member.userPw}"/>'readonly="readonly"> 
                            	</div>
                            	
                            	<div class="form-group">
                            		<label>이름</label>
                            		<input class="form-control" name="userName" 
                            		value='<c:out value="${member.userName}"/>'readonly="readonly">
                            	</div>
                            	
                            	<div class="form-group">
                            		<label>전화 번호</label> 
                            		<input class="form-control" name="userPhone"
                            		value='<c:out value="${member.userPhone}"/>'readonly="readonly"> 
                            	</div>
                            	
                            	<div class="form-group">
                            		<label>우편 번호</label> 
                            		<input class="form-control" name="postCode"
                            		value='<c:out value="${member.postCode}"/>'readonly="readonly"> 
                            	</div>
                            	
                            	<div class="form-group">
                            		<label>도로명 주소</label> 
                            		<input class="form-control" name="userAddr"
                            		value='<c:out value="${member.userAddr}"/>'readonly="readonly"> 
                            	</div>
                            	
                            	<div class="form-group">
                            		<label>상세 주소</label> 
                            		<input class="form-control" name="userAddr2"
                            		value='<c:out value="${member.userAddr2}"/>'readonly="readonly"> 
                            	</div>
                            	<button 
                            	data-oper="modify" 
                            	class="btn btn-default"
                            	onclick="location.href=
                            	'/Member/MemberPageModify?userId=<c:out value="${member.userId}"/>'">개인정보 수정하기 
                            	</button> 

                            	<!-- 조회 관련 시큐리티 코딩-->
					<sec:authentication property="principal" var="pinfo"/>
						<sec:authorize access="isAuthenticated()">
	
							<c:if test="${pinfo.username eq member.userId}">
	
								<button data-oper='modify' class="btn btn-default">Modify</button>
							</c:if>
						</sec:authorize>
						
                            	<button 
                            	data-oper="list" 
                            	class="btn btn-info"
                            	onclick="location.href='/board/list'">List
                            	</button>
                            	
                            	<form id = 'operForm' action="/Member/MemberPageModify" method="get">
                            		<input type="hidden" id='userId' name='userId' value='<c:out value="${member.userId}"/>'>
                   
                            	</form>
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
            
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <%@include file="../includes/footer.jsp" %>
</body>
</html>