<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
     //response.sendRedirect("/test/pBoard/pBoardList.do");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script type="text/javascript">
	//window.location = "${pageContext.request.contextPath}/pBoardList.do";
	function listGo() {
		location.href = "${pageContext.request.contextPath}/pBoard/pBoardList.do";
	}
</script>
<body>
	<span>오늘 뭐 먹지 ? : </span><button onclick="listGo()">click</button>
</body>