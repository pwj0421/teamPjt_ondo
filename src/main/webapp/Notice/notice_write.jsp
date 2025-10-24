<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>
  <div class="notice_write">
  <h2>공지사항 작성</h2>
  <form action="notice_submit.jsp" method="post" enctype="multipart/form-data">
    
    <div class="form_section">
      <label>제목</label>
      <input type="text" name="title" placeholder="공지사항 제목을 입력하세요" required>
    </div>

  <div class="form_row">
  <label style="margin-right:10px;">중요도</label>
  <select name="priority" required style="width:120px; margin-right:30px;">
    <option value="">선택</option>
    <option value="high">높음</option>
    <option value="medium">보통</option>
    <option value="low">낮음</option>
  </select>

  <label style="margin-right:10px;">공지 종류</label>
  <select name="type" required style="width:120px;">
    <option value="">선택</option>
    <option value="notice">공지</option>
    <option value="update">업데이트</option>
    <option value="info">안내</option>
  </select>
</div>



    <div class="form_section">
      <label>내용</label>
      <textarea name="content" placeholder="내용을 입력하세요" required></textarea>
    </div>

    <div class="form_section notice_write_attach">
      <label>첨부파일</label>
      <div id="attachContainer">
      </div>
      <button type="button" class="add_attach_btn" onclick="addAttach()">+ 파일 추가</button>
    </div>

    <div class="notice_write_buttons">
      <button type="submit">등록</button>
      <a href="notice_list.jsp">취소</a>
    </div>

  </form>
</div>

<script>
  // 첨부파일 추가/삭제
  function addAttach() {
    const container = document.getElementById('attachContainer');
    const div = document.createElement('div');
    div.className = 'attach_wrapper';
    div.innerHTML = `<input type="file" name="attach[]"> <button type="button" onclick="removeAttach(this)">삭제</button>`;
    container.appendChild(div);
  }

  function removeAttach(btn) {
    btn.parentElement.remove();
  }
</script>
</body>
</html>