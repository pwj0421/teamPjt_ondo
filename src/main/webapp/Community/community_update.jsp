<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dao.ComuPostDao, dto.ComuPostDto, dao.ComuCommentDao, dto.ComuCommentDto, java.util.List" %>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>

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


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>자유게시판 글쓰기</title>
 
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/sub.css">
  <script type="text/javascript">
	  function goUpdate(){
		  if(confirm("수정 하시겠습니까?")){
			  frm.t_gubun.value="DBUpdate";
			  frm.action="Community";
			  frm.submit();
		  }
	  }
  </script>
</head>
<body>

	<div class="write_container">
	<div class="write_header">자유게시판 글쓰기</div>
	
	  <!-- 글쓰기 폼 -->
	  <form class="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="postId" value="${post.getPost_id() }">
		<input type="hidden" name="t_gubun">
			<label for="title">제목</label>
				<input type="text" name="title" id="title" value="${post.getTitle() }" required>
			
			<label for="content">내용</label>
				<textarea name="content" id="content" required>${post.getContent() }</textarea>
		    
		    <!-- 파일 첨부 영역 -->
		<div class="file_upload_group">
		  <label for="file">파일 첨부</label>
		  <input type="file" name="file" id="file">
		</div>
		
	    <div class="write_btn_group">
	      <button type="button" onclick="goUpdate()" class="submit_btn">등록</button>
	      <button type="button" class="cancel_btn" onclick="history.back()">취소</button>
	    </div>
	  </form>
	</div>

</body>
</html>
