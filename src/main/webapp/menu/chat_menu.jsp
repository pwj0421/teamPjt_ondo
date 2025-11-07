<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
/* 왼쪽 메뉴 컨테이너 */
.chat_side_menu {
  width: 200px;
  display: flex;
  flex-direction: column;
  gap: 15px;
  background: #fff;
  border: 1px solid #eee;
  border-radius: 12px;
  padding: 20px 15px;
  height: fit-content;
}

/* 각 탭 */
.chat_tab {
  padding: 10px;
  text-align: center;
  border-radius: 8px;
  font-weight: 600;
  color: #555;
  cursor: pointer;
  transition: 0.2s;
  border: 1px solid #eee;
}

/* hover 효과 */
.chat_tab:hover {
  background: #f7f1e8;
  color: #c89f6d;
}

/* 활성화된 탭 */
.chat_tab.active {
  background: #c89f6d;
  color: #fff;
}
</style>

<script>
function goChatPage(gubun){
    chatMenu.t_gubun.value = gubun;
    chatMenu.method = "post";
    chatMenu.action = "Chat";
    chatMenu.submit();
}
</script>

<form name="chatMenu">
    <input type="hidden" name="t_gubun">
</form>

    <div class="chat_tab ${menuTap == 'chatReceived' ? 'active' : ''}" 
         onclick="goChatPage('chatReceived')">받은 요청</div>
    <div class="chat_tab ${menuTap == 'myRequest' ? 'active' : ''}" 
         onclick="goChatPage('myRequest')">보낸 요청</div>
    <div class="chat_tab ${menuTap == 'MessageList' ? 'active' : ''}" 
         onclick="goChatPage('MessageList')">채팅방</div>

