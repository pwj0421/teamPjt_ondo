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
		// 제목, 내용 체크
		if (checkValue(noti.title, "제목 입력!")) return;
		if (checkValue(noti.content, "내용 입력!")) return;
		
		// 첨부파일 유효성 검사
		const attachInputs = document.querySelectorAll('input[type="file"][name="attach"]');
		let hasEmptyFile = false;

		// 첨부 영역이 존재할 때만 검사
		if (attachInputs.length > 0) {
			attachInputs.forEach(input => {
				if (!input.files || input.files.length === 0) {
					hasEmptyFile = true;
				}
			});
		}

		if (hasEmptyFile) {
			alert("추가된 모든 파일 칸에 파일을 선택해주세요.");
			return;
		}

		// 전송 설정
		noti.t_gubun.value = "save";
		noti.method = "post";
		noti.action = "Notice?t_gubun=save"; // multipart 전송용
		noti.submit();
	}
</script>
</head>
<body>
  <div class="notice_write">
  <h2>공지사항 작성</h2>
  <form name="noti" enctype="multipart/form-data">
    <input type="hidden" name="t_gubun">
    
    <div class="form_section">
      <label>제목</label>
      <input type="text" name="title" placeholder="공지사항 제목을 입력하세요" required autofocus>
    </div>

  <div class="form_row">
  <label style="margin-right:10px;">중요도</label>
  <select name="important" required style="width:120px; margin-right:30px;">
<!--      <option value="">선택</option>		-->
	<option value="0" <c:if test="${t_dto.getImportant() eq '0'}">selected</c:if>>일반</option>
    <option value="1" <c:if test="${t_dto.getImportant() eq '1'}">selected</c:if>>중요</option>
  </select>

  <label style="margin-right:10px;">공지 종류</label>
  <select name="type" required style="width:120px;">
<!-- 	 <option value="">선택</option> 		-->
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
      <label>첨부파일 (등록 후 수정 불가)</label>
      <div id="attachContainer"></div>
      <button type="button" class="add_attach_btn" onclick="addAttach()">+ 파일 추가</button>
    </div>

    <div class="notice_write_buttons">
      <button type="button" onclick="goSave()">등록</button>
      <a href="Notice">취소</a>
    </div>

  </form>
</div>

<script>
  const MAX_ATTACH = 3;
  const MAX_SIZE = 10 * 1024 * 1024; // 10MB

  function addAttach() {
    const container = document.getElementById('attachContainer');
    const addBtn = document.querySelector('.add_attach_btn');
    const currentCount = container.querySelectorAll('.attach_wrapper').length;

    if (currentCount >= MAX_ATTACH) {
      alert("첨부파일은 최대 " + MAX_ATTACH + "개까지만 추가할 수 있습니다.");
      return;
    }

    // ✅ attach_1, attach_2, attach_3 형식으로 이름 지정
    const attachNum = currentCount + 1;
    const div = document.createElement('div');
    div.className = 'attach_wrapper';
    
   // alert(attachNum);

	    div.innerHTML = `
	      <input type="file" name="attach" onchange="previewFile(this)">
	      <span class="file_name"></span>
	      <button type="button" onclick="removeAttach(this)">삭제</button>
	    `;
	    container.appendChild(div);

    // 3개가 되면 버튼 숨김
    if (attachNum >= MAX_ATTACH) {
      addBtn.style.display = 'none';
    }
  }

  function removeAttach(btn) {
    const container = document.getElementById('attachContainer');
    const addBtn = document.querySelector('.add_attach_btn');
    btn.parentElement.remove();

    // 삭제 후 파일이 3개 미만이면 추가 버튼 다시 표시
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

    if (file.size > MAX_SIZE) {
      alert("파일 크기는 10MB를 초과할 수 없습니다.");
      input.value = ""; 
      fileNameSpan.textContent = "";
      return;
    }

    fileNameSpan.textContent = "📎 " + file.name;
  }
</script>

</body>
</html>
