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
  menu.style.display = (menu.style.display === "block") ? "none" : "block";
}
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
    </div>
  </div>

  <div class="menu-item">
    <button onclick="toggleSubMenu('msgMenu')">메시지</button>
    <div class="sub-menu" id="msgMenu">
      <a href="javascript:goPage('Member','requestList')">요청목록</a>
      <a href="javascript:goPage('Member','messageBox')">쪽지함</a>
    </div>
  </div>
</div>
