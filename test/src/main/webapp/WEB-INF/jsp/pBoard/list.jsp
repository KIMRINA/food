<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<title>boardList</title>
<style>
a {
	color: #000000;
}

#pop {
	width:300px;
	height:400px;
	background:#740DFDAD;
	color:#fff;
	position:absolute;
	top:10px;
	left:100px;
	text-align:center;
	border:2px solid #000;
	cursor: all-scroll;
}
</style>

</head>
<body>


<div id="root">
	<div>
		<%-- <%@include file="nav.jsp" %> --%>
	</div>
	
<form name="searchForm" id="searchForm" method="get" action="">
	<div class="search_box">
		<div class="search">
			<ul>
				<li>
					<label>카테고리</label>
					<select name="category" id="category">
						<option value=""></option>
						
						<c:forEach items="${categoryList}" var = "category">
						<option value="${category.pcate_rname}">${category.pcate_name}</option>
						</c:forEach>
					</select>
				</li>
			</ul>
		</div>
		<div class="btn">
			<ul>
				<li>
					<input type="button" value="검색" onClick="onSearch();">
				</li>
			</ul>
		</div>
	</div>
</form>
	
	<div class="tbl">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<c:forEach items="${list}" var = "list">
		    <tbody>
				<tr>
					<td>${list.pboard_no}</td>
					<td>${list.pcate_name}</td>
					<td><a href="${pageContext.request.contextPath}/pBoard/pBoardOneRead.do?pboard_no=${list.pboard_no}">${list.pboard_subject}</a></td>
					<td>관리자</td>
					<td><fmt:formatDate value="${list.pboard_date}" pattern="yyyy/MM/dd"/></td>
					<td>11</td>
				</tr>
			</tbody>
			</c:forEach>
			
		</table>
	</div>
	
	<div>
	  	<button type="button" onclick="writeGO()">글쓰기</button>
	  	<button type="button" onclick="excelGO()">엑셀다운로드</button>
	  	<button type="button" onclick="listAllGO()">전체리스트</button>
	</div>
  	


<%-- <div id="paging">
<nav aria-label="Page navigation example">
  <ul class="pagination">
    <c:if test="${pageMaker.prev}">
    	<li class="page-item">
    	<a class="page-link" href="boardList.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
    	</li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li class="page-item <c:out value="${cri.page == idx ? 'active' : ''}"/>" aria-current="page">
    	<a class="page-link" href="boardList.do${pageMaker.makeSearch(idx)}">${idx}</a>
    	</li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li class="page-item">
    	<a class="page-link" href="boardList.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
    	</li>
    </c:if> 
  </ul>
 </nav>
</div> --%>
  	
  	

<%-- <form role="form" method="get" action="/board/boardList.do" id="boardForm" style="text-align: center;">
	<div>
	<br>
		게시물 갯수 : <input type="text" name="perPageNum" value="${cri.perPageNum}"/>
		<button id="pageChange">변경</button>
	</div>

	<div class="search">
	    <select id="selectBox" name="searchType">
	      <option value="n"<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>-----</option>
	      <option value="t"<c:out value="${cri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
	      <option value="c"<c:out value="${cri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
	      <option value="w"<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
	      <option value="tcw"<c:out value="${cri.searchType eq 'tcw' ? 'selected' : ''}"/>>전체</option>
	    </select>
	
	    <input type="text" name="keyword" id="keywordBoardInput" value="${cri.keyword}"/>
	
	    <button id="searchBoardBtn" type="button">검색</button>
    <script>
      $(function(){
        $('#searchBoardBtn').click(function() {
          self.location = "/board/boardList.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("#selectBox option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordBoardInput').val());
        });
      });   
    </script>
  </div>
</form> --%>

</div>



<script>
	function writeGO() {
		location.href = "${pageContext.request.contextPath}/pBoard/pBoardInsertView.do";
	}
	function excelGO() {
		location.href = "${pageContext.request.contextPath}/pBoard/pBoardListExcel.do";
	}
	function listAllGO() {
		location.href = "${pageContext.request.contextPath}/pBoard/pBoardListAll.do?pageNo=1";
	}
	
	function onSearch(){
		var frm = document.searchForm;
		var searchForm = $("#searchForm").serialize();

// 		if (frm.category.value == ""){
// 			alert("카테고리를 선택하십시요.");
// 			frm.category.focus();
// 			return;
// 		}

		frm.action = "${pageContext.request.contextPath}/pBoard/pBoardList.do";
		frm.submit();
	}
	
</script>
</body>
</html>