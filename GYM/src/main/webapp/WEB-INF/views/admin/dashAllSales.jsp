<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>DashBoard : GymCarry Admin</title>
<link rel="stylesheet" href="/gym/css/admin/adminStyle.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" id="sb-nav">

	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header_admin.jsp"%>
	<!-- sidebar -->
	<%@ include file="/WEB-INF/views/frame/sidebar_admin.jsp"%>


	<!-- 컨텐츠 시작 -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">전체매출</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="<c:url value="/admin/dashboard"/>">Dashboard</a></li>
					<li class="breadcrumb-item active">전체매출</li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">
						GymCarry의 전체매출 그래프 입니다. +
						
						<select name="month" id="select_month" class="dataTable-selector">
							<option value="">선택</option>								
							<option value="1">1월</option>								
							<option value="2">2월</option>								
							<option value="3">3월</option>								
							<option value="4">4월</option>								
							<option value="5">5월</option>								
							<option value="6">6월</option>								
							<option value="7">7월</option>								
							<option value="8">8월</option>								
							<option value="9">9월</option>								
							<option value="10">10월</option>								
							<option value="11">11월</option>								
							<option value="12">12월</option>								
						</select>
						<select name="year" id="select_year" class="dataTable-selector">
							<option value="">선택</option>								
							<option value="2020">2020년</option>								
							<option value="2021">2021년</option>								
						</select>
						
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-area me-1"></i> 요일별 매출
					</div>
					<div class="card-body">
						<canvas id="myAreaChart" width="100%" height="30"></canvas>
					</div>
					<div class="card-footer small text-muted day-num">날짜를 선택하세요.</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar me-1"></i> 월간 매출
							</div>
							<div class="card-body">
								<canvas id="myBarChart" width="100%" height="50"></canvas>
							</div>
							<div class="card-footer small text-muted month-num">날짜를 선택하세요.</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-pie me-1"></i> 이번달 매출 1위 ~ 4위
							</div>
							<div class="card-body">
								<canvas id="myPieChart" width="100%" height="50"></canvas>
							</div>
							<div class="card-footer small text-muted rank-num">날짜를 선택하세요.</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<!-- footer -->
		<%@ include file="/WEB-INF/views/frame/footer_admin.jsp"%>
		
	</div>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/gym/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/gym/js/assets/demo/chart-area-demo.js"></script>
        <script src="/gym/js/assets/demo/chart-bar-demo.js"></script>
        <script src="/gym/js/assets/demo/chart-pie-demo.js"></script>
        
<script>
$('#select_month, #select_year').change(function(){
    var total = [];
    var crname = [];
    var month = [];
    var day = [];
    var selectYear = $('#select_year').val();
    var selectMonth = $('#select_month').val();
       $.ajax({
          type : 'get',
          url : '<c:url value="/admin/allSaleMan"/>',
          dataType : 'json',
          data : {
             month : selectMonth,
             year : selectYear
          },
          success : function(data){
          $.each(data.daySales, function(index, item){
        	  console.log(item);
        	  total.push(item.total);
        	  day.push(item.day);
          });
          total.unshift(0);
          day.unshift(0);
          getArea(total, day);
         
          total = [];	  
          $.each(data.kingSales, function(index, item){
             total.push(item.total);
             crname.push(item.crname);
             month.push(item.month);
          });
          getPie(total, crname, month);
          
          total = [];
          month = [];
          $.each(data.monthSales, function(index, item){
        	  total.push(item.total);
        	  month.push(item.engmonth);
          });
          getBar(total, month);
          $(".day-num").html(selectMonth + '월 요일 별 매출 입니다.');
          $(".month-num").html(selectMonth + '월 월간 매출 입니다.');
          $(".rank-num").html(selectMonth + '월  판매 왕! 입니다.');
          }
          
       });
 });
	
</script>          
        
        
</body>
</html>

