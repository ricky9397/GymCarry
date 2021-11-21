<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>플레이스 수정 : GymCarry Admin</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

<script src="/gym/js/scripts.js"></script>
<script src="/gym/js/datatables-simple-demo.js"></script>
        
<%@ include file="/WEB-INF/views/frame/metaheader_admin.jsp"%>
<link rel="stylesheet" href="/gym/css/admin/adminStyle.css">
<link rel="stylesheet" href="/gym/css/admin/placeRegister.css">

    <body class="sb-nav-fixed">

	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header_admin.jsp"%>
	<!-- sidebar -->
	<%@ include file="/WEB-INF/views/frame/sidebar_admin.jsp"%>


	<!-- 컨텐츠 시작 -->
            <div id="layoutSidenav_content">
                <div class="container-fluid px-4">
                    <h1 class="mt-4">플레이스 수정</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                        <li class="breadcrumb-item active">컨텐츠 관리</li>
                        <li class="breadcrumb-item active"><a href="<c:url value="/admin/place"/>">플레이스 관리</a></li>
                        <li class="breadcrumb-item active">플레이스 수정</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="card-body">
                           	짐캐리의 플레이스 정보를 수정하는 페이지입니다.
                        </div>
                    </div>
                   
                   
                   
                <div>
                    <%-- <form action="<c:url value="/admin/place/modify"/>" method="post"> --%>
                    <form id="modifyPlaceForm" name="modifyPlaceForm" method="post">
                        
                        <div class="place_registerForm">
                          
                          	<input type="hidden" value="${original.placeidx}" name="placeidx"/>
                         
                                 
                         <div class = "placenum">
                                <h4>카테고리</h4>
                                
                           <select class="placenum_select" name="placenum">
								<option value="1" ${original.placenum == 1 ? 'selected' : ''}>헬스</option>
								<option value="2" ${original.placenum == 2 ? 'selected' : ''}>필라테스</option>
								<option value="3" ${original.placenum == 3 ? 'selected' : ''}>요가</option>
								
								<%--	<c:if test="${original.placenum == 1}">
									<option value="1" selected hidden>헬스</option>
								</c:if>
								
								<c:if test="${original.placenum == 2}">
									<option value="2" selected hidden>필라테스</option>
								</c:if>
								
								<c:if test="${original.placenum == 3}">
									<option value="3" selected hidden>요가</option>
								</c:if> 		--%>
                                 	
                                </select>
                        
                            </div>
                          
                            <div class="placename">
                                <h4>이름</h4>
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" placeholder="placename" value="${original.placename}" name="placename"/>
                                    <label for="placename">플레이스 이름을 입력해주세요.</label>
                                </div>
                            </div>
                            
                            <div class="placeaddress">
                                <h4>주소</h4>
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" placeholder="placeaddress" value="${original.placeaddress}" name="placeaddress"/>
                                    <label for="placeaddress">상세주소를 입력해주세요.</label>
                                </div>
                            </div>
                            
                            <div class="placephone">
                                <h4>전화번호</h4>
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" placeholder="placephone" value="${original.placeaddress}" name="placephone"/>
                                    <label for="placephone">전화번호를 입력해주세요.</label>
                                </div>
                            </div>  
                              
                            <div class="placeinfo">
                                <h4>정보</h4>
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" placeholder="placeinfo" value="${original.placeinfo}" name="placeinfo"/>
                                    <span>콤마(",")로 구분해주세요.</span>
                                    <label for="placeinfo">예) 주차, 무선 인터넷, 지역화폐</label>
                                </div>
                            </div>  

                            <div class="openhour">
                                <h4>영업시간</h4>
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" placeholder="openhour" value="${original.openhour}" name="openhour"/>
                                    <span>콤마(",")로 구분해주세요.</span>
                                    <label for="openhour">예) 주말 10:00 - 12:00, 평일 10:00 - 22:20, 토요일 10:00 - 12:00</label>
                                </div>
                            </div>

                            <div class="placeintro">
                                <h4>소개</h4>
                                <div class="form-floating mb-3">
                                    <textarea class="form-control" rows="100" cols="100" placeholder="placeintro" name="placeintro">${original.placeintro}</textarea>
                                    <label for="placeintro">소개를 입력해주세요.</label>
                                </div>
                            </div>
                            
                            
                            </div>
                            
                            <div class="register_btn">
                                <input type="button" class="login_btn btn btn-primary"  onClick="fn_modifyPlace('${result.code}')"value="수정">
                            </div>
                       
                        </form>

                        </div>


                </div>
                
                <!-- footer -->
				<%@ include file="/WEB-INF/views/frame/footer_admin.jsp"%>
		
			</div>
                
                
                <script>
                
                function fn_modifyPlace(code) {

        			$.ajax({
        				type : 'POST',
        				url : "<c:url value='/admin/place/modify'/>",
        				data : $("#modifyPlaceForm").serialize(),
        				success : function() {
        					alert('플레이스가 정상적으로 수정되었습니다.');
        					location.href = "/gym/admin/place";
        				},
        				error : function(request, status, error) {
        					alert("code:" + request.status + "\n" + "message:"
        							+ request.responseText + "\n" + "error:" + error);
        				}

        			});
        		}
                
                
                </script>
                
		
	</div>
		
</body>
</html>		