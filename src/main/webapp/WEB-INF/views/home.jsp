<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<%@ include file="./common/header.jsp" %>
	<h1>빈스미디어 실기 과제</h1>
	<a href="${path}/baseball/">야구 게임</a><br/>
	<a href="${path}/hash/">단방향 해시 함수</a>
</body>
</html>