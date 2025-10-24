<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>공지사항 작성</title>
<script type="text/javascript">
	function goSave(){
		if(checkValue(noti.title,"제목 입력!")) return;
		if(checkValue(noti.content,"내용 입력!")) return;
		
		noti.t_gubun.value = "save";
		noti.method="post";
		noti.action="Notice";
		noti.submit();
		
	}
</script>
</head>
<body>
  <div class="notice_write">
  <h2>공지사항 작성</h2>
  <form name="noti">
    <input type="hidden" name="t_gubun">
    
    <div class="form_section">
      <label>제목</label>
      <input type="text" name="title" placeholder="공지사항 제목을 입력하세요" required>
    </div>

  <div class="form_row">
  <label style="margin-right:10px;">중요도</label>
  <select name="important" required style="width:120px; margin-right:30px;">
    <option value="">선택</option>
    <option value="1">중요</option>
    <option value="0">일반</option>
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
      <button type="button" onclick="goSave()">등록</button>
      <a href="Notice">취소</a>
    </div>

  </form>
</div>

<script>
  const MAX_ATTACH = 3;           // 최대 3개
  const MAX_SIZE = 10 * 1024 * 1024; // 10MB (바이트 단위)

  function addAttach() {
    const container = document.getElementById('attachContainer');
    const addBtn = document.querySelector('.add_attach_btn');
    const currentCount = container.querySelectorAll('.attach_wrapper').length;

    if (currentCount >= MAX_ATTACH) {
      alert("첨부파일은 최대 " + MAX_ATTACH + "개까지만 추가할 수 있습니다.");
      return;
    }

    const div = document.createElement('div');
    div.className = 'attach_wrapper';
    div.innerHTML = `
      <input type="file" name="attach[]" onchange="previewFile(this)">
      <span class="file_name"></span>
      <button type="button" onclick="removeAttach(this)">삭제</button>
    `;
    container.appendChild(div);

    // 3개가 되면 버튼 숨기기
    if (container.querySelectorAll('.attach_wrapper').length >= MAX_ATTACH) {
      addBtn.style.display = 'none';
    }
  }

  function removeAttach(btn) {
    const container = document.getElementById('attachContainer');
    const addBtn = document.querySelector('.add_attach_btn');

    btn.parentElement.remove();

    // 3개 미만이 되면 버튼 다시 보이게
    if (container.querySelectorAll('.attach_wrapper').length < MAX_ATTACH) {
      addBtn.style.display = 'inline-block';
    }
  }

  function previewFile(input) {
    const file = input.files[0];
    const fileNameSpan = input.parentElement.querySelector('.file_name');

    if (!file) {
      fileNameSpan.textContent = "";
      return;
    }

    // 10MB 초과 시 경고 및 초기화
    if (file.size > MAX_SIZE) {
      alert("파일 크기는 10MB를 초과할 수 없습니다.");
      input.value = ""; // 파일 선택 초기화
      fileNameSpan.textContent = "";
      return;
    }

    // 파일명 미리보기 표시
    fileNameSpan.textContent = "📎 " + file.name;
  }
</script>

</body>
</html>