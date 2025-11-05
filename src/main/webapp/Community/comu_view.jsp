<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, dto.ComuAttachmentDto, dao.ComuPostDao, dto.ComuPostDto" %>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>
<%
    dto.ComuPostDto post = (dto.ComuPostDto) request.getAttribute("post");
%>

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
  <h2 class="board_title">
  	${post.getTitle()}  
  </h2>

<div class="view_meta">
  <span class="author_cell">
    작성자: ${post.getM_name()}
  </span>
  <span class="date_cell">
    작성일: ${post.getCreate_at()}
  </span>
  <span class="view_cell">
    조회수: ${post.getHit()}
  </span>
</div>


<!-- 게시글 내용 -->
<div class="view_content">
  <label for="content" class="content_label">본문 내용</label>
  <textarea id="content" class="view_textarea" readonly>
${post.getContent()}
  </textarea>
</div>



<!-- 첨부파일 다운로드 버튼 -->
<div class="view_files">
  <button class="file_btn" id="toggleFilesBtn">첨부파일 보기</button>
  
  <!-- 첨부파일 리스트 (이미지 제외) -->
 


<script>
  function goDelete(no){
	  const postId = document.comu.post_id.value;
      if (!postId) {
          alert("게시글 번호가 없습니다.");
          return;
      }
	  comu.t_gubun.value="delete";
	  comu.method = "post";
	  comu.action = "Community";
	  comu.submit();
  }
  function goUpdate(){
		comu.t_gubun.value="update";
		comu.method = "post";
		comu.action = "Community";
		comu.submit();
	}
  function goList(){
	  	comu.t_gubun.value="list";
		comu.method = "post";
		comu.action = "Community";
		comu.submit();
  }
</script>
<form name="comu">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="post_id" value="${post.getPost_id()}">
</form>

  <!-- 하단 버튼 -->
  <div class="view_buttons">
    <button class="back_btn" onclick="goList()">목록으로</button>
    <button class="edit_btn" onclick="goUpdate()">수정</button>
    <button class="delete_btn" onclick="goDelete()">삭제</button>
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
