<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>플레이스 등록 : GymCarry Admin</title>

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
                    <h1 class="mt-4">플레이스 등록</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                        <li class="breadcrumb-item active">컨텐츠 관리</li>
                        <li class="breadcrumb-item active"><a href="<c:url value="/admin/place"/>">플레이스 관리</a></li>
                        <li class="breadcrumb-item active">플레이스 등록</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="card-body">
                           	짐캐리에 새로운 플레이스를 등록하는 페이지입니다.
                        </div>
                    </div>
                   
                <div>
               		<%-- <form action="<c:url value="/admin/place/register"/>" id="registerPlaceForm" name="registerPlaceForm" method="post"> --%>
                    <form id="registerPlaceForm" name="registerPlaceForm" method="post">
                        
                        <div class="place_registerForm">
                          
                            <div class = "placenum">
                                <h4>카테고리</h4>
                                <select class="placenum_select" name="placenum">
                                    <option value="1">헬스</option>
                                    <option value="2">필라테스</option>
                                    <option value="3">요가</option>
                                </select>
                            </div>
                          
                            <div class="placename">
                                <h4>이름</h4>
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" placeholder="placename" name="placename"/>
                                    <label for="placename">플레이스 이름을 입력해주세요.</label>
                                </div>
                            </div>
                            
                            <div class="placeaddress">
                                <h4>주소</h4>
                                <div class="form-floating mb-3">
                                    <!--  <input class="form-control" type="text" placeholder="placeaddress" id="placedPost" name="placeaddress"/> -->
                                    <input class="form-control" id="postcode"  type="text" placeholder="postcode" readonly onclick="findAddr()">
                                    <label for="postcode">우편번호를 입력해주세요.</label>
								</div>
                                <div class="form-floating mb-3">
  									<input class="form-control" id="address" type="text" placeholder="address" name=placeaddress> <br>
                                    <label for="address">상세주소를 입력해주세요.</label>
                                </div>
                            </div>
                            
                            <div class="placephone">
                                <h4>전화번호</h4>
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" placeholder="placephone" name="placephone"/>
                                    <label for="placephone">전화번호를 입력해주세요.</label>
                                </div>
                            </div>  
                              
                              
                            <div class="placeinfo">
                                <h4>정보</h4>
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" placeholder="placeinfo" name="placeinfo"/>
                                    <span>콤마(",")로 구분해주세요.</span>
                                    <label for="placeinfo">예) 주차, 무선 인터넷, 지역화폐</label>
                                </div>
                            </div>  

                            <div class="openhour">
                                <h4>영업시간</h4>
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="text" placeholder="openhour" name="openhour"/>
                                    <span>콤마(",")로 구분해주세요.</span>
                                    <label for="openhour">예) 주말 10:00 - 12:00, 평일 10:00 - 22:20, 토요일 10:00 - 12:00</label>
                                </div>
                            </div>

                            <div class="placeintro">
                                <h4>소개</h4>
                                <div class="form-floating mb-3">
                                    <textarea class="form-control placeintro_input" rows="100" cols="100" placeholder="placeintro" name="placeintro"></textarea>
                                    <label for="placeintro">소개를 입력해주세요.</label>
                                </div>
                            </div>
                                
                            </div>
                            
                            <div class="register_btn">
                                <input type="button" class="login_btn btn btn-primary" onClick="fn_registerPlace('${result.code}')" value="등록">
                            </div>
                       
                       
                        </form>

                        </div>

                </div>

                
                <!-- footer -->
				<%@ include file="/WEB-INF/views/frame/footer_admin.jsp"%>
        
        	</div>
        		
        		
        		<!-- 카카오 우편번호 API -->
        		<script>
        		function findAddr(){
					new daum.Postcode({
   			    	oncomplete: function(data) {
        	
        			console.log(data);
        	
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var roadAddr = data.roadAddress; // 도로명 주소 변수
		            var jibunAddr = data.jibunAddress; // 지번 주소 변수
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('postcode').value = data.zonecode;
		            if(roadAddr !== ''){
		                document.getElementById("address").value = roadAddr;
		            } 
		            else if(jibunAddr !== ''){
		                document.getElementById("address").value = jibunAddr;
		            }
		        }
		    }).open();
		}
				</script>
        	    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
             
             
             
                <script>
                
                function fn_registerPlace(code) {

        			$.ajax({
        				type : 'POST',
        				url : "<c:url value='/admin/place/register'/>",
        				data : $("#registerPlaceForm").serialize(),
        				success : function() {
        					alert('플레이스가 정상적으로 등록되었습니다.');
        					location.href = "/gym/admin/place";
        				},
        				error : function(request, status, error) {
        					alert("code:" + request.status + "\n" + "message:"
        							+ request.responseText + "\n" + "error:" + error);
        				}

        			});
        		}
                
                
                </script>
                
</body>
</html>	