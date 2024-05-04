<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <link rel="stylesheet" href="/account/asset/css/combine.css">
</head>
<style>

   @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@700&display=swap');
    
    <%@include file="/WEB-INF/views/inc/asset.jsp"%>
      
</style>
<script type="module" src="chart.min.js"></script>
<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <!-- 사이드바  -->
        <%@include file="/WEB-INF/views/inc/card-sidebar.jsp"%>
        <!-- 사이드바 끝  -->
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            
            <!-- Navbar Start -->
            <!-- 상당 메뉴 -->
            <%@include file="/WEB-INF/views/inc/header.jsp"%>
            <!-- 상당 메뉴 끝-->
            <!-- Navbar End -->
        <!-- Content End -->
        <!-- fakecontent 안에서 작성 -->
        
    
<div class="fakecontent">
    <h2>선택된 카테고리: ${selectedCategory}</h2>

    <div class="card-container">
        <c:choose>
            <c:when test="${empty list}">
                <div class="card">
                    <div>선택된 카테고리에 해당하는 추천 카드가 없습니다.</div>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${list}" var="dto" varStatus="loop">
                    <div class="card">
                        <div class="card-rank">${loop.index + 1}</div>
                        <div class="card-image">
                            <img src="${dto.fileLink}" alt="Card Image">
                        </div>
                        <div class="card-details">
                            <div class="card-name">${dto.ciName}</div>
                            <div class="card-company">${dto.cardCompany}</div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</div>
</div>
    <button class="modal-button" onclick="openModal()">카테고리 선택</button>

        <!-- fakecontent 끝 -->
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        

    <!-- JavaScript Libraries -->
   
    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/asset/css/temp/js/main.js"></script>
    <script>

    console.log("Selected Category in JSP: ${selectedCategory}");
    console.log("Number of Cards in JSP: ${list.size()}");

    </script>
</body>

</html>
