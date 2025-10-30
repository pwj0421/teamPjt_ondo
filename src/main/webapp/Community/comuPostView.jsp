<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ComuPostDao, dto.ComuPostDto, dao.ComuCommentDao, dto.ComuCommentDto, java.util.List" %>
<%@ include file="../common_header.jsp" %>
<%@ include file="../quickMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<link rel="stylesheet" href="CSS/sub.css">
<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
</head>
<body>

<%
    // ✅ URL에서 post_id 받아오기
    String postIdParam = request.getParameter("post_id");
    if (postIdParam == null) {
        out.println("<script>alert('잘못된 접근입니다.'); location.href='comuPostList.jsp';</script>");
        return;
    }

    int post_id = Integer.parseInt(postIdParam);

    // ✅ DAO 호출해서 데이터 가져오기
    ComuPostDao dao = new ComuPostDao();
    ComuPostDto post = dao.getPostById(post_id);
    
    if (post == null) {
        out.println("<script>alert('게시글을 찾을 수 없습니다.'); location.href='comuPostList.jsp';</script>");
        return;
    }
%>

<div class="free_container">

  <!-- 게시글 헤더 -->
  <div class="board_header">
    <h2 class="board_title"><%= post.getTitle() %></h2>
    <button class="favorite_btn" title="즐겨찾기">
      <img src="../image/bookMark_before.png" alt="북마크" class="icon_img">
    </button>
  </div>

  <!-- 게시글 메타 정보 -->
  <div class="view_meta">
    <span class="author_cell">작성자: <%= post.getM_name() %></span>
    <span class="date_cell">작성일: <%= post.getCreate_at() %></span>
    <span class="view_cell">조회수: <%= post.getHit() %></span>
  </div>

  <!-- 게시글 내용 -->
  <div class="view_content">
    <p><%= post.getContent().replaceAll("\n", "<br>") %></p>
  </div>

  <!-- 첨부파일 토글 예시 -->
  <div class="view_files">
    <button class="file_btn" id="toggleFilesBtn">첨부파일 보기</button>
    <div class="file_list" id="fileList" style="display:none;">
      <a href="../upload/sample.pdf" download>첨부파일1.pdf</a>
      <a href="../upload/sample2.docx" download>첨부파일2.docx</a>
    </div>
  </div>

  <script>
    // 첨부파일 토글
    document.getElementById('toggleFilesBtn').addEventListener('click', () => {
      const list = document.getElementById('fileList');
      list.style.display = (list.style.display === 'none') ? 'flex' : 'none';
    });
  </script>

  <!-- 하단 버튼 -->
  <div class="view_buttons">
    <button class="back_btn" onclick="location.href='comuPostList.jsp'">목록으로</button>
    <button class="edit_btn" onclick="location.href='comuPostEdit.jsp?post_id=<%= post.getPost_id() %>'">수정</button>
    <button class="delete_btn" onclick="if(confirm('삭제하시겠습니까?')) location.href='comuPostDelete.jsp?post_id=<%= post.getPost_id() %>';">삭제</button>
  </div>

  <!-- ✅ 댓글 영역 -->
<%   
	int C_post_id = Integer.parseInt(request.getParameter("post_id"));
	ComuPostDao C_dao = new ComuPostDao();
	ComuPostDto C_post = dao.getPostById(post_id);

	// ✅ 여기서 commentList 생성 (DAO 호출 결과를 저장)
	ComuCommentDao cDao = new ComuCommentDao();
	List<ComuCommentDto> commentList = cDao.getCommentsByPostId(post_id);
%>
<div class="comments_section">
  <h3 class="comments_title">댓글 (<%= commentList.size() %>)</h3>

  <!-- 댓글 작성 -->
  <form action="comuCommentInsert.jsp" method="post" class="comment_write">
    <input type="hidden" name="post_id" value="<%= post_id %>">
    <input type="text" name="comment_content" class="comment_input" placeholder="댓글을 입력하세요" required>
    <button type="submit" class="comment_btn">등록</button>
  </form>

  <!-- ✅ 댓글 리스트 -->
  <div class="comment_list">
    <% if (commentList.isEmpty()) { %>
      <p>등록된 댓글이 없습니다.</p>
    <% } else {
        for (ComuCommentDto c : commentList) { %>
          <div class="comment_item">
            <span class="comment_author"><%= c.getM_name() %></span>
            <span class="comment_date"><%= c.getCreate_at() %></span>
            <p class="comment_text"><%= c.getComment_content() %></p>
          </div>
    <%  }
      } %>
  </div>
</div>

</div>
</body>
</html>
