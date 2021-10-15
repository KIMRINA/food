<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<title>게시판</title>
</head>

<body>
	<section id="container">
	<form name="readForm" role="form" method="post" action="">
		<table>
			<tbody>
				<tr>
					<td>
						<label for="pboard_no">글 번호</label>
						<input type="text" id="pboard_no" name="pboard_no" value="${read.pboard_no}" readonly/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="pcate_name">카테고리</label>
						<input type="text" id="pcate_name" name="pcate_name" value="${read.pcate_name}" readonly/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="pboard_subject">제목</label>
						<input type="text" id="pboard_subject" name="pboard_subject" value="${read.pboard_subject}" readonly/>
					</td>
				</tr>	
				<tr>
					<td>
						<label for="pboard_content">내용</label>
						<textarea id="pboard_content" style="height: 100px;width: 680px;" name="pboard_content" readonly ><c:out value="${read.pboard_content}" /></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="board_name">작성자</label>
						<input type="text" id="board_name" value="관리자" readonly />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pboard_date">작성날짜</label>
						<fmt:formatDate value="${read.pboard_date}" pattern="yyyy-MM-dd"/>					
					</td>
				</tr>
				<%-- <tr>
					<td>
						<label for="board_hit">조회수</label>
						<input type="text" id="board_hit" name="board_hit" value="${read.board_hit}" readonly />
					</td>
				</tr>	 --%>
			</tbody>			
		</table>
		
		<div>
			<button type="button" class="update_btn" onclick="updateGO()">수정</button>
			<button type="button" class="delete_btn" onclick="deleteGO()">삭제</button>
			<button type="button" onclick="listGO()">리스트</button>
		</div>
	</form>
	</section>

<script>
	function updateGO() {
		location.href = "${pageContext.request.contextPath}/pBoard/pBoardUpdateView.do?pboard_no="+$("#pboard_no").val();
	}
	function listGO() {
		location.href = "${pageContext.request.contextPath}/pBoard/pBoardList.do";
	}
	function deleteGO() {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			var frm = document.readForm;
			frm.action = "${pageContext.request.contextPath}/pBoard/pBoardDelete.do";
			frm.submit();
			//location.href = "${pageContext.request.contextPath}/pBoard/pBoardDelete.do?pboard_no="+$("#pboard_no").val();
		}else{   //취소
		    return;
		}
	}
</script>	
		
</body>
</html>