<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>글쓰기</title>
	</head>

<body>

	<div id="root">
		<header>
			<h1> 글쓰기</h1>
		</header>
		<hr />
		
		<section id="container">
			<form name="writeForm" method="post" action="${pageContext.request.contextPath}/pBoard/pBoardInsert.do">
			<table>
				<tbody>
					<%-- <c:if test="${login.mem_id != null}"> --%>
						<tr>
							<td>
								<label for="pboard_category">카테고리</label>
								<select id="pboard_category" name="pboard_category" title="카테고리">
								    <option value="hansik">한식</option>
								    <option value="joongsik">중식</option>
								    <option value="yangsik">양식</option>
								    <option value="ilsik">일식</option>
								    <option value="bunsik">분식</option>
								    <option value="dessert">디저트</option>
								    <option value="chicken">치킨</option>
								    <option value="pizza">피자</option>
								    <option value="asiafood">아시아음식</option>
								    <option value="fastfood">패스트푸드</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<label for="pboard_subject">제목</label>
								<input type="text" id="pboard_subject" name="pboard_subject" class="chk" title="제목을 입력하세요." maxlength="100" />
							</td>
						</tr>	
						<tr>
							<td>
								<label for="pboard_content">내용</label>
								<textarea id="pboard_content" name="pboard_content" class="chk" title="내용을 입력하세요." maxlength="1000" style="height: 100px;width: 600px;"></textarea>
							</td>
						</tr>
						<%-- <tr>
							<td>
								<label for="board_name">작성자</label>
								<input type="text" id="board_name" name="board_name" class="chk" value="${login.mem_name}" readonly />
							</td>
						</tr> --%>
						<tr>
							<td>
								<input type="hidden" name="board_no" value="1" >
								<button class="write_btn" type="submit">작성</button>
								<button type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/pBoard/pBoardList.do;'">리스트</button>
							</td>
						</tr>	
					<%-- </c:if>
					<c:if test="${login.mem_id == null}">
						<p>로그인 후에 작성하실 수 있습니다.</p>
					</c:if> --%>
							
						</tbody>			
					</table>
				</form>
				
			</section>
			<hr />
		</div>
		
<script type="text/javascript">
		$(document).ready(function(){
			
			// 공지사항 클릭못하게 disabled 처리
			//$("select option[value*='0']").prop('disabled',true);
			
			// 관리자 권한만 공지사항 disabled 없애서 선택 가능하다
// 			var auth = ${login.mem_auth};
// 			if(auth == 0) {
// 				$("select option[value*='0']").prop('disabled',false);
// 			}
				
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				
				var frm = document.form;
				var url = "${pageContext.request.contextPath}/pBoard/pBoardInsert.do";
				frm.action = url;
				frm.method = "post";
				frm.submit();
				
			});
		})
		
		
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert("빈칸을 다 입력해주세요");
					return true;
				}
			}
		}
		
</script>
	
	</body>
</html>