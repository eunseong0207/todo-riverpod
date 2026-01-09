# [Flutter 기초] 개인과제 - To Do App UI 만들기

기초 챕터의 핵심 키워드는 ‘위젯과 친해지기’와 ‘화면 만들기(UI 구현)’ 입니다!

- 실무처럼, UI 명세서와 앱 화면 flow 를 보고 ‘정확하게’ 화면을 그려봅시다.
- 앱 개발에서 중요한 두 가지, **안정성**과 **사용성** 입니다.
    - 지금 단계에서 안정성은 ‘예외처리’로 연습할 수 있습니다.
    그렇다면 ‘사용성’은 어떻게 커버할 수 있을까요?
    - UI 와 함께 따라오는 개념인 UX(사용성)에 대해서도 고민하며 만들어봅시다.


 ## 기본조건
- 프로젝트 명은 `tasks`입니다.
- 초기 화면의 이름은 `HomePage`로 합니다
- To Do의 상세 내역 화면의 이름은 `ToDoDetailPage`로 한다.

 ## To Do Entity Class 만들기
- final String title;
- final String? description;
- final bool isFavorite;
- final bool isDone;

 ## 기본 화면 (To Do 리스트가 없는 화면) 만들기
 
 ## 레이아웃  나누기

 ### AppBar
  - [x] Text
 ### Body
  - [x] ListView
    - [x] Container
       - [x] Column
              - [x] Image
              - [x] Text
              - [x] Text
       - [x] floatingActionButton 

### BottomSheet
  - [x] Container
    - [x] Column
      - [x] TextField
      - [x] Row
      - [x] Icon
      - [x] Icon
      - [x] Text


