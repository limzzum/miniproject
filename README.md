## 제주도 여행 경비 예측 서비스 🍀
  여행 시기에 따라 매번 달라지는 비행기, 숙소, 렌트카 비용...     
  제주 여행에 가장 적절한 시기를 쉽고 간단하게 알아보자!
  
## 목차 🥇
- [목표와 기능](#1목표와-기능-)
- [개발 환경 및 배포 URL](#2개발-환경-및-배포-URL-)
- [프로젝트 구조와 개발 일정](#3프로젝트-구조와-개발-일정-)
- [역할 분담](#4역할-분담-)
- [UI/BM](#5uibm-)<!-- [데이터베이스 모델링(ERD)](#6-데이터베이스-모델링-erd-) -->
- [메인 기능](#6-메인-기능-)
- [추가 기능](#7-추가-기능-)
- [느낀점](#8-느낀점-)

## 1.목표와 기능 ✈
### 1.1 목표
  - 제주 여행의 접근성 높이기
  - 쉽고 간단하게 제주 여행 경비 예측해보기
  
### 1.2 기능
  - 날짜 별 제주여행 항공 운임료 제공
  - 숙소와 렌트카 정보 제공
  - 관광지, 레저스포츠, 맛집, 카페정보 제공
  - 선택한 날짜에 따른 제주도 여행 총 경비 계산

---
## 2.개발 환경 및 배포 URL 🏠 
[demo url](https://cothi.github.io/prejeju/ )

### 2.1 개발 환경

  UI 디자인
    - figma [figma바로가기](https://www.figma.com/file/bxlPK3KOhZvUxZLT3lOJd0/%EC%A0%9C%EC%A3%BC_%EA%B2%BD%EB%B9%84_%EC%98%88%EC%B8%A1?node-id=21%3A574)    
  Web Framework
    - Django 3.2(Python 3.8)
  서비스 배포 환경
    -  
### 2.2 배포 URL

---
## 3.프로젝트 구조와 개발 일정 ⏲

### 3.1 프로젝트 구조

### 3.2 개발 일정
- 2022 제주베이스코딩캠프 해커톤
- 기간: 2022.8.29 ~ 2020.9.2

<!-- 8.29(월): 주제 정하기 및 데이터 수집
8.30(화): 데이터 수집 및 ui 작성, 
8.31(수):
9.1(목):
9.2(금) -->

---

## 4.역할 분담 ☑

🐔 팀장 한지웅 : FE, BE

🐤 팀원 김민재 : 디자인, FE 

🐤 팀원 이진혁 : BE

🐤 팀원 임정현 : FE, DATA


---

## 5.UI/BM 🖼

![figma ui](https://github.com/limzzum/prejeju/blob/main/images/figmaUI.png)
<img src="https://github.com/limzzum/prejeju/blob/main/images/index_page.png" width="400" height="240"/>   
  - 메인 페이지 -> 경비 예측 버튼 클릭하면 화면 이동   
     
<img src="https://github.com/limzzum/prejeju/blob/main/images/page1.png" width="400" height="240"/>   
  - 원하는 날짜와 경비에 포함시킬 카테고리 선택     
<img src="https://github.com/limzzum/prejeju/blob/main/images/loading_page.png" width="400" height="240"/>   
  - 항공 api연결 시간 동안 나타나는 로딩 화면   
      
<img src="https://github.com/limzzum/prejeju/blob/main/images/page2.png" width="400" height="240"/>   
  - 선택한 날짜에 따른 항공 운임료 리스트 보여줌 -> 원하는 항공편 선택   
     
<img src="https://github.com/limzzum/prejeju/blob/main/images/page3.png" width="400" height="240"/>
<img src="https://github.com/limzzum/prejeju/blob/main/images/page4.png" width="400" height="240"/>
<img src="https://github.com/limzzum/prejeju/blob/main/images/page5.png" width="400" height="240"/>   
  - 맛집, 카페, 레저스포츠, 관광지 정보 리스트와 지도 위치   
     
<img src="https://github.com/limzzum/prejeju/blob/main/images/page6.png" width="400" height="240"/>   
  - 리스트 항목 클릭하였을 때 자세한 정보 보여줌 -> 원하는 메뉴 선택  
     
<img src="https://github.com/limzzum/prejeju/blob/main/images/page7.png" width="400" height="240"/>   
  - 숙소와 렌트카 사이트 연결. 원하는 숙소와 렌트카의 가격 입력   
     
<img src="https://github.com/limzzum/prejeju/blob/main/images/page8.png" width="400" height="240"/>   
  - 제주 여행 총 경비와 선택한 항목들 보여줌(추가 삭제 가능)+ 원하는 항목을 사용자가 추가 가능   
     
<img src="https://github.com/limzzum/prejeju/blob/main/images/page9.png" width="400" height="240"/>   
  - 추가 목록 삭제, 수정 화면   
     

<!--## 6. 데이터베이스 모델링 ERD 🏗-->

## 6. 메인 기능 🌟 
  - 원하는 제주 여행 날짜 입력하고 그에 따른 항공편과 숙소, 맛집 등의 총 여행 경비 계산

## 7. 추가 기능 ➕ 
  - 맛집, 관광지 등 정보 리스트 추가
  - 가격 수정 기능
  - 그 외 제주 여행에 필요한 것이 생기면 추가 예정.

## 8. 느낀점 🤔 
 처음 기획부터 시작해 웹서비스 배포까지 경험해 볼 수 있던 좋은 기회였습니다.   
 기획부터 데이터 수집, 구현하는 과정이 막막하고 쉽지 않았지만 팀원분들과 함께 하여 끝까지 할 수 있었습니다.
결국 기획한 결과물을 완성하여 가장 뿌듯합니다


## 출처 🔁 
  -api : 항공 api (공공데이터 포털-국토교통부_(TAGO)_국내항공운항정보).  
  -폰트 : Black Han Sans [font바로가기](https://fonts.google.com/specimen/Black+Han+Sans?subset=korean)
---



