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

## 추가 구현
* operation이 2개 이상 입력 시,  '='버튼을 disable 처리
  - Hint : 1) '=' 버튼에 Outley 추가 2)button 속성 중 'enabled' NO/YES 사용
