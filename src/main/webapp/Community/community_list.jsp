<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../quickMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
</head>
<script>
function goPage(svl, page){
	Community.t_gubun.value=page;
	Community.method="POST";
	Community.action=svl;
	Community.submit();
}
</script>
<body>
<form name="Community">
	<input type="hidden" name="t_gubun">
</form>
<div class="free_container">

  <div class="board_header">
    <h2 class="board_title">자유게시판</h2>
    <button class="write_btn" onclick="goPage('Community','write')">글쓰기</button>
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
        	<a href="javascript:goPage('Community','view')">
          		[공지] 자유게시판 이용 규칙 안내
        	</a>
          <span class="meta_icons">
            <img src="image/coment.png" alt="댓글" class="icon_img"> 12
            <img src="image/heart.png" alt="인기" class="icon_img"> 34
          </span>
        </td>
        <td class="author_cell">관리자</td>
        <td class="date_cell">2025-10-10</td>
        <td class="view_cell">998</td>
        <td class="favorite_cell">
  			<button class="favorite_btn" title="즐겨찾기">
   				 <img src="image/bookMark_before.png" alt="북마크" class="icon_img">
   				 <!-- 북마크 했을 때
   				 	<img src="image/bookMark_after.png" alt="북마크" class="icon_img">
   				  -->
  			</button>
		</td>
      </tr>

      <!-- 인기글 -->
      <tr class="pinned" >
        <td class="number_cell"><img src="image/fire.png" alt="인기" class="icon_img"></td>
        <td class="title">
        	<a href="javascript:goPage('Community','view')">
          	일본 워홀 꿀팁 공유
          	</a>
          <span class="meta_icons">
            <img src="image/coment.png" alt="댓글" class="icon_img"> 12
            <img src="image/heart.png" alt="인기" class="icon_img"> 34
          </span>
        </td>
        <td class="author_cell">유저A</td>
        <td class="date_cell">2025-10-19</td>
        <td class="view_cell">345</td>
        <td class="favorite_cell">
  			<button class="favorite_btn" title="즐겨찾기">
   				<img src="image/bookMark_after.png" alt="북마크" class="icon_img">
  			</button>
		</td>
      </tr>
      <tr class="pinned" onclick="goPage('Community','view')">
        <td class="number_cell"><img src="image/fire.png" alt="인기" class="icon_img"></td>
        <td class="title">
        	<a href="javascript:goPage('Community','view')">
          		일하는 일본어 표현 모음
          	</a>
          <span class="meta_icons">
            <img src="image/coment.png" alt="댓글" class="icon_img"> 5
            <img src="image/heart.png" alt="인기" class="icon_img"> 21
          </span>
        </td>
        <td class="author_cell">유저B</td>
        <td class="date_cell">2025-10-18</td>
        <td class="view_cell">278</td>
        <td class="favorite_cell">
  			<button class="favorite_btn" title="즐겨찾기">
   				<img src="image/bookMark_before.png" alt="북마크" class="icon_img">
  			</button>
		</td>
      </tr>
      <tr class="pinned" onclick="goPage('Community','view')">
        <td class="number_cell"><img src="image/fire.png" alt="인기" class="icon_img"></td>
        <td class="title">
        	<a href="javascript:goPage('Community','view')">
          		새로운 친구 찾기 프로젝트
          	</a>
          <span class="meta_icons">
            <img src="image/coment.png" alt="댓글" class="icon_img"> 8
            <img src="image/heart.png" alt="인기" class="icon_img"> 30
          </span>
        </td>
        <td class="author_cell">유저C</td>
        <td class="date_cell">2025-10-17</td>
        <td class="view_cell">261</td>
        <td class="favorite_cell">
  			<button class="favorite_btn" title="즐겨찾기">
   				<img src="image/bookMark_after.png" alt="북마크" class="icon_img">
  			</button>
		</td>
      </tr>

      <!-- 일반글 -->
      <% for(int i=1; i<=10; i++){ %>
      <tr onclick="goPage('Community','view')">
        <td class="number_cell"><%= i %></td>
        <td class="title">
        	<a href="javascript:goPage('Community','view')">
          		자유로운 대화 주제입니다
          	</a>
          <span class="meta_icons">
            <img src="image/coment.png" alt="댓글" class="icon_img"> <%= i*2 %>
            <img src="image/heart.png" alt="인기" class="icon_img"> <%= i*5 %>
          </span>
        </td>
        <td class="author_cell">유저<%= i %></td>
        <td class="date_cell">2025-10-20</td>
        <td class="view_cell"><%= (i*13)%200 %></td>
        <td class="favorite_cell">
  			<button class="favorite_btn" title="즐겨찾기">
   				<img src="image/bookMark_before.png" alt="북마크" class="icon_img">
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
