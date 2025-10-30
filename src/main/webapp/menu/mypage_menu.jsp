<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.side-menu {
  width: 20%;
  padding-top: 20px;
  border-right: 1px solid #eee;
}

.side-menu h2 {
  font-size: 22px;
  margin-bottom: 30px;
  font-weight: 700;
  color: #c89f6d;
}

.menu-item {
  margin-bottom: 20px;
}

.menu-item > button {
  background: none;
  border: none;
  font-size: 17px;
  font-weight: 600;
  cursor: pointer;
  width: 100%;
  text-align: left;
  color: #444;
  transition: 0.2s;
}

.menu-item > button:hover {
  color:#c89f6d;
}

.sub-menu {
  display: none;
  margin-top: 8px;
  margin-left: 15px;
  border-left: 2px solid #c89f6d;
  padding-left: 12px;
}

.sub-menu a {
  display: block;
  text-decoration: none;
  color: #666;
  font-size: 15px;
  margin: 6px 0;
  transition: 0.2s;
}

.sub-menu a:hover {
  color: #c89f6d;
}
</style>

<script>
function goPage(svl, page){
	mpMenu.t_gubun.value=page;
	mpMenu.method="POST";
	mpMenu.action=svl;
	mpMenu.submit();
}

// 소메뉴 열기/닫기 토글
function toggleSubMenu(id){
  const menu = document.getElementById(id);
  const isOpen = menu.style.display === "block";

  // 상태 토글
  menu.style.display = isOpen ? "none" : "block";

  // 열린 상태 기억 (localStorage)
  if(isOpen){
    localStorage.removeItem("openSubMenu");
  } else {
    localStorage.setItem("openSubMenu", id);
  }
}

// 페이지 로드 시 이전에 열려있던 메뉴 복원
window.addEventListener("DOMContentLoaded", function(){
  const openMenuId = localStorage.getItem("openSubMenu");
  if(openMenuId){
    const menu = document.getElementById(openMenuId);
    if(menu) menu.style.display = "block";
  }
});
</script>


<form name="mpMenu">
	<input type="hidden" name="t_gubun">
</form>

<div class="side-menu">
  <h2>마이페이지</h2>

  <div class="menu-item">
    <button onclick="toggleSubMenu('infoMenu')">내 정보</button>
    <div class="sub-menu" id="infoMenu">
      <a href="javascript:goPage('Member','myInfo')">개인정보</a>
      <a href="javascript:goPage('Member','matchInfo')">매칭정보</a>
      <a href="javascript:goPage('Member','newPassword')">비밀번호 변경</a>
    </div>
  </div>

  <div class="menu-item">
    <button onclick="toggleSubMenu('msgMenu')">메시지</button>
    <div class="sub-menu" id="msgMenu">
      <a href="javascript:goPage('Message','requestlist')">받은 요청목록</a>
      <a href="javascript:goPage('Message','myRequest')">보낸 요청목록</a>
      <a href="javascript:goPage('Message','Messagelist')">쪽지함</a>
    </div>
  </div>
</div>
