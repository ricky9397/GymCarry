<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    
<!DOCTYPE html>
<html lang="ko">
    <head>
	    <!-- meta -->
	    <tiles:insertAttribute name="meta" />
	    
	    <tiles:insertAttribute name="style" />
	    <tiles:insertAttribute name="commonScript" />
    </head>
    <body class="text-center">
        <tiles:insertAttribute name="contents" />
        <tiles:insertAttribute name="moduleScript" ignore="true" />
    </body>
</html>