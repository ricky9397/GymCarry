<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<title>LOGIN : GymCarry Admin</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

<script src="/gym/js/scripts.js"></script>
<script src="/gym/js/datatables-simple-demo.js"></script>
<script src="/gym/assets/demo/chart-area-demo.js"></script>
<script src="/gym/assets/demo/chart-bar-demo.js"></script>
        
<%@ include file="/WEB-INF/views/frame/metaheader_admin.jsp"%>
<link rel="stylesheet" href="/gym/css/admin/adminStyle.css">

    <body class="sb-nav-fixed">

			<!-- header NavBar-->
            <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="<c:url value="/"/>">GymCarry</a>
           
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            </form>


            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
						<c:if test="${adminLoginSession eq null}">
							<li><a class="dropdown-item"
								href="<c:url value="/admin/login"/>" class="login">Login</a></li>
						</c:if>
						<c:if test="${adminLoginSession ne null}">
							<li><a class="dropdown-item"
								href="<c:url value="/admin/logout"/>" class="login">Logout</a></li>
						</c:if>

				</ul>
                </li>
            </ul>
        </nav>


        	<!-- 컨텐츠 시작 -->
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center my-4">관리자 로그인</h3></div>
                            <div class="card-body">
                               
                               
                           <form action="<c:url value="/admin/login"/>" method="post">
                               <!--  <form id="adminLoginForm" name="adminLoginForm" method="post"> -->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="adminid" type="text" name="adminid" placeholder="name@example.com" />
                                        <label for="inputEmail">아이디</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="adminpw" type="password" name="adminpw" placeholder="Password" />
                                        <label for="inputPassword">비밀번호</label>
                                    </div>
                                    <div class="login_btn">
                                        <input type="submit" class="login_btn btn btn-primary" value="로그인">
                                    </div>
                                </form>
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>

   