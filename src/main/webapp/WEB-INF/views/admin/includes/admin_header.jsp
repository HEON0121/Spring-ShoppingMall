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
  <title>Shop Homepage - Start Bootstrap Template</title>
   <!-- Bootstrap core JavaScript -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
  <!-- Bootstrap core CSS -->
  <!-- <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css">
  <!-- Custom styles for this template -->
  <link href="/resources/css/shop-homepage.css" rel="stylesheet">

</head>

<body>

     <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/admin/index">Only for Admin</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
       <ul class="navbar-nav ml-auto">
          <!-- <li class="nav-item active">
            <a class="nav-link" href="/board/list">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/board/customJoin">Sign Up</a>
          </li>
          <li class="nav-item">
            <a class="nav-link"  id= "regBtn" href="#">register</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
      -->
          <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                	<p class="nav-link"><sec:authentication property='principal.username'/>님, 안녕하세요.</p>
                </li>
                <li class="nav-item">
                	<a href="/customLogout" class="nav-link">Logout</a>
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
          <a href="/admin/goods/register" class="list-group-item">상품 등록</a>
          <a href="/" class="list-group-item">상품 목록</a>
          <a href="/admin/shop/OrderedList" class="list-group-item">주문 목록</a>
          <a href="/admin/shop/allReview" class="list-group-item">상품 평가</a>
          <a href="/admin/member/memberList" class="list-group-item">회원 관리</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
      
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>