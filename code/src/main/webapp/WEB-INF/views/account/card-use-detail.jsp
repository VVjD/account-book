<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>BudgetBuddy | 카드 사용</title>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
    <!-- Libraries Stylesheet -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<style>

    
    <%@include file="/WEB-INF/views/inc/asset.jsp"%>
      
</style>

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
        <%@include file="/WEB-INF/views/inc/account-sidebar.jsp"%>
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

	<div class="content-total-style">
			<div class="content-header">
					<div class="content-title-style"><h3>카드 사용</h3></div>
					
					<form id="selectDateForm" method="GET">
						<div class="date-range-total-box">
							<div class="date-range-box">
								<div class="date-select-input-label">
									<label for="start-date-myCardTotal">시작일</label> <input type="text" name = "startDate" id="start-date" class="date-input-myCardTotal input-style-form" value="${map.startDate}">
								</div>
								<div class="date-select-input-label">
									<label for="end-date">종료일</label><input type="text" name = "endDate" id="end-date" class="date-input-myCardTotal input-style-form" value="${map.endDate}">
								</div>
							</div>
								<input type="submit" value="확인" class="purple-btn long-btn"/>
							</div>
					</form>
				</div>

	<div class="card-use-detail-box">
		
		<c:if test="${not empty list}">
    			<img src="/account/asset/images/${list[0].fileLink}" id="cardDetailImgPlace">
		</c:if>

<!-- transaction-table -->
			<table class="table-style">
				<thead>
					<tr>
						<th>날짜</th>
						<th>금액</th>
						<th>카테고리</th>
						<th>결제처</th>
						<th>입금/지출</th>
					</tr>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.accInfoDate}</td>
							<td>${dto.price}</td>
							<td>${dto.acName}</td>
							<td>${dto.location}</td>
							<td>
								<c:if test="${dto.seqDepositWithdrawalStatus == 1}">
									입금
								</c:if>
								<c:if test="${dto.seqDepositWithdrawalStatus == 2}">
									출금
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</thead>
				<tbody id="transaction-list"></tbody>
			</table>
		</div>
		</div>


			<!-- fakecontent 끝 -->
    </div>
    </div>

    <!-- JavaScript Libraries -->
   
    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/asset/css/temp/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>

    document.addEventListener('DOMContentLoaded', function() {
    const sidebarToggler = document.getElementById('sidebar-toggler');
    const sidebar = document.querySelector('.sidebar');
    const content = document.querySelector('.content');

        sidebarToggler.addEventListener('click', function() {
        sidebar.classList.toggle('hidden');
        content.classList.toggle('expanded');
        });
    });
    
    $(document).ready(function() {
        // jQuery datepicker 초기화
        $("#start-date, #end-date").datepicker({
            dateFormat: "yy-mm-dd"
        });

    });

    </script>
</body>

</html>
