<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<title>PageNotFound</title>
<link rel="stylesheet" href="/gym/css/404error.css">
</head>
<body>
	
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	
	
	<!-- ------------------------------------ -->

    <div class="container">
    <div class="wrapper">
        <img class="errorimg" src="<c:url value="/images/icon/404.svg"/>" alt="">
        <h1>Page Not Found</h1>
       <p class="message">
        잘못된 URL 입니다. 
        
       </p>
       <a href="<c:url value="/index"/>" class="btn">Home</a>
    </div>
    </div>
    <!-- Contents end -->

    <!-- ------------------------------------- -->
	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>	
	
	<!-- ------------------------------------- -->

