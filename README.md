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

## Modal vs Push
화면 전환 방법은 modal과 push가 있는데, 용도에 따라 달라진다.
Modal은 화면에서 새로운 화면 전환시 사용, Push는 선택시 상세내역 보여줄 때 화면 전환시 사용한다. 애니
메이션 동작방식은 오른쪽에서 왼쪽으로 등이 있다.
|Modal|Push|
|-----|----|
|1.Segue 화면끼리|.|
|2.Segue ViewController|.|
|3.Code|.|

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

#### Q3) Label에 결과값이 있을 때, operator 버튼을 클릭하는 경우, label에 결과값 이어서 연산이 되도록한다

## App
* App Storyboard
![App Stroyboard](https://github.com/gregor77/start-objective-c/blob/master/calculator_storyboard.png)

* App Main View
<img src="https://github.com/gregor77/start-objective-c/blob/master/calculator_demo_main.png" width="307" height="571 align="center">
