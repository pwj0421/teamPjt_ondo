<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<link rel="stylesheet" href="CSS/free_write.css">
<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
</head>
<body>

<div class="write_container">
  <h2 class="write_title">자유게시판 글쓰기</h2>

  <form action="FreeBoardWriteServlet" method="post" enctype="multipart/form-data">

   <div class="form_row">
      <input type="text" name="title" placeholder="제목을 입력하세요" class="title_input">
  
    </div>


    <!-- 내용 -->
    <div class="form_group">
      <label for="content">내용</label>
      <textarea id="content" name="content" placeholder="내용을 입력하세요"></textarea>
    </div>


      <!-- 이미지 미리보기 -->
      <div class="attached_images" id="imagePreview"></div>
      

	<div class="form_section notice_write_attach">
      <label>첨부파일</label>
      <div id="attachContainer">
      </div>
      <button type="button" class="add_attach_btn" onclick="addAttach()">+ 파일 추가</button>
      
    </div>
    <div class="form_actions">
      <button type="submit" class="submit_btn">작성 완료</button>
      <button type="button" class="cancel_btn" onclick="history.back()">취소</button>
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

<script>
const toggleBtn = document.getElementById('toggleFilesBtn');
const fileList = document.getElementById('fileList');
const imagePreview = document.getElementById('imagePreview');

toggleBtn.addEventListener('click', () => {
  if(fileList.style.display === 'none') {
    fileList.style.display = 'flex';
  } else {
    fileList.style.display = 'none';
  }
});

// 첨부파일 input 추가 및 이미지 미리보기
fileList.addEventListener('change', (e) => {
  if(e.target.tagName === 'INPUT' && e.target.type === 'file') {
    const file = e.target.files[0];
    if(file) {
      // 이미지 파일이면 미리보기
      if(file.type.startsWith('image/')) {
        const img = document.createElement('img');
        img.src = URL.createObjectURL(file);
        img.classList.add('post_image');
        imagePreview.appendChild(img);
      }
      // 새로운 input 추가
      const newInput = document.createElement('input');
      newInput.type = 'file';
      newInput.name = 'files';
      newInput.classList.add('file_input');
      fileList.appendChild(newInput);
    }
  }
});
</script>

</body>
</html>
