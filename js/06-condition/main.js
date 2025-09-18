// if 조건ㅁ문의 기본 구조
/*
if(조건식) {
  // 조건식이 참이면 실행되는 코드 영역
}
*/
if (5 > 1) {
  console.log("5는 1보다 크다");
}
/* if ~ else if 조건문 기본 구조
if(조건식1) {
} else if (조건식2){
  // 조건식2는 조건식1이 거짓(false) 이라면 평가된다.
} else if (조건식3){
  // 조건식3는 조건식2이 거짓(false) 이라면 평가된다.
}
*/
if (5 > 10) {
  console.log("5는 10보다 크다");
} else if (5 > 7) {
  console.log("5는 7보다 크다");
} else if (5 > 5) {
  console.log("5는 5보다 크다");
} else if (5 > 3) {
  console.log("5는 3보다 크다");
}
/* else
  else는 조건식이 없다.
대신 위의 모든 조건식이 거짓(false)이면 실행
else 아래에는 또 다른 else if나 else가 존재할 수 없다
---
if (조건식){
} else {
  조건식이 거짓이면 실행}} */

// 변수 number을 선언하고, 숫자 1을 할당
let number = 1;
// number가 0보다 크면 "양수"를 콘솔에 출력 0보다 큰게 아니라면 "음수"를 콘솔에 출력
if (number > 0) {
  console.log("양수");
} else {
  console.log("음수");
}
// 변수 number1을 선언하고, 숫자 0을 할당
// 만약에 변수 number2가 0보다 크면, "양수" 출력
// 만약에 변수 number2가 0보다 작으면, "음수" 출력
// 그런데 모두 아니라면 "0" 출력
let number2 = 0;
if (number2 > 0) {
  console.log("양수");
} else if (number2 < 0) {
  console.log("음수");
} else {
  console.log("0");
}
// 중첩 조건문
// 조건문 내부에 조건문을 중첩하는 조건문
// 만약에 숫자가 10보다 크고, 짝수이고, 5의 배수이고, 소수이고, -3을 했을 때~~
// 조건식이 복잡할 때 사용
// 변수 score를 선언하고, 숫자 75를 할당한다
// 만약 변수 socre가 90 이상이라면
// 그런데 만약 변수 score가 90 미만 그리고(&&), 80 이상이라면
// 그런데 만약 변수 score가 80 미만 그리고(&&), 70 이상이라면
// 그런데 만약 변수 score가 70 미만 그리고(&&), 60 이상이라면
// 그런데 모두 아니라면
let score = 75;
if (score >= 90) {
  console.log("A");
} else if (score < 90 && score >= 80) {
  console.log("B");
} else if (score < 80 && score >= 70) {
  console.log("C");
} else if (score < 70 && score >= 60) {
  console.log("D");
} else {
  console.log("E");
}
