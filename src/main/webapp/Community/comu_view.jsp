<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, dao.ComuAttachmentDao, dto.ComuAttachmentDto, dao.ComuPostDao, dto.ComuPostDto" %>
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
  <h2 class="board_title"><%= ((ComuPostDto)request.getAttribute("post")).getTitle() %></h2>

<div class="view_meta">
  <span class="author_cell">
    작성자: <%= ((ComuPostDto)request.getAttribute("post")).getM_name() %>
  </span>
  <span class="date_cell">
    작성일: <%= ((ComuPostDto)request.getAttribute("post")).getCreate_at() %>
  </span>
  <span class="view_cell">
    조회수: <%= ((ComuPostDto)request.getAttribute("post")).getHit() %>
  </span>
</div>


<!-- 게시글 내용 -->
<div class="view_content">
  <p>
    <%= ((ComuPostDto)request.getAttribute("post")).getContent() %>
  </p>

  <div class="attached_images">
    <% 
      List<ComuAttachmentDto> attachments = (List<ComuAttachmentDto>) request.getAttribute("attachments");
      for(ComuAttachmentDto a : attachments){
        if(a.getFile_type().matches("png|jpg|jpeg|gif")){
    %>
        <img src="<%= request.getContextPath() + "/" + a.getFile_path() %>" 
             alt="첨부 이미지" class="post_image">
    <% 
        }
      } 
    %>
  </div>
</div>


<!-- 첨부파일 다운로드 버튼 -->
<div class="view_files">
  <button class="file_btn" id="toggleFilesBtn">첨부파일 보기</button>
  
  <!-- 첨부파일 리스트 (이미지 제외) -->
 


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
