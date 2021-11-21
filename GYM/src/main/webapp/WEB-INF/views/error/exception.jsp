<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<title>Error</title>
<link rel="stylesheet" href="/gym/css/404error.css">
</head>
<body>

<!-- header -->
<%@ include file="/WEB-INF/views/frame/header.jsp"%>


<!-- ------------------------------------ -->
<article>
<div class="container">
    <div class="wrapper">
        <img class="errorimg" src="<c:url value="/images/icon/fixbug.svg"/>" alt="">
        <h1>Exception</h1>
        <p class="message">
            데이터를 처리 하는 과정에서 문제가 발생하였습니다.<br>
            관리자에게 문의하여 주십시오.
        </p>
        <a href="<c:url value="/index"/>" class="btn">Home</a>
        <div class="error">
        <h3>${exception.getMessage()}</h3>
        <ul>
            <c:forEach items="${exception.getStackTrace()}" var="stack">
                <li>${stack.toString()}</li>
            </c:forEach>
        </ul>
        </div>
    </div>
</div>
</article>


<!-- Contents end -->

</body>
</html>

