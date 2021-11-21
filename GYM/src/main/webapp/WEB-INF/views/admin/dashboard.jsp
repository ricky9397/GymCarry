<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DashBoard : GymCarry Admin</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" href="/gym/css/admin/adminStyle.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header_admin.jsp"%>
	<!-- sidebar -->
	<%@ include file="/WEB-INF/views/frame/sidebar_admin.jsp"%>



	<!-- 컨텐츠 시작 -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">대시보드</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
				<div class="row">
					<div class="col-xl-3 col-md-6">
						<div class="card bg-primary text-white mb-4">
							<div class="card-body">년도 별 총 매출</div>
							<div 
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="javascript:callYear();">View
									년도 별 총 매출</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-warning text-white mb-4">
							<div class="card-body">올해 월 별 매출</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link a_month" href="javascript:callMonth(${year});">View
									올해 월 별 매출</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-success text-white mb-4">
							<div class="card-body">최근 요일 별 매출</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link a_rank" href="javascript:callDay(${day},${year});">View
									최근 요일 별 매출</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-danger text-white mb-4">
							<div class="card-body">최근 월별 캐리 매출 판매왕!</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link a_year" href="javascript:callrank(${year})">View
									월별 캐리 매출 판매왕!</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-area me-1"></i> <span class="nums">2021년 월별 총 매출</span>
						</div>
						<div class="card-body bar_chart">
							<canvas id="myAreaChart" width="100%" height="40"></canvas>
						</div>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> <span class="nums">DataTable Example</span>
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
							</thead>
							<tbody class="addList">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
		
		<!-- footer -->
		<%@ include file="/WEB-INF/views/frame/footer_admin.jsp"%>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/gym/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="/gym/js/assets/demo/chart-area-demo.js"></script>
    <script src="/gym/js/assets/demo/chart-bar-demo2.js"></script>
    <script src="/gym/js/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="/gym/js/datatables-simple-demo.js"></script>
	<script>
	
	function thead(){
		var	html= '<tr>'
			html+=	'<th>순서</th>'
			html+=	'<th>결제자 명</th>'
			html+=	'<th>결제자 연락처</th>'
			html+=	'<th>결제 수업횟수</th>'
			html+=	'<th>캐리 이름</th>'
			html+=	'<th>결제 날짜</th>'
			html+=	'<th>결제 금액</th>'
			html+='</tr>'
			$('#datatablesSimple thead').html(html);
	}
	
    var total = [];
    var month = [];
        $.ajax({
          type : 'get',
          url : '<c:url value="/admin/dash"/>',
          dataType : 'json',
          data : { year : ${year} },
          success : function(data){
          $.each(data.monthDash, function(index, item){
        	  total.push(item.total);
        	  month.push(item.engmonth);
          });
          $(".bar_chart").html('<canvas class="mybardel" id="myBarChart" width="100%" height="40"></canvas>');
          getBar(total, month);
          }
       }); 
       
       
	function callDay(num, year){
		var day = [];
		var sum = [];
		$.ajax({
			type : 'get',
	        url : '<c:url value="/admin/daylist"/>',
	        dataType : 'json',
	        data : { 
	        	month:num,
	        	year : year 	
	        },
	        success : function(data){
	        		var html = '<tr>'
	        	$.each(data.dayList, function(index, item){
	        		    html += '<td>'+ index +'</td>'
	        		    html += '<td>'+ item.payname +'</td>'
	        		    html += '<td>'+ item.payphone +'</td>'
	        		    html += '<td>'+ item.paynum +'</td>'
	        		    html += '<td>'+ item.crname +'</td>'
	        		    html += '<td>'+ item.paydate +'</td>'
	        		    html += '<td>₩ '+ item.payprice +'</td>'
	        		    html += '</tr>'
	        	});
	        	thead()
	        	$(".addList").html(html);
	        	$.each(data.dayDash, function(index, item){
	        		sum.push(item.total);
	        		day.push(item.day);
	        	});
	        	$(".bar_chart").html('<canvas id="myAreaChart" width="100%" height="40"></canvas>');
	        	sum.unshift(0);
	            day.unshift(0);
	            getArea(sum, day);
	        	$(".nums").html('최근 요일 별 매출 입니다.');
	        }
		});
	};
	
	function callMonth(num){
		$.ajax({
			type : 'get',
	        url : '<c:url value="/admin/monthlist"/>',
	        dataType : 'json',
	        data : { year : num },
	        success : function(data){
	        	var html = '<tr>'
	        	$.each(data.monthList, function(index, item){
	        			html += '<td>'+ index +'</td>'
	        		    html += '<td>'+ item.payname +'</td>'
	        		    html += '<td>'+ item.payphone +'</td>'
	        		    html += '<td>'+ item.paynum +'</td>'
	        		    html += '<td>'+ item.crname +'</td>'
	        		    html += '<td>'+ item.paydate +'</td>'
	        		    html += '<td>₩ '+ item.payprice +'</td>'
	        		    html += '</tr>'
	        	});
	        	thead()
	        	$(".addList").html(html);
	        		
	        	total = [];
	        	month = [];	
        		$.each(data.monthDash, function(index, item){
        			total.push(item.total);
              	 	month.push(item.engmonth);
	        	});
        		$(".bar_chart").html('<canvas id="myAreaChart" width="100%" height="40"></canvas>');
        		total.unshift(0);
        		month.unshift(0);
        		getArea(total, month);
        		$(".nums").html(num +'년 월별 매출 현황 입니다.');
	        }
		});
	}
	
	function callYear(){
		var year = [];
		$.ajax({
			type : 'get',
	        url : '<c:url value="/admin/yearlist"/>',
	        dataType : 'json',
	        success : function(data){
	        	var html = '<tr>'
        	$.each(data.yearAllList, function(index, item){
        			html += '<td>'+ index +'</td>'
        		    html += '<td>'+ item.payname +'</td>'
        		    html += '<td>'+ item.payphone +'</td>'
        		    html += '<td>'+ item.paynum +'</td>'
        		    html += '<td>'+ item.crname +'</td>'
        		    html += '<td>'+ item.paydate +'</td>'
        		    html += '<td>₩ '+ item.payprice +'</td>'
        		    html += '</tr>'
        	});
	        thead()
        	$(".addList").html(html);
        	
        	total = [];
    		$.each(data.yearDash, function(index, item){
    			total.push(item.total);
    			year.push(item.year);
        	});
    		$(".bar_chart").html('<canvas class="mybardel" id="myBarChart" width="100%" height="40"></canvas>');
    		getBaryear(total, year);
    		$(".nums").html('년도 별 매출 현황 입니다.');
	        }
		});
	}
	
	function callrank(num){
		$.ajax({
			type : 'get',
	        url : '<c:url value="/admin/ranklist"/>',
	        dataType : 'json',
	        data : { year : num },
	        success : function(data){
	         	var html = '<thead>';
	         		html += '<tr>';
	           		html += '<th>월</th>';
	           		html += '<th>캐리이름</th>';
	           		html += '<th>총 결제 수업 횟수</th>';
	           		html += '<th>전문 분야</th>';
	           		html += '<th>성별</th>';
	           		html += '<th>총 매출</th>';
	           		html += '</tr>';
	           		html += '</thead>';
	           		html += '<tbody class="addList">';
	           	$.each(data.carrySales, function(index, item){
	           		    html += '<tr>';
	           		    html += '<td>'+ item.month +'</td>';
	           		    html += '<td>'+ item.crname +'</td>';
	           		    html += '<td>'+ item.paynum +'</td>';
	           		    html += '<td>'+ item.crfield +'</td>';
	           		    html += '<td>'+ item.crgender +'</td>';
	           		    html += '<td>₩ '+ item.total +'</td>';
	           		    html += '</tr>';
	           	});
	           		    html += '</tbody>'
	         	
	           	$("#datatablesSimple").html(html);
	           	
	           	
	        	total = [];
	            month = [];
	            $.each(data.rankDash, function(index, item){
	          	  total.push(item.total);
	          	  month.push(item.engmonth);
	            });
	            $(".bar_chart").html('<canvas class="mybardel" id="myBarChart" width="100%" height="40"></canvas>');
	            getBar(total, month);
	            $(".nums").html(num + '년도 월별 캐리 매출 판매왕!!!');
	        }
		});    
	};
	
    </script>
    
</body>
</html>

