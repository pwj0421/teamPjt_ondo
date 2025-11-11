<h1 align="center">🌟 TEAM_ONDO 🌟</h1>

<p align="center">
  <strong>Java + Oracle 기반 한일 정보교환 플랫폼</strong><br/>
  <img src="https://img.shields.io/badge/Java-25-red?logo=openjdk&style=for-the-badge&logoColor=white" height="50" alt="Java">
  <img src="https://img.shields.io/badge/Oracle-DB-orange?style=for-the-badge&logoColor=white" height="50" alt="Oracle">
  <img src="https://img.shields.io/badge/Team-6-blue?style=for-the-badge&logoColor=white" height="50" alt="Team">
</p>

---

## 💡 프로젝트 소개
**ONDO**는 팀원 간 효율적인 소통을 지원하는 **정보교환 플랫폼**입니다.  
모든 팀원이 **백엔드 개발**을 담당하며, 서버 구조 설계, 데이터베이스 설계, 페이지 구현 등 백엔드 중심 기능 개발에 집중했습니다.  
주요 기능: **회원 관리, 게시판(CRUD), 카테고리 검색, 채팅 요청 및 수락, 메시지 송수신, 대화 기록 관리**.  
팀원들은 **게시판 CRUD 기능과 서버 환경 구성, 백엔드 개발 흐름**을 직접 경험했습니다.

---
## 💡 프로젝트 개요 및 배경
최근 한일 양국 간의 교류와 관심이 높아짐에 따라, 언어와 문화의 장벽을 넘어
자유롭게 정보를 교환할 수 있는 플랫폼의 필요성을 느꼈습니다.

**‘ONDO(온도)’**는 서로의 생각과 이야기가 오가며 관계의 온도를 높인다는 의미를 담고 있습니다.

저희 팀은 이 이름처럼,
단순한 메시지 교환을 넘어 따뜻한 소통과 공감이 오가는 공간을 만들고자 본 프로젝트를 기획했습니다.
이를 통해 한일 양국 이용자들이 서로의 문화를 이해하고,
관심사를 공유하며 교류의 폭을 넓힐 수 있는 플랫폼을 개발하였습니다.

---
### 🖼 프로젝트 화면
<p align="center">
  <img src="image/portfolio/index.png" width="700" alt="메인 페이지">
</p>
<p align="center">
  <img src="image/portfolio/chat_demo.png" width="700" alt="채팅 기능">
</p>

---

### 🏆 주요 기능
<div align="center">
  <span style="display:inline-block; margin:10px; padding:15px 20px; border-radius:15px; background:#f0f0f0; font-size:16px;">🔍 카테고리 검색</span>
  <span style="display:inline-block; margin:10px; padding:15px 20px; border-radius:15px; background:#f0f0f0; font-size:16px;">💌 채팅 요청</span>
  <span style="display:inline-block; margin:10px; padding:15px 20px; border-radius:15px; background:#f0f0f0; font-size:16px;">✅ 채팅 요청 수락/거절</span>
  <span style="display:inline-block; margin:10px; padding:15px 20px; border-radius:15px; background:#f0f0f0; font-size:16px;">💬 실시간 메시지 송수신</span>
  <span style="display:inline-block; margin:10px; padding:15px 20px; border-radius:15px; background:#f0f0f0; font-size:16px;">📄 대화 기록 관리</span>
</div>

---

### 🔧 API & DB 구조
| 기능 | 엔드포인트 | 설명 |
|------|------------|------|
| 회원가입 | POST /user/signup | 신규 회원 등록 |
| 로그인 | POST /user/login | 회원 인증 |
| 게시글 작성 | POST /board/write | 게시판 글 작성 |
| 게시글 조회 | GET /board/list | 게시글 목록 조회 |
| 채팅 요청 | POST /chat/request | 멤버에게 채팅 요청 |
| 메시지 송수신 | POST /chat/send | 1:1 메시지 송신 |

<p align="center">
  <img src="image/portfolio/db_erd.png" width="700" alt="DB 구조">
</p>

---

## 🛠 기술 스택
<div align="center">
  <img src="https://skillicons.dev/icons?i=java,oracle,css,js" height="60" style="margin:10px"/>
</div>

| 구분 | 기술 |
|------|------|
| Frontend | HTML / CSS / JS / JSP |
| Backend | Java |
| Database | Oracle |
| 협업툴 | GitHub / Notion |

---

## 👩‍💻 팀원 소개
<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="https://avatars.githubusercontent.com/SangChul1" width="100"><br>
        <strong>박상철</strong><br>Backend<br>팀리더 / 회원관리 / 언어변경<br>
        <a href="https://github.com/SangChul1">GitHub</a>
      </td>
      <td align="center">
        <img src="https://avatars.githubusercontent.com/minTann718" width="100"><br>
        <strong>노혜민</strong><br>Fullstack<br>메시지 요청 리스트 & 채팅 관리<br>
        <a href="https://github.com/minTann718">GitHub</a>
      </td>
      <td align="center">
        <img src="https://avatars.githubusercontent.com/pwj0421" width="100"><br>
        <strong>박원준</strong><br>PM<br>총괄<br>
        <a href="https://github.com/pwj0421">GitHub</a>
      </td>
    </tr>
    <tr>
      <td align="center">
        <img src="https://avatars.githubusercontent.com/jy061333-ui" width="100"><br>
        <strong>허준영</strong><br>Backend<br>매칭, 카테고리 수정<br>
        <a href="https://github.com/jy061333-ui">GitHub</a>
      </td>
      <td align="center">
        <img src="https://avatars.githubusercontent.com/miinlz" width="100"><br>
        <strong>지수민</strong><br>Backend<br>공지사항 게시판<br>
        <a href="https://github.com/miinlz">GitHub</a>
      </td>
      <td align="center">
        <img src="https://avatars.githubusercontent.com/staythere88" width="100"><br>
        <strong>서동인</strong><br>Backend<br>자유게시판<br>
        <a href="https://github.com/staythere88">GitHub</a>
      </td>
    </tr>
  </table>
</div>

---

## 🎯 배운 점 / 개선점
- CRUD 기능 구현과 서버 환경 구축 경험  
- 팀원 간 백엔드 협업 및 역할 분담 경험  
- 실시간 메시지 송수신 구조 이해  
- 향후: 예외 처리 강화, 보안 개선 계획 ,　페이지 번역 시스템

---
