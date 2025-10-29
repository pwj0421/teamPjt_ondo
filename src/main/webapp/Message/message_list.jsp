<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>  
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>친구 대화 목록</title>
<style>
body { background: #fff; font-family: 'Pretendard', sans-serif; color: #333; margin: 0; padding: 0; }
.mp_mypage_container { display: flex; width: 100%; min-height: 85vh; padding: 40px 70px; gap: 60px; }
.mp_mypage_content { width: 80%; padding-top: 10px; }
.mp_mypage_content h3 { font-size: 22px; font-weight: 600; margin-bottom: 25px; border-bottom: 2px solid #c89f6d; padding-bottom: 8px; color: #c89f6d; }

/* 친구 메일 리스트 */
.friend_mail_list { display: flex; flex-direction: column; gap: 15px; }
.friend_mail_card { display: flex; align-items: center; gap: 15px; background: #fff; border: 1px solid #eee; border-radius: 12px; padding: 12px 15px; transition: 0.3s; cursor: pointer; }
.friend_mail_card:hover { box-shadow: 0 2px 10px rgba(0,0,0,0.08); }
.mail_status { width: 12px; height: 12px; border-radius: 50%; }
.mail_status.unread { background: #c89f6d; }
.mail_status.read { background: #eee; }
.friend_mail_card img { width: 50px; height: 50px; border-radius: 50%; object-fit: cover; }
.mail_info { flex-grow: 1; }
.friend_nickname { font-weight: 600; font-size: 16px; color: #c89f6d; }
.last_message { font-size: 14px; color: #555; margin-top: 3px; }
.mail_date { font-size: 13px; color: #777; width: 80px; text-align: right; }
.friend_mail_card button.friend_reject { padding: 5px 10px; border-radius: 8px; border: none; font-size: 13px; font-weight: 600; cursor: pointer; background: #eee; color: #555; }
.friend_mail_card button.friend_reject:hover { background: #ccc; }

/* 모달 대화창 */
.chat_modal { 
  display: none; 
  position: fixed;
  top: 50%; 
  left: 50%; 
  transform: translate(-50%, -50%); 
  width: 650px; 
  max-width: 95%; 
  height: 550px; 
  background: #fff; 
  border-radius: 12px; 
  box-shadow: 0 4px 15px rgba(0,0,0,0.2); 
  z-index: 1000; 
  padding: 20px; 
  flex-direction: column;
}
.chat_modal.active { display: flex; }

.chat_header { font-weight: 600; font-size: 18px; margin-bottom: 10px; color: #c89f6d; display: flex; justify-content: space-between; align-items: center; }
.chat_box { flex-grow: 1; overflow-y: auto; padding: 10px; border: 1px solid #eee; border-radius: 12px; background: #fafafa; margin-bottom: 10px; }
.chat_date_label { text-align: center; font-size: 12px; color: #777; margin: 10px 0; font-weight: 500; }
.chat_message { margin: 5px 0; padding: 8px 12px; border-radius: 12px; max-width: 70%; word-break: break-word; }
.chat_message.sent { background: #c89f6d; color: #fff; margin-left: auto; }
.chat_message.received { background: #eee; color: #333; margin-right: auto; }
.chat_time { display: block; font-size: 10px; color: #777; margin-top: 2px; text-align: right; }
.chat_input { display: flex; gap: 8px; }
.chat_input input { flex-grow: 1; padding: 8px; border-radius: 8px; border: 1px solid #ccc; }
.chat_input button { padding: 8px 14px; border-radius: 8px; border: none; background: #c89f6d; color: #fff; font-weight: 600; cursor: pointer; }
.chat_input button:hover { background: #b38a5a; }
.modal_close { cursor: pointer; font-size: 16px; color: #777; }
</style>
</head>
<body>
<%@ include file="../menu/quickMenu.jsp" %>
<div class="mp_mypage_container">
  <%@ include file="../menu/mypage_menu.jsp" %>

  <div class="mp_mypage_content">
    <h3>친구 대화 목록</h3>
    <div class="friend_mail_list">
      <!-- 친구 리스트 10명 -->
      <div class="friend_mail_card" data-name="김유리"><div class="mail_status unread"></div><img src="../image/basic_profile.png" alt=""><div class="mail_info"><div class="friend_nickname">김유리</div><div class="last_message">지난번 일본 여행 사진 정말 멋졌어요!</div></div><div class="mail_date">10/25</div><button class="friend_reject">삭제</button></div>
      <div class="friend_mail_card" data-name="박준호"><div class="mail_status read"></div><img src="../image/basic_profile.png" alt=""><div class="mail_info"><div class="friend_nickname">박준호</div><div class="last_message">첫 대화를 시작해보세요!</div></div><div class="mail_date">—</div><button class="friend_reject">삭제</button></div>
      <div class="friend_mail_card" data-name="사토 루이"><div class="mail_status unread"></div><img src="../image/basic_profile.png" alt=""><div class="mail_info"><div class="friend_nickname">사토 루이</div><div class="last_message">애니 관련 추천 만화 있어요!</div></div><div class="mail_date">10/23</div><button class="friend_reject">삭제</button></div>
      <div class="friend_mail_card" data-name="이하나"><div class="mail_status read"></div><img src="../image/basic_profile.png" alt=""><div class="mail_info"><div class="friend_nickname">이하나</div><div class="last_message">이번 주 콘서트 진짜 즐거웠어요!</div></div><div class="mail_date">10/20</div><button class="friend_reject">삭제</button></div>
      <div class="friend_mail_card" data-name="오사카 히로"><div class="mail_status unread"></div><img src="../image/basic_profile.png" alt=""><div class="mail_info"><div class="friend_nickname">오사카 히로</div><div class="last_message">한국 음식점 추천 감사해요!</div></div><div class="mail_date">10/18</div><button class="friend_reject">삭제</button></div>
      <div class="friend_mail_card" data-name="정민지"><div class="mail_status read"></div><img src="../image/basic_profile.png" alt=""><div class="mail_info"><div class="friend_nickname">정민지</div><div class="last_message">첫 대화를 시작해보세요!</div></div><div class="mail_date">—</div><button class="friend_reject">삭제</button></div>
      <div class="friend_mail_card" data-name="한지훈"><div class="mail_status unread"></div><img src="../image/basic_profile.png" alt=""><div class="mail_info"><div class="friend_nickname">한지훈</div><div class="last_message">오늘 점심 뭐 먹었어요?</div></div><div class="mail_date">10/25</div><button class="friend_reject">삭제</button></div>
      <div class="friend_mail_card" data-name="나카무라 레이"><div class="mail_status read"></div><img src="../image/basic_profile.png" alt=""><div class="mail_info"><div class="friend_nickname">나카무라 레이</div><div class="last_message">만화 추천 고마워요!</div></div><div class="mail_date">10/24</div><button class="friend_reject">삭제</button></div>
      <div class="friend_mail_card" data-name="최수빈"><div class="mail_status unread"></div><img src="../image/basic_profile.png" alt=""><div class="mail_info"><div class="friend_nickname">최수빈</div><div class="last_message">이번 주말에 여행 가요!</div></div><div class="mail_date">10/23</div><button class="friend_reject">삭제</button></div>
      <div class="friend_mail_card" data-name="야마모토 켄"><div class="mail_status read"></div><img src="../image/basic_profile.png" alt=""><div class="mail_info"><div class="friend_nickname">야마모토 켄</div><div class="last_message">첫 대화를 시작해보세요!</div></div><div class="mail_date">—</div><button class="friend_reject">삭제</button></div>
    </div>
  </div>
</div>

<!-- 대화 모달 -->
<div class="chat_modal" id="chatModal">
  <div class="chat_header">
    <span id="chatFriendName">친구 이름</span>
    <span class="modal_close" id="closeModal">&times;</span>
  </div>
  <div class="chat_box" id="chatBox"></div>
  <div class="chat_input">
    <input type="text" id="chatInput" placeholder="메세지를 입력하세요">
    <button id="sendChat">전송</button>
  </div>
</div>

<script>
const weekdays = ['일','월','화','수','목','금','토'];

// 하드코딩 메시지 데이터 (10명)
const messages = {
  '김유리': [
    {sender:'friend', text:'안녕하세요!', datetime:'2025-10-25 10:00'},
    {sender:'me', text:'지난번 일본 여행 사진 정말 멋졌어요!', datetime:'2025-10-25 10:05'},
    {sender:'friend', text:'주말에 만날래요?', datetime:'2025-10-26 14:20'}
  ],
  '박준호':[ {sender:'friend', text:'첫 대화를 시작해보세요!', datetime:'2025-10-24 09:15'} ],
  '사토 루이':[ {sender:'friend', text:'애니 관련 추천 만화 있어요!', datetime:'2025-10-23 15:00'} ],
  '이하나':[ {sender:'friend', text:'이번 주 콘서트 진짜 즐거웠어요!', datetime:'2025-10-20 18:30'} ],
  '오사카 히로':[ {sender:'friend', text:'한국 음식점 추천 감사해요!', datetime:'2025-10-18 12:45'} ],
  '정민지':[ {sender:'friend', text:'첫 대화를 시작해보세요!', datetime:'2025-10-24 10:00'} ],
  '한지훈':[ {sender:'friend', text:'오늘 점심 뭐 먹었어요?', datetime:'2025-10-25 11:20'} ],
  '나카무라 레이':[ {sender:'friend', text:'만화 추천 고마워요!', datetime:'2025-10-24 16:10'} ],
  '최수빈':[ {sender:'friend', text:'이번 주말에 여행 가요!', datetime:'2025-10-23 09:45'} ],
  '야마모토 켄':[ {sender:'friend', text:'첫 대화를 시작해보세요!', datetime:'2025-10-22 13:30'} ]
};

function formatDateLabel(dateStr){
  const d = new Date(dateStr);
  const y = d.getFullYear();
  const m = String(d.getMonth()+1).padStart(2,'0');
  const day = String(d.getDate()).padStart(2,'0');
  const weekday = weekdays[d.getDay()];
  return `${y}-${m}-${day} ${weekday}`;
}
function formatTime(dateStr){
  const d = new Date(dateStr);
  const h = String(d.getHours()).padStart(2,'0');
  const min = String(d.getMinutes()).padStart(2,'0');
  return `${h}:${min}`;
}

document.querySelectorAll('.friend_mail_card').forEach(card=>{
  card.addEventListener('click', ()=>{
    const name = card.getAttribute('data-name');
    const chatModal = document.getElementById('chatModal');
    const chatBox = document.getElementById('chatBox');
    const chatFriendName = document.getElementById('chatFriendName');

    chatFriendName.textContent = name;
    chatBox.innerHTML = '';

    let lastDate = '';
    (messages[name] || []).forEach(msg=>{
      const msgDate = msg.datetime.split(' ')[0];
      if(msgDate !== lastDate){
        const label = document.createElement('div');
        label.className = 'chat_date_label';
        label.textContent = formatDateLabel(msg.datetime);
        chatBox.appendChild(label);
        lastDate = msgDate;
      }
      const div = document.createElement('div');
      div.className = 'chat_message '+(msg.sender==='me'?'sent':'received');
      div.innerHTML = msg.text + '<span class="chat_time">'+formatTime(msg.datetime)+'</span>';
      chatBox.appendChild(div);
    });

    chatModal.classList.add('active');
    chatBox.scrollTop = chatBox.scrollHeight;
  });
});

document.getElementById('closeModal').addEventListener('click', ()=>{
  document.getElementById('chatModal').classList.remove('active');
});

document.getElementById('sendChat').addEventListener('click', ()=>{
  const input = document.getElementById('chatInput');
  const text = input.value.trim();
  if(!text) return;
  const name = document.getElementById('chatFriendName').textContent;
  const chatBox = document.getElementById('chatBox');

  const now = new Date();
  const datetime = now.getFullYear()+'-'+String(now.getMonth()+1).padStart(2,'0')+'-'+String(now.getDate()).padStart(2,'0')+' '+
                   String(now.getHours()).padStart(2,'0')+':'+String(now.getMinutes()).padStart(2,'0');

  const lastLabel = chatBox.querySelector('.chat_date_label:last-of-type');
  if(!lastLabel || lastLabel.textContent.split(' ')[0] !== datetime.split(' ')[0]){
    const label = document.createElement('div');
    label.className = 'chat_date_label';
    label.textContent = formatDateLabel(datetime);
    chatBox.appendChild(label);
  }

  const div = document.createElement('div');
  div.className = 'chat_message sent';
  div.innerHTML = text + '<span class="chat_time">'+formatTime(datetime)+'</span>';
  chatBox.appendChild(div);
  input.value = '';
  chatBox.scrollTop = chatBox.scrollHeight;

  if(!messages[name]) messages[name] = [];
  messages[name].push({sender:'me', text:text, datetime:datetime});
});
</script>
</body>
</html>
