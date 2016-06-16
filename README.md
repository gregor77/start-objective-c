# 분수 계산기 만들기 예제
해당 예제 코드는 "Programming in Objective-C 2.0 5/E" 교재를 참조하여 예제 코드를 작성함.

## 사전 개념
* Objective-C 기본 문법
* 프로젝트는 iOS project > Single view app으로 만듬
* ViewController와 Main Storyboard 관계
```
ViewController  <->  Main Stroyboard
```
* Outlet, Action 개념

## 제약 사항
* 2개 이상의 입력 연산이 수행되지 않는다.

## Quiz
#### Q1) operation이 2개 이상 입력 시,  '='버튼을 disable 처리
* Hint
  - 1) '=' 버튼에 Outlet 추가
  - 2)button 속성 중 'enabled' NO/YES 사용
#### Q2) 연산자가 입력되면 나머지 연산자 버튼을 disable 처리
* Hint
  - 1) Outlet을 연산자 모든 버튼에 세팅하여 한번에 4개 버튼이 비활성화 되도록한다.
  - 2) 인터페이스 에디터 좌측 버튼을 드래그 해서 스토리보드에 버튼에 할당을 한다.
