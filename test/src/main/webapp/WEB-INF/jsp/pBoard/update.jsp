<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>수정하기</title>
	</head>

<body>
	
<div id="root">
	
	<section id="container">
		<form name="updateForm" role="form" method="post" action="${pageContext.request.contextPath}/pBoard/pBoardUpdate.do">
			<input type="hidden" name="pboard_no" value="${update.pboard_no}" >
			<table>
				<tbody>
					<tr>
						<td>
							<label for="pboard_category">카테고리</label>
							<select id="pboard_category" class="chk" name="pboard_category" title="카테고리">
							<c:forEach items="${categoryList}" var = "category">
								<option value="${category.pcate_rname}" <c:if test="${update.pboard_category == category.pcate_rname}">selected</c:if> >${category.pcate_name}</option>
							</c:forEach>
							</select>
						</td>
					</tr>	
					<tr>
						<td>
							<label for="pboard_subject">제목</label>
							<input type="text" value="${update.pboard_subject}" id="pboard_subject" name="pboard_subject" class="chk" title="제목을 입력하세요." maxlength="100" />
						</td>
					</tr>	
					<tr>
						<td>
							<label for="pboard_content">내용</label>
							<textarea id="pboard_content" name="pboard_content" class="chk" title="내용을 입력하세요." maxlength="1000" style="height: 100px;width: 600px;"><c:out value="${update.pboard_content}" /></textarea>
						</td>
					</tr>
					<%-- <tr>
						<td>
							<label for="board_name">작성자</label>
							<input type="text" id="board_name" name="board_name" value="${update.board_name}" readonly="readonly"/>
						</td>
					</tr> --%>
				</tbody>
			</table>
			<div>
				<button type="submit" class="update_btn">저장</button>
				<button type="button" onclick="history.back()">뒤로</button>
			</div>
		</form>
	</section>
	<hr />
</div>

<script>
	$(document).ready(function(){
		
		// 공지사항 클릭못하게 disabled 처리
		$("select option[value*='0']").prop('disabled',true);
		
		// 관리자 권한만 공지사항 disabled 없애서 선택 가능하다
		var auth = ${login.mem_auth};
		if(auth == 0) {
			$("select option[value*='0']").prop('disabled',false);
		}
		
		
		
// 		var formObj = $("form[name='updateForm']");
// 		$(".update_btn").on("click", function(){
// 			if(fn_valiChk()){
// 				return false;
// 			}
			
// 			var frm = document.form;
// 			var url = "/update.do";  //본인이 보내야되는 url을 쓴다.
// 			frm.action = url;
// 			frm.method = "post";
// 			frm.target = opener.window.name;  //name는 변경하지 말고 그대로 사용. 부모창의 이름을 타겟으로 하겠다고 선언하는 것임.
// 			frm.submit();
			
// 		});
		
		
	})
	
	
	function fn_valiChk(){
			var regForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("board_title"));
					return true;
				}
			}
		}
	
</script>	
		
</body>
</html>