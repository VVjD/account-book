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

    <!-- Libraries Stylesheet -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<style>

	#cardDetailImgPlace {
    	margin: 0;
    	width: 250px;
    }
   
    
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
	<div class="card-use-detail-box">
		<form id="selectDateForm" method="GET">
			<div class="date-range-total-box">
			<div class="date-range-box">
				<label for="start-date-myCardTotal">시작일 <input type="text" name = "startDate" id="start-date" class="date-input-myCardTotal" value="${map.startDate}"> </label> 
				<label for="end-date">종료일 <input type="text" name = "endDate" id="end-date" class="date-input-myCardTotal" value="${map.endDate}"></label> 
			</div>
				<input type="submit" value="확인" class="dark-blue-btn long-btn"/>
			</div>
		</form>
		
		<c:if test="${not empty list}">
    			<img src="/account/asset/images/${list[0].fileLink}" id="cardDetailImgPlace">
		</c:if>
	</div>
			<table class="transaction-table">
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


			<!-- fakecontent 끝 -->
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        
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

//         // 검색 버튼 클릭 이벤트 처리
//         $("#search-btn").click(function() {
//             var startDate = $("#start-date").val();
//             var endDate = $("#end-date").val();

//             // 서버에서 데이터 가져오기 (AJAX 요청)
//             $.ajax({
//                 url: "/get-transactions",
//                 method: "POST",
//                 data: {
//                     startDate: startDate,
//                     endDate: endDate
//                 },
//                 success: function(response) {
//                     // 가져온 데이터를 날짜 순으로 정렬
//                     var transactions = response.sort(function(a, b) {
//                         return new Date(b.date) - new Date(a.date);
//                     });

//                     // 데이터를 테이블에 표시
//                     var transactionList = $("#transaction-list");
//                     transactionList.empty();

//                     transactions.forEach(function(transaction) {
//                         var row = "<tr>" +
//                             "<td>" + transaction.date + "</td>" +
//                             "<td>" + transaction.amount + "</td>" +
//                             "<td>" + transaction.category + "</td>" +
//                             "<td>" + transaction.payee + "</td>" +
//                             "<td>" + (transaction.isIncome ? "입금" : "지출") + "</td>" +
//                             "</tr>";
//                         transactionList.append(row);
//                     });
//                 },
//                 error: function() {
//                     alert("데이터를 가져오는데 실패했습니다.");
//                 }
//             });
//         });
    });

    </script>
</body>

</html>
