<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<tiles:insertAttribute name="header"/>

</head>
<body>
		<!-- tilesMenu -->
	<!-- <div class="header"></div> -->
		<tiles:insertAttribute name="menu" />
	
	
	
	<!-- tilesBody -->
	<tiles:insertAttribute name="body"/>
	
	<!-- tilesFooter -->
	<tiles:insertAttribute name="footer"/>
</body>
</html>