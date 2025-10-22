<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<link rel="stylesheet" href="CSS/sub.css">
<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
</head>
<body>

<div class="free_container">

  <!-- 게시글 헤더 -->
  <div class="board_header">
    <h2 class="board_title">제목은 여기에 적으면 됩니다람쥐</h2>
    <button class="favorite_btn" title="즐겨찾기">
   				 <img src="image/bookMark_before.png" alt="북마크" class="icon_img">
   				 <!-- 북마크 했을 때
   				 	<img src="../image/bookMark_after.png" alt="북마크" class="icon_img">
   				  -->
  			</button>
  </div>

  <!-- 게시글 메타 정보 -->
  <div class="view_meta">
    <span class="author_cell">작성자: 유저A</span>
    <span class="date_cell">작성일: 2025-10-20</span>
    <span class="view_cell">조회수: 123</span>
    <span class="meta_icons">
      <img src="image/coment.png" alt="댓글" class="icon_img"> 12
      <img src="image/heart.png" alt="추천" class="icon_img"> 34
    </span>
  </div>

<!-- 게시글 내용 -->
<div class="view_content">
  <p>
    	게시글 내용이 들어가는 영역입니다 듀아아아아아아아아아아아아아
  </p>

  <!-- 이미지 첨부파일 자동 표시 -->
  <div class="attached_images">
    <%-- 이미지 첨부파일 예시 --%>
    <img src="image/sample.png" alt="첨부 이미지" class="post_image">
    <%-- 다른 이미지가 있으면 반복해서 추가 가능 --%>
  </div>
</div>

<!-- 첨부파일 다운로드 버튼 -->
<div class="view_files">
  <button class="file_btn" id="toggleFilesBtn">첨부파일 보기</button>
  
  <!-- 첨부파일 리스트 (이미지 제외) -->
  <div class="file_list" id="fileList" style="display:none;">
    <a href="image/sample.pdf" download>첨부파일1.pdf</a>
    <a href="image/sample2.docx" download>첨부파일2.docx</a>
  </div>
</div>

<script>
  // 첨부파일 토글
  const toggleBtn = document.getElementById('toggleFilesBtn');
  const fileList = document.getElementById('fileList');

  toggleBtn.addEventListener('click', () => {
    if(fileList.style.display === 'none') {
      fileList.style.display = 'flex';
    } else {
      fileList.style.display = 'none';
    }
  });
</script>


  <!-- 하단 버튼 -->
  <div class="view_buttons">
    <button class="back_btn" onclick="">목록으로</button>
    <button class="edit_btn" onclick="">수정</button>
    <button class="delete_btn"onclick="">삭제</button>
  </div>
  
<div class="like_area">
  <button class="like_btn" onclick="increaseLike(this)">
    👍 추천
    <span class="like_count">0</span>
  </button>
</div>
	
  <!-- 댓글 영역 -->
  <div class="comments_section">
    <h3 class="comments_title">댓글</h3>

   <!-- 댓글 작성 -->
    <div class="comment_write">
      <input type="text" class="comment_input" placeholder="댓글을 입력하세요">
      <button class="comment_btn">등록</button>
    </div>
  </div>
  
    <!-- 댓글 리스트 -->
    <div class="comment_list">
      <div class="comment_item">
        <span class="comment_author">유저B</span>
        <span class="comment_date">2025-10-20</span>
        <p class="comment_text">좋은 정보 감사합니다!</p>

      </div>

      <div class="comment_item">
        <span class="comment_author">유저C</span>
        <span class="comment_date">2025-10-19</span>
        <p class="comment_text">저도 참고할게요!</p>

      </div>
    </div>

 

</div>

<script>
function increaseLike(btn){
	  const countSpan = btn.querySelector('.like_count');
	  let count = parseInt(countSpan.textContent);
	  count++;
	  countSpan.textContent = count;
	  btn.style.background = '#c89f6d';
	  btn.style.color = '#fff';
	}
</script>
</body>
</html>
