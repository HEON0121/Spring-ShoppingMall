<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
	<!-- 스프링 시큐리티 ajax post 처리 _csrf 헤더 값 & 토큰 처리 -->
  <meta id="_csrf" name="_csrf" content='${_csrf.token}'>
  <meta id="_csrf_header" name="_csrf_header" content='${_csrf.headerName}'>
  
  <title>Shopping page</title>
  <!-- Bootstrap core JavaScript -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
  
  <!-- Bootstrap core CSS -->
  <link type="text/css" rel="stylesheet" href="/resources/vendor/bootstrap/css/bootstrap.min.css" > 
  <link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.css">
  <!-- Custom styles for this template -->
  <link href="/resources/css/shop-homepage.css" rel="stylesheet">

  <!-- daum 도로명 주소 찾기 api -->
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>

     <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-danger fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/">Start Shopping</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
       <ul class="navbar-nav ml-auto">
       	 <sec:authorize access="isAuthenticated()"> 
       	  <li class="nav-item">
            <p class="nav-link"><sec:authentication property="principal.username"/>님, 안녕하세요!</p>
          </li>
         </sec:authorize> 
          <li class="nav-item">
            <a class="nav-link" href="/">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <sec:authorize access="isAnonymous()">
          <li class="nav-item">
            <a class="nav-link" href="/customJoin">Sign Up</a>
          </li>
          </sec:authorize>
          <sec:authorize access="isAnonymous()">
                <li class="nav-item">
                	<a href="/customLogin" class="nav-link">Login</a>
                </li>
          </sec:authorize>
           <sec:authorize access="hasRole('ROLE_MEMBER')"> 
          	<li class="nav-item">
            	<a class="nav-link"  id= "memberPage" href="/Member/CartItem">장바구니</a>
           	</li>
           	<li class="nav-item">
            	<a class="nav-link"  id= "memberPage" href="/Member/OrderedList">주문목록</a>
           	</li>
          </sec:authorize>
          <sec:authorize access="hasRole('ROLE_ADMIN')">
    		<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/index'/>">관리자 페이지</a></li>
  		  </sec:authorize>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
     
          <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                	<a href="#" class="nav-link" id="logoutBtn" onclick="document.getElementById('logoutForm').submit();">Logout</a>
                	<form id="logoutForm" action="/logout" method="post">
                	<input type="hidden" name = "${_csrf.parameterName}" value="${_csrf.token}">
                	</form>
                </li>
          </sec:authorize>
          
          
         </ul>   	
        
          	
          		
           
          	
        
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">Shop Name</h1>
        <div class="list-group">
          <a href="/board/categoryList?cateCode=300" class="list-group-item">운동 기구</a>
          <a href="/board/categoryList?cateCode=100" class="list-group-item">운동 식품 </a>
          <a href="/board/categoryList?cateCode=200" class="list-group-item">운동 의류 </a>
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
      	
        
        <script>
        	$(function(){
        		var activeEffect = $(".navbar-nav > .nav-item");
        		activeEffect.find(".nav-link").click(function(){
        			activeEffect.removeClass("active");
        			$(this).parent().addClass("active");
        		});
        	});
        </script> 