<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, dao.ComuPostDao, dto.ComuPostDto" %>
<%
    ComuPostDao dao = new ComuPostDao();
    List<ComuPostDto> postList = dao.getPostList();
%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" href="CSS/sub.css">
<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	function goWrite(){
		comu.t_gubun.value="write";
		comu.method = "post";
		comu.action = "Community";
		comu.submit();
	}
	function goView(no){
		comu.post_id.value=no;
		comu.t_gubun.value="view";
		comu.method = "post";
		comu.action = "Community";
		comu.submit();
	}
</script>
<form name="comu">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="post_id">
</form>
</head>
<style>
	
/*자유게시판*/
.free_container {
  width: 85%;
  max-width: 1100px;
  margin: 10px auto;
  background: #fff;
  border-radius: 16px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.08);
  padding: 40px;
  border-left: 4px solid #c89f6d;
}

/* 헤더 */
.board_header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
.board_title { font-size: 26px; font-weight: 600; color: #333; }
.write_btn { background: #c89f6d; color: #fff; border:none; border-radius:6px; padding:8px 16px; cursor:pointer; font-weight:500; transition:0.2s; }
.write_btn:hover { background:#d8bb98; }

/* 테이블 */
.free_table { width:100%; border-collapse:collapse; text-align:center; font-size:15px; }
.free_table th { background:#f5f5f5; padding:12px 0; border-bottom:2px solid #ddd; }
.free_table td { padding:10px 8px; border-bottom:1px solid #eee; }
.free_table tr:hover td { background:#f9f9f9; }
.title { text-align:left; padding-left:10px; }

/* 컬럼 */
.number_cell, .author_cell, .date_cell, .view_cell { text-align:center; vertical-align:middle; color:#555; }

/* 제목 뒤 댓글/추천 */
.meta_icons {
  display:inline-flex;
  align-items:center;
  gap:8px;
  font-size:13px;
  color:#777;
  margin-left:12px;
}
.meta_icons .icon_img { width:16px; height:16px; vertical-align:middle; }
.meta_icons .like_icon { width:16px; height:16px; vertical-align:middle; color:#ff6b6b; }

/* 공지글 */
.notice_row { background:#ffecec; font-weight:600; color:#d33c3c; }

/* 인기글 */
.pinned { background:#f7f7f7; font-weight:500; color:#333; }

/* 페이지네이션 */
.pagination { text-align:center; margin-top:25px; }
.pagination a { display:inline-block; margin:0 5px; padding:6px 11px; border:1px solid #ccc; border-radius:6px; text-decoration:none; color:#333; font-size:14px; }
.pagination a.active { background:#c89f6d; color:#fff; border-color:#c89f6d; }
.pagination a:hover { background:#eee; }

/* 검색박스 */
.search_box { display:flex; justify-content:center; gap:10px; margin-top:30px; }
.search_box input { padding:8px 10px; border:1px solid #ccc; border-radius:6px; outline:none; }
.search_box .search_title { width:200px; }
.search_box .search_author { width:120px; }
.search_btn { padding:8px 15px; border:none; background:#c89f6d; color:#fff; font-weight:500; border-radius:6px; cursor:pointer; transition:0.2s; }
.search_btn:hover { background:#d8bb98; }

/* 반응형 */
@media (max-width:768px) {
  .free_container { width:95%; padding:25px; }
  .board_header { flex-direction: column; align-items:flex-start; }
  .write_btn { margin-top:10px; }
  .free_table th:nth-child(3),
  .free_table td:nth-child(3),
  .free_table th:nth-child(4),
  .free_table td:nth-child(4),
  .free_table th:nth-child(5),
  .free_table td:nth-child(5) { display:none; } /* 작성자, 작성일, 조회수 숨김 */
  .search_box { flex-direction: column; gap:6px; }
  .search_box input, .search_btn { width:100%; }
}

.favorite_cell { text-align:center; }
.favorite_btn {
  background:none;
  border:none;
  cursor:pointer;
  font-size:16px;
  color:#ccc; /* 기본 회색 */
  transition: 0.2s;
}

.favorite_btn:hover {
  color: #f1c40f; /* 노란색 */
}

.favorite_btn.active {
  color: #f1c40f; /* 즐겨찾기 된 상태 */
}
	
</style>
<body>

<div class="free_container">

  <div class="board_header">
    <h2 class="board_title">자유게시판</h2>
    <button type="button" 
        class="write_btn"
        onclick="goWrite()">
  		글쓰기
	</button>
  </div>

  <!-- 게시글 리스트 -->
  <table class="free_table">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
        <th>북마크</th>
      </tr>
    </thead>
    <tbody>
<% if(postList == null || postList.isEmpty()) { %>
    <tr><td colspan="6">등록된 게시글이 없습니다.</td></tr>
<% } else {
       for(ComuPostDto dto : postList) { %>
      <tr>
        <td class="number_cell"><%= dto.getPost_id() %></td>
        <td class="title">
          <a href="javascript:goView('<%dto.getPost_id()%>')">
              <%= dto.getTitle() %>
          </a>
        </td>
        <td class="author_cell"><%= dto.getM_name() %></td>
        <td class="date_cell"><%= dto.getCreate_at() %></td>
        <td class="view_cell"><%= dto.getHit() %></td>
        <td class="favorite_cell">
          <button class="favorite_btn" title="즐겨찾기">
            <img src="../image/bookMark_before.png" alt="북마크" class="icon_img">
          </button>
        </td>
      </tr>
<% } } %>
</tbody>
  </table>

  <!-- 페이지네이션 -->
  <div class="pagination">
    <a href="#" class="active">1</a>
    <a href="#">2</a>
    <a href="#">3</a>
    <a href="#">></a>
  </div>

  <!-- 검색 영역 -->
  <div class="search_box">
  	<select>
  		<option>게시글</option>
  		<option>작성자</option>
  	</select>
    <input type="text" class="search_title" placeholder="검색">
    <button type="button" class="search_btn">검색</button>
  </div>

</div>

</body>
</html>
