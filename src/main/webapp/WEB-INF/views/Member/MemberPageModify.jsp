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
<h6>개인정보 수정하기</h6> 
<!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
 //USERID VARCHAR2(50) NOT NULL,
//USERPW VARCHAR2(100) NOT NULL,
//USERNAME VARCHAR2(100) NOT NULL,
//USERPHONE VARCHAR2(100) NOT NULL,
//POSTCODE VARCHAR2(100) NULL,
//USERADDR VARCHAR2(100) NULL,
//USERADDR2 VARCHAR2(100) NULL,
//REGDATE DATE DEFAULT SYSDATE,
//VERIFY NUMBER DEFAULT 0,
//PRIMARY KEY(USERID)                   								
                        <div class="panel-heading">
                            개인정보 수정하기 
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        		
                        		<div class="form-group">
                            		<label>ID</label> 
                            		<input class="form-control" name="userId"
                            		value='<c:out value="${Member.userId}"/>'readonly="readonly">                        		
                            	</div>
                            	
                            	<div class="form-group">
                            		<label>Password</label> 
                            		<input class="form-control" name="title"
                            		value='<c:out value="${Member.userPw}"/>'readonly="readonly"> 
                            	</div>
                            	
                            	<div class="form-group">
                            		<label>Text Area</label>
                            		<textarea class="form-control" rows="3" name="content" readonly="readonly">
                            		<c:out value="${board.content}"/>
                            		</textarea>
                            		
                            	</div>
                            	
                            	<div class="form-group">
                            		<label>Writer</label> 
                            		<input class="form-control" name="writer"
                            		value='<c:out value="${board.writer}"/>'readonly="readonly"> 
                            	</div>
                            	
                            	<!-- <button 
                            	data-oper="modify" 
                            	class="btn btn-default"
                            	onclick="location.href=
                            	'/board/modify?bno=<c:out value="${board.bno}"/>'">Modify
                            	</button> -->

                            	<!-- 게시물 조회관련 시큐리티 코딩-->
					<sec:authentication property="principal" var="pinfo"/>
						<sec:authorize access="isAuthenticated()">
	
							<c:if test="${pinfo.username eq board.writer}">
	
								<button data-oper='modify' class="btn btn-default">Modify</button>
							</c:if>
						</sec:authorize>
                            	<button 
                            	data-oper="list" 
                            	class="btn btn-info"
                            	onclick="location.href='/board/list'">List
                            	</button>
                            	
                            	<form id = 'operForm' action="/board/modify" method="get">
                            		<input type="hidden" id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
                            		<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                            		<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
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