<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../quickMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" href="CSS/sub.css">
<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
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
    <button class="write_btn">글쓰기</button>
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
      <!-- 공지글 -->
      <tr class="notice_row">
        <td class="number_cell">공지</td>
        <td class="title">
          [공지] 자유게시판 이용 규칙 안내
          <span class="meta_icons">
            <img src="../image/coment.png" alt="댓글" class="icon_img"> 12
            <img src="../image/heart.png" alt="인기" class="icon_img"> 34
          </span>
        </td>
        <td class="author_cell">관리자</td>
        <td class="date_cell">2025-10-10</td>
        <td class="view_cell">998</td>
        <td class="favorite_cell">
  			<button class="favorite_btn" title="즐겨찾기">
   				 <img src="../image/bookMark_before.png" alt="북마크" class="icon_img">
   				 <!-- 북마크 했을 때
   				 	<img src="../image/bookMark_after.png" alt="북마크" class="icon_img">
   				  -->
  			</button>
		</td>
      </tr>

      <!-- 인기글 -->
      <tr class="pinned">
        <td class="number_cell"><img src="../image/fire.png" alt="인기" class="icon_img"></td>
        <td class="title">
          일본 워홀 꿀팁 공유
          <span class="meta_icons">
            <img src="../image/coment.png" alt="댓글" class="icon_img"> 12
            <img src="../image/heart.png" alt="인기" class="icon_img"> 34
          </span>
        </td>
        <td class="author_cell">유저A</td>
        <td class="date_cell">2025-10-19</td>
        <td class="view_cell">345</td>
        <td class="favorite_cell">
  			<button class="favorite_btn" title="즐겨찾기">
   				<img src="../image/bookMark_after.png" alt="북마크" class="icon_img">
  			</button>
		</td>
      </tr>
      <tr class="pinned">
        <td class="number_cell"><img src="../image/fire.png" alt="인기" class="icon_img"></td>
        <td class="title">
          일하는 일본어 표현 모음
          <span class="meta_icons">
            <img src="../image/coment.png" alt="댓글" class="icon_img"> 5
            <img src="../image/heart.png" alt="인기" class="icon_img"> 21
          </span>
        </td>
        <td class="author_cell">유저B</td>
        <td class="date_cell">2025-10-18</td>
        <td class="view_cell">278</td>
        <td class="favorite_cell">
  			<button class="favorite_btn" title="즐겨찾기">
   				<img src="../image/bookMark_before.png" alt="북마크" class="icon_img">
  			</button>
		</td>
      </tr>
      <tr class="pinned">
        <td class="number_cell"><img src="../image/fire.png" alt="인기" class="icon_img"></td>
        <td class="title">
          새로운 친구 찾기 프로젝트
          <span class="meta_icons">
            <img src="../image/coment.png" alt="댓글" class="icon_img"> 8
            <img src="../image/heart.png" alt="인기" class="icon_img"> 30
          </span>
        </td>
        <td class="author_cell">유저C</td>
        <td class="date_cell">2025-10-17</td>
        <td class="view_cell">261</td>
        <td class="favorite_cell">
  			<button class="favorite_btn" title="즐겨찾기">
   				<img src="../image/bookMark_after.png" alt="북마크" class="icon_img">
  			</button>
		</td>
      </tr>

      <!-- 일반글 -->
      <% for(int i=1; i<=10; i++){ %>
      <tr>
        <td class="number_cell"><%= i %></td>
        <td class="title">
          자유로운 대화 주제입니다
          <span class="meta_icons">
            <img src="../image/coment.png" alt="댓글" class="icon_img"> <%= i*2 %>
            <img src="../image/heart.png" alt="인기" class="icon_img"> <%= i*5 %>
          </span>
        </td>
        <td class="author_cell">유저<%= i %></td>
        <td class="date_cell">2025-10-20</td>
        <td class="view_cell"><%= (i*13)%200 %></td>
        <td class="favorite_cell">
  			<button class="favorite_btn" title="즐겨찾기">
   				<img src="../image/bookMark_before.png" alt="북마크" class="icon_img">
  			</button>
		</td>
      </tr>
      <% } %>
      
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
