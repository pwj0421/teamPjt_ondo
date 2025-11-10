<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>공지사항 수정</title>
<script type="text/javascript">
	function goUpdate(){
		if(checkValue(noti.title,"제목 입력!")) return;
		if(checkValue(noti.content,"내용 입력!")) return;
		
		noti.t_gubun.value = "update";
		noti.method="post";
		noti.action="Notice";
		noti.submit();
	}
</script>
</head>
<body>
  <div class="notice_write">
  <h2>공지사항 수정</h2>
  <form name="noti">
    <input type="hidden" name="t_gubun">
    <input type="hidden" name="n_no" value="${t_dto.getNo()}">
    
    <div class="form_section">
      <label>제목</label>
      <input type="text" name="title" value="${t_dto.getTitle()}" placeholder="공지사항 제목을 입력하세요" required>
    </div>

 <div class="form_row">
  <label style="margin-right:10px;">중요도</label>
  <select name="important" required style="width:120px; margin-right:30px;">
    <option value="">선택</option>
    <option value="1" <c:if test="${t_dto.getImportant() eq '1'}">selected</c:if>>중요</option>
    <option value="0" <c:if test="${t_dto.getImportant() eq '0'}">selected</c:if>>일반</option>
  </select>

  <label style="margin-right:10px;">공지 종류</label>
  <select name="type" required style="width:120px;">
    <option value="">선택</option>
    <option value="notice" <c:if test="${t_dto.getType() eq 'notice'}">selected</c:if>>공지</option>
    <option value="update" <c:if test="${t_dto.getType() eq 'update'}">selected</c:if>>업데이트</option>
    <option value="info"   <c:if test="${t_dto.getType() eq 'info'}">selected</c:if>>안내</option>
  </select>
 </div>

    <div class="form_section">
      <label>내용</label>
      <textarea name="content" placeholder="내용을 입력하세요" required>${t_dto.getContent()}</textarea>
    </div>

    <div class="form_section notice_write_attach">
      <label>첨부파일</label>
      <div id="attachContainer">
        <c:if test="${not empty t_dto.getAttach_1()}">
          <div class="attach_wrapper">
            <span class="file_name">📎 ${t_dto.getAttach_1()}</span>
          </div>
        </c:if>
        <c:if test="${not empty t_dto.getAttach_2()}">
          <div class="attach_wrapper">
            <span class="file_name">📎 ${t_dto.getAttach_2()}</span>
          </div>
        </c:if>
        <c:if test="${not empty t_dto.getAttach_3()}">
          <div class="attach_wrapper">
            <span class="file_name">📎 ${t_dto.getAttach_3()}</span>
          </div>
        </c:if>
      </div>

      <!-- ✅ 첨부파일 추가 비활성화 버튼 -->
      <button type="button" class="add_attach_btn" onclick="alert('등록된 첨부파일은 수정할 수 없습니다.');">* 파일 수정 불가</button>
    </div>

    <div class="notice_write_buttons">
      <button type="button" onclick="goUpdate()">수정 완료</button>
      <a href="Notice">취소</a>
    </div>
  </form>
</div>
<%@ include file="../common_footer.jsp" %>
<script>
  // ✅ addAttach 함수 완전히 비활성화 (수정 시 파일 추가 금지)
  function addAttach() {
    alert("등록된 첨부파일은 수정할 수 없습니다.");
  }

  // ✅ previewFile과 removeAttach도 막아둠 (수정 페이지에서 불필요)
  function previewFile() {
    alert("등록된 첨부파일은 수정할 수 없습니다.");
  }

  function removeAttach() {
    alert("등록된 첨부파일은 수정할 수 없습니다.");
  }
</script>

</body>
</html>
