# SWITH(Study With) 그룹 스터디 사이트 ![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_30,q_100/a_0/v1678869809/readme/logo04.png)

# Contents 📖
1. [팀 소개](#1️⃣-팀-소개)
2. [프로젝트 개요](#2️⃣-프로젝트-개요)
3. [설계의 주안점](#3️⃣-설계의-주안점)
4. [개발환경](#4️⃣-개발환경)
5. [주요기능](#5️⃣-주요기능)
6. [Document](#6️⃣-Document)
7. [최종발표자료(Google Drive)](https://drive.google.com/file/d/1F-G0fVTm0v0PalgG6WGutXuVdQpxnZaT/view?usp=sharing)

## 1️⃣ 팀 소개
<p align="center"><img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1679297194/readme/%ED%8C%80_%EC%86%8C%EA%B0%9C_gabalb.png"></p>


## 2️⃣ 프로젝트 개요
![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1678873825/readme/%EC%A0%9C%EB%AA%A9_%EC%97%86%EC%9D%8C22.png)

- 20-30대를 중심으로 스터디 열풍이지만 혼자서는 작심삼일로 끝나는 경우가 많다
- 여러 명과 스터디를 진행하기는 쉽지 않으며 모집, 일정 관리, 장소 선정, 진행 등 고려할 사항이 많다.


 *__👉 그래서 스터디 모집부터 진행, 관리에 이르기까지 스터디에 필요한 모든 기능을 제공하는 그룹 스터디 사이트 SWITH을 만들었습니다.__*
## 3️⃣ 설계의 주안점
### 기획을 바탕으로 주요 기능  구현
  - 회원가입 - 스터디 등록/스터디 조회 - 스터디 문의 - 스터디 가입
  - 스터디 관리 - 스터디 일정 관리/장소 검색/예약 - 스터디 채팅
  - 마이 페이지 : 일정 관리/ 가입 스터디 확인/ 예약 확인/ 개인정보 수정 및 탈퇴
  - 관리자 페이지 : 스터디 카페 등록/조회/수정 - 스터디 카페 매출 조회 - 회원 관리 - 사이트 관리

### 각 기능에 필요한 API 및 DB 설계
  - 다양한 기능을 구현하기 위해 필요한 API 선정 및 적용
  - 각각의 API에 맞춘 DB 설계, ERD 수정 작업 진행
  - API 동작 방식, DB 구조에 따른 VO 설정

## 4️⃣ 개발환경
![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679297122/readme/%EA%B0%9C%EB%B0%9C%ED%99%98%EA%B2%BD3_kmguva.png)


## 5️⃣ 주요기능
<p align="center"><img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1679299020/readme/%EA%B0%95%EB%A1%B1%EA%B8%B0_bvxyg8.png"></p>
<details>
<summary><h3>✅ 시큐리티 로그인 및 계정 찾기 </h3></summary>
<div markdown="1">
  
<br>
<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
시큐리티 로그인
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![로그인](https://krg.mapleclip.com/SecurityLogin.gif)
  
</div>

- Spring Security를 활용하여 로그인 기능을 구현, 비밀번호의 경우 bcrpt 암호화를 적용
1. Web.xml에 filter를 등록하고 spring-security.xml에서 시큐리티 설정을 진행
2. AuthenticationProvider를 상속받은 CustomAuthenticationProvider에서 인증을 시도
3. UserDetailsService를 상속받은 CustomMemberDetailsService에서 UserDetails를 상속받은 CustomMemberDetails라는 vo를 통해 유저 객체를 검색
- 인증에 성공시<br>
4-1. AuthenticationSuccessHandler를 상속받은 LoginSuccessHandler가 실행<br>
5-1. 로그인 화면 진입후 로그인 시도한 경우 메인페이지로 이동<br>
5-2. 비인증 상태로 인증이 필요한 페이지로 접근한 경우 해당 페이지로 이동
- 인증에 실패시<br>
4-2. AuthenticationFailureHandler를 상속받은 LoginFailureHandler가 실행된다<br>
5-1. 로그인 페이지 하단에 실패 사유 문구 출력

---
  
<br> 
<br> 
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
아이디 찾기
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![아이디찾기](https://krg.mapleclip.com/IdSearch.gif)  
  
</div>

1. 로그인 페이지 하단의 아이디 찾기 클릭
2. 이름, 이메일 입력 후 데이터베이스 조회
3. 아이디 마지막 3자리를 가린 데이터를 화면에 출력
4. 전체 아이디 보기 클릭시 등록된 이메일로 전체아이디 전송
5. 로그인 페이지로 이동

---
  
<br> 
<br> 
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
비밀번호 찾기
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![비밀번찾기](https://krg.mapleclip.com/PwdSearch.gif)  
  
</div>

1. 로그인 페이지 하단의 비밀번호 찾기 클릭
2. 아이디 이메일 입력 후 데이터 베이스 조회
3. 조회 성공시 이메일로 인증번호 발송, 하단에 입력 창 출력
4. 인증 완료 후 비밀번호 재설정 페이지로 이동
5. 유효성 체크 후 비밀번호 재설정
6. 로그인 페이지로 이동
---

</div>
</details>

<details>
<summary><h3>✅ 회원가입 </h3></summary>
<div markdown="1">
  
<br>
<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
회원가입
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![회원가입](https://krg.mapleclip.com/Join.gif)
  
</div>

1. 아이디, 이메일, 휴대폰번호, 비밀번호, 비밀번호 재확인 입력시 하단에 유효성 체크를 통해 문구 출력, 유효성 체크를 만족할 경우 문구가 사라진다. 
2. 아이디 중복체크를 클릭시 입력한 아이디가 데이터베이스에 존재하는지 조회 후 사용가능하면 버튼 색상을 변경한다. 
3. 이메일 본인인증 버튼을 클릭시 입력한 이메일이 데이터베이스에 존재하는지 조회 후 사용가능하면 이메일에 인증번호를 발송하고 버튼의 색상 변경 및 인증번호 입력 input이 나타난다. 인증번호 인증에 성공하면 alert 안내와 함께 인증번호 입력 input이 사라진다. 
4. 주소검색 버튼 클릭시 Daum 주소검색 API가 출력되며 우편번호와 기본주소에 value를 채워준다. 
5. 전체약관 동의 클릭시 아래의 3개 체크박스가 체크상태로 변경된다.
6. 가입하기 클릭시 전체 유효성 체크를 통과하면 회원가입이 완료된다.
---

</div>
</details>

<details>
<summary><h3>✅ Fullcalendar 일정 관리 </h3></summary>
<div markdown="1">
  
<br>
<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
일정 조회 및 등록
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![일정조회등록](https://krg.mapleclip.com/CalendarInsert.gif)
  
</div>

1. 스터디 페이지의 Schedule 버튼을 누르면 스터디에 등록된 일정을 월별, 주별, 일별, 리스트의 형태로 확인 가능하다.
2. 일정추가 버튼을 누르면 나타나는 모달창에 일정메모, 시작시간, 종료시간을 입력 후 추가 버튼을 클릭하면 일정추가가 완료된다. 

---
  
<br> 
<br> 
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
일정 수정
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![일정수정](https://krg.mapleclip.com/CalendarUpdate.gif)  
  
</div>

- 출력된 일정을 클릭 후 Fullcalendar의 eventClick 이벤트로 출력되는 모달창에서 데이터를 변경 후 수정 버튼을 클릭하면 수정사항이 저장된다.

---
  
<br> 
<br> 
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
일정 삭제
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![일정삭제](https://krg.mapleclip.com/CalendarDelete.gif)  
  
</div>

- 출력된 일정을 클릭 후 Fullcalendar의 eventClick 이벤트로 출력되는 모달창에서 일정 삭제 버튼을 클릭하면 등록된 일정이 삭제된다.
---

</div>
</details>

<details>
<summary><h3>✅ 마이페이지 </h3></summary>
<div markdown="1">
  
<br>
<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
마이페이지 - 프로필 변경
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![프로필변경](https://krg.mapleclip.com/MypageProfile.gif)
  
</div>

- 프로필 정보 우측 하단에 프로필 수정 버튼 클릭 시 모달창에서 수정 가능
- 현 프로필 정보가 모달창에 출력되고 해당 input에서 정보를 수정 후 수정 버튼 클릭시 프로필이 수정
- 닫기 버튼 클릭시 모달창 닫힘
- 닉네임, 프로필 사진 및 소개 수정 가능

---
  
<br> 
<br> 
<br> 

<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
마이페이지 - 개인 스케줄 조회
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![개인스케줄조회](https://krg.mapleclip.com/MypageCalendar.gif)
  
</div>

- 가입한 스터디의 모든 일정 출력
- 월별, 주별, 일별, 리스트 형식의 캘린더 사용
- 출력된 일정 클릭시 일정이 등록된 스터디 페이지로 이동

---
  
<br> 
<br> 
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
마이페이지 - 가입 스터디 조회
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![가입스터디조회](https://krg.mapleclip.com/MypageStudy.gif)  
  
</div>

- 가입 중인 스터디 목록 조회
- 스터디에서 활동 내용 (가입일, 작성게시글, 모임참석, 스터디페이지에 머문 시간) 확인
- 스터디 클릭시 해당 스터디 페이지로 이동

---
  
<br> 
<br> 
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
스터디 신청 + 마이페이지 - 신청 스터디 조회
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![신청스터디조회](https://krg.mapleclip.com/MypageStudyJoin.gif)  
  
</div>

- 스터디 신청
1. 스터디 비가입자만 가입신청 버튼 노출, 스터디 가입신청 가능
2. 스터디 가입신청 완료시 가입완료 표시

- 마이페이지 - 신청 스터디 조회
1. 가입 신청한 스터디의 승인/거절 여부 확인
2. 가입 신청일 순으로 정렬

---
  
<br> 
<br> 
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
마이페이지 - 개인 정보 수정
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![개인정보수정](https://krg.mapleclip.com/MypageInfoUpdate.gif)  
  
</div>

- 개인 정보 조회시 비밀번호 재확인
- 현재 데이터베이스에 저장된 개인 정보를 출력
- 기존 식별키인 아이디는 확인만 가능하고 수정 불가능
- 이메일 글자 변경시 중복확인 버튼이 열리고 다시 초기 데이터와 동일하게 입력시 이메일 중복확인 버튼 닫힘
- 이메일 변경시 이메일 재인증
- 하단의 수정 버튼 클릭 시 변경된 데이터 저장

---
  
<br> 
<br> 
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
마이페이지 - 비밀 번호 변경
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![비밀번호변경](https://krg.mapleclip.com/MypagePwdUpdate.gif)  
  
</div>

- 비밀번호 변경 버튼 클릭시 현재 비밀번호 인증 후 비밀번호 변경 가능
- 비밀번호 유효성 체크

---
  
<br> 
<br> 
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
마이페이지 - 회원 탈퇴
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![회원탈퇴](https://krg.mapleclip.com/MypageDelete.gif)  
  
</div>

- 회원탈퇴 버튼 클릭시 비밀번호 확인
- 가입된 스터디 존재시 회원탈퇴 불가
- 회원탈퇴 전 주의사항 안내
---

</div>
</details>

<p align="center"><img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1679299020/readme/%EA%B6%8C%ED%98%B8%EB%AF%BC_khypvy.png"></p>
 
<details>
<summary><h3>✅ 관리자 페이지 </h3></summary>
<div markdown="1">
  
  
<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
스터디 관리
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![ezgif com-video-to-gif](https://user-images.githubusercontent.com/116356202/226275991-96732313-d12c-4b9a-a35f-1a70b75304ea.gif)  
  
</div>

- 스터디 관리 메모

</div>

---
<br> 
  
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
스터디 카페 등록
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![ezgif com-video-to-gif](https://user-images.githubusercontent.com/116356202/226275991-96732313-d12c-4b9a-a35f-1a70b75304ea.gif)  
  
</div>

- 스터디 카페 등록 메모

</div>

---
<br>
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
스터디 카페 관리
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![ezgif com-video-to-gif](https://user-images.githubusercontent.com/116356202/226275991-96732313-d12c-4b9a-a35f-1a70b75304ea.gif)  
  
</div>

- 스터디 카페 관리 메보

</div>

---
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
매출 조회
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![ezgif com-video-to-gif](https://user-images.githubusercontent.com/116356202/226275991-96732313-d12c-4b9a-a35f-1a70b75304ea.gif)  
  
</div>

- 매출 조회 메보

</div>

---
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
회원 관리
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![ezgif com-video-to-gif](https://user-images.githubusercontent.com/116356202/226275991-96732313-d12c-4b9a-a35f-1a70b75304ea.gif)  
  
</div>

- 회원 관리 메모

</div>
</details>

---

<details>
<summary><h3>✅ 스터디 관리 </h3></summary>
<div markdown="1">
  
  
<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
스터디원 관리 - 벌점
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![스터디원 벌점 800](https://user-images.githubusercontent.com/116356234/226423636-a3820377-c2a9-481b-ac06-bf0fdf7a5da7.gif) 
  
</div>

- 스터디원 관리 벌점 메모

</div>

---
<br> 
  
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
스터디원 관리 - 신고 및 강퇴/양도
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![스터디원 관리 800](https://user-images.githubusercontent.com/116356234/226423625-72e487e6-82d0-4583-86ad-aaf333a9e78f.gif)  
  
</div>

- 스터디원 관리 양도 및 강퇴 메모

</div>

---
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
스터디 모집 상태 변경
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![모집 상태 변경 800](https://user-images.githubusercontent.com/116356234/226423644-894365e2-49aa-4828-af9e-f697303589ad.gif) 
  
</div>

- 스터디 신청 관리 모집 상태 변경 메모

</div>

---
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
스터디 신청 관리
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![스터디 신청 관리 800](https://user-images.githubusercontent.com/116356234/226423654-4ab93a49-4355-40f8-827b-94de4d809e82.gif)  
  
</div>

- 스터디 신청 관리 승인 및 거절

</div>
</details>

---

<details>
<summary><h3>✅ 스터디 카페 예약 </h3></summary>
<div markdown="1">
  
  
<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
조회 및 상세 보기
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![ezgif com-video-to-gif](https://user-images.githubusercontent.com/116356202/226275991-96732313-d12c-4b9a-a35f-1a70b75304ea.gif)  
  
</div>

- 조회 및 상세 보기 메모

</div>

---
<br> 
  
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
예약 일정 선택
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![ezgif com-video-to-gif](https://user-images.githubusercontent.com/116356202/226275991-96732313-d12c-4b9a-a35f-1a70b75304ea.gif)  
  
</div>

- 예약 일정 선택 메모

</div>

---
<br>
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
데이터 크롤링
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![크롤링 800](https://user-images.githubusercontent.com/116356234/226423605-4c03eb51-5dce-4a9e-9e5f-8708792de881.gif)   
  
</div>

- 데이터 크롤링 메모

</div>
</details>

---

<p align="center"><img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1679299021/readme/%ED%95%9C%ED%98%9C%EC%A0%95_mfxshc.png"></p>
<details>
<summary><h3>✅ 문의 댓글</h3></summary>
<div markdown="1"> 

<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
문의 댓글 및 답글 작성, 수정
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div>

<br>

<div align="center">

![문의댓글](https://user-images.githubusercontent.com/116356323/226337353-272a0165-2f96-4c52-b712-fb2d40e80586.gif)

</div>

- 댓글 목록
  - 로그인 계정에 설정된 권한에 따라 각 댓글 하단에 수정, 삭제, 신고, 답글 버튼 위치
  - 최신 댓글이 가장 하단에 위치 ex.)  a부모1-a자식1-a자식2-a손자1-a손자2 순서-b부모1-b자식1-b손자1
![댓글css1](https://user-images.githubusercontent.com/116356323/226339445-f10daad0-8848-4ecc-92b6-e2e7ee53a537.png)
![댓글css2](https://user-images.githubusercontent.com/116356323/226339462-1891b791-7903-4c54-82da-b0e9b909496f.png)

- 기능
  - 공통 : 댓글 작성 성공 시 "댓글 작성에 성공했습니다" alert창
  - 답글 : 답글 버튼 클릭 시 input창 나타남
  - 수정 : 수정 버튼 클릭 시 input창 나타남, 기존 댓글 내용이 default value로 입력된 상태, 등록 시 DB를 통해 댓글 내용에 자동으로 수정일 추가
</div>
</details>
<details>
<summary><h3>✅ 카카오페이 결제</h3></summary>
<div markdown="1"> 

<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
카카오페이 결제
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div>

<br>

<div align="center">

![카카오페이결제](https://user-images.githubusercontent.com/116356323/226337752-d4bf3460-50eb-473e-a707-bd2c809d3b56.gif)

</div>

- 결제 데이터
  - 예약 화면에서 받아온 정보(장소, 일시, 가격)와 로그인 정보를 ajax를 통해 kakaopay 서버로 전송

- 결제 과정
  - 결제 버튼 클릭 - 카카오페이 QR - 카카오페이 앱에서 결제 진행 - 결제 성공 시 "예약이 완료되었습니다!" alert창 - 결제 내역 확인
- 결제 성공
  - 결제 성공 시 DB에 해당 내용 저장

<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
카카오페이 결제 중 취소
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div>

<br>

<div align="center">

![카카오페이결제취소](https://user-images.githubusercontent.com/116356323/226337803-8d00792d-0b40-47ca-82a8-8216179e226f.gif)

</div>

- 결제 중 취소
  - "결제를 취소했습니다" alert창 - 결제 이전 화면으로 이동

</div>
</details>

<details>
<summary><h3>✅ 마이페이지 - 예약 취소</h3></summary>
<div markdown="1"> 

<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
예약 취소
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div>

<br>

<div align="center">

![예약취소](https://user-images.githubusercontent.com/116356323/226337842-66beddd9-3c51-43c8-84b8-3b56933a25b0.gif)

</div>

- 예약 취소 순서
  - 마이페이지 예약 내역 조회 - 예약 취소 버튼 클릭 - 취소 확인 팝업창 - "예약 취소되었습니다" alert창

- 내부 동작 순서
  - 예약 취소 확인 시 ajax로 전송된 데이터 + DB에 저장된 데이터를 사용하여 카카오페이 결제 취소 진행
  - 결제 취소 완료 후 DB에 저장되어 있던 예약 내역을 예약 취소 테이블로 이동시킴
  - DB 카드 정보 테이블에 저장되어 있던 데이터 삭제
  - 예약 취소 완료
</div>
</details>

<p align="center"><img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1679299021/readme/%EC%9D%B4%EC%84%B1%EC%B2%A0_ntms3e.png"></p>
이성철
![제목-없는-동영상-Clipchamp로-제작-_1_](https://user-images.githubusercontent.com/72017540/226534541-4a607d6a-ee72-49f5-bb7c-c04a59ce067d.gif)
<p align="center"><img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1679299021/readme/%EC%86%A1%EC%A4%80%ED%98%B8_lrkdil.png"></p>
<details>
<summary><h3>✅ 채팅 </h3></summary>
<div markdown="1"> 

<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
채팅
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![ezgif com-video-to-gif](https://user-images.githubusercontent.com/116450106/226278989-e40e173c-ef9a-4571-a61e-b5b93c472c77.gif)  
  
</div>

</div>
</details>



## 6️⃣ Document
## 1.개발일정
<p align="center"><img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1678895431/readme/KakaoTalk_20230316_004946423.png"  width="470" height="280"><img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1678894850/readme/%EC%A0%9C%EB%AA%A9_%EC%97%86%EC%9D%8C24124.png"  width="470" height="280"></p>


## 2.요구사항 정의서
[요구사항 정의서 전체보기](https://docs.google.com/spreadsheets/d/1FTfi5627b7Gipx9zxEV09Gmk_NTmoDXilJgCDD8IjpE/edit?usp=sharing)


## 3.시퀀스 다이어그램


<h3 align="center">마이페이지</h3>
<p align="center"><img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1679300411/readme/%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%802_w7iugg.png"></p>


<h3 align="center">회원가입</h3>
<p align="center"><img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1679299581/readme/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85.png%EC%9D%98_%EC%82%AC%EB%B3%B8_snnlfd.png"></p>

## 4.ERD 다이어그램
![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1678973516/readme/Swith_1_wz1i2d.png)


## 5.클래스 다이어그램
<details>
<summary><h3>Member</h3></summary>
<div markdown="1"> 

![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679299681/readme/%ED%99%94%EB%A9%B4_%EC%BA%A1%EC%B2%98_2023-03-20_170741_khgwo4.png)
![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679299753/readme/%ED%99%94%EB%A9%B4_%EC%BA%A1%EC%B2%98_2023-03-20_170859_xfgcnd.png)

</div>
</details>
<details>
<summary><h3>Board</h3></summary>
<div markdown="1"> 

![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679299927/readme/%ED%99%94%EB%A9%B4_%EC%BA%A1%EC%B2%98_2023-03-20_171149_kwbtin.png)

</div>
</details>
<details>
<summary><h3>Study</h3></summary>
<div markdown="1"> 

![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679300105/readme/%ED%99%94%EB%A9%B4_%EC%BA%A1%EC%B2%98_2023-03-20_171456_qgx8ys.png)
![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679300168/readme/%ED%99%94%EB%A9%B4_%EC%BA%A1%EC%B2%98_2023-03-20_171558_uy0die.png)

</div>
</details>
<details>
<summary><h3>Place</h3></summary>
<div markdown="1"> 

![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679300312/readme/%ED%99%94%EB%A9%B4_%EC%BA%A1%EC%B2%98_2023-03-20_171815_wzwbcx.png)

</div>
</details>
<details>
<summary><h3>Area</h3></summary>
<div markdown="1"> 

![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679300439/readme/%ED%99%94%EB%A9%B4_%EC%BA%A1%EC%B2%98_2023-03-20_172026_pjkayf.png)

</div>
</details>
<details>
<summary><h3>Chatting</h3></summary>
<div markdown="1"> 

![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679300507/readme/%ED%99%94%EB%A9%B4_%EC%BA%A1%EC%B2%98_2023-03-20_172134_w6orbt.png)

</div>
</details>
<details>
<summary><h3>Schedule</h3></summary>
<div markdown="1"> 

![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679300581/readme/%ED%99%94%EB%A9%B4_%EC%BA%A1%EC%B2%98_2023-03-20_172248_wtginj.png)

</div>
</details>
<details>
<summary><h3>Penalty</h3></summary>
<div markdown="1"> 

![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679300841/readme/%ED%99%94%EB%A9%B4_%EC%BA%A1%EC%B2%98_2023-03-20_172710_znfq4t.png)

</div>
</details>
<details>
<summary><h3>Reaserve</h3></summary>
<div markdown="1"> 

![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679300933/readme/%ED%99%94%EB%A9%B4_%EC%BA%A1%EC%B2%98_2023-03-20_172839_kcrgys.png)
![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679300999/readme/%ED%99%94%EB%A9%B4_%EC%BA%A1%EC%B2%98_2023-03-20_172945_bln5fg.png)

</div>
</details>
<details>
<summary><h3>Others</h3></summary>
<div markdown="1"> 

![이미지](https://res.cloudinary.com/dnik5jlzd/image/upload/v1679301040/readme/%ED%99%94%EB%A9%B4_%EC%BA%A1%EC%B2%98_2023-03-20_173031_xowbbj.png)

</div>
</details>

## 6.history
[history 전체 보기](https://docs.google.com/spreadsheets/d/1GI4YhCsu8PYLKdRLyJ4bEjpDJK7uNyHB0t6rp_WKdq0/edit?usp=sharing)


## 7.테스트 케이스
[테스트 케이스 전체 보기](https://docs.google.com/spreadsheets/d/1_TRf-HKJ9F98aWcAn7oh34Fi6djoKBzTlIBmqWGogQY/edit?usp=sharing)

<details>
<summary><h3>✅ 로그인 </h3></summary>
<div markdown="1"> 

<div align="center">
로그인 진행
</div>

<br>

<div align="center">

![ezgif com-video-to-gif](https://user-images.githubusercontent.com/116356202/226275991-96732313-d12c-4b9a-a35f-1a70b75304ea.gif)

</div>

- 로그인 메모

</div>
</details>


