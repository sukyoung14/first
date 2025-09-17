// 변수에 데이터를 할당(assign O, save X)
// 할당할 데이터
// "Hello World" 데이터를 저장한 공간의 이름이 message
// 변수 message에 "Hello World"를 할당
message = "Hello World";
// = : 할당 연산자
console.log(message);
console.log(message);
console.log(message);

// 변수 message2 선언
// 선언과 할당은 분리 가능
// 선언의 방식은 2개
// let : 데이터의 재할당 가능
// 변수 message3에 Hello Variable을 할당
let message3 = "Hello Variable";
console.log(message3);
// 변수 message3에 Hello let Variable을 재할당
message3 = "Hello Variable";
console.log(message3);
// let은 안붙이나요? -> let을 붙이면 선언
// let 키워더는 재선언은 불가능 재할당은 가능

// const
// 데이터의 재할당이 불가능(중요) -> 상수라고 개발에서는 표현
// const 변수 message5f를 선언하고, "Hello Const" 할당
const message5 = "Hello Const";
console.log(message5);
// let Vs. const
// Let : 변하는 데이터를 저장하는 변수 선언 방식
// const : 변하면 안되는 데이터를 저장하는 변수 선언 방식

let message6;
let MESSAGE6;

// 카멜케이스
// 첫 단어는 소문자, 다음 단어부터 대문자로 시작
let helloMessage;

// 의미없는 변수명
let a = 1;
// 의미있는 변수명
let number = 1;

// 템플릿 리터럴
// 문자열 사이에 변수를 삽입해서 문자열을 생성하는 방법
// 1. 문자열을 백틱으로 표현
// 2. 변수 삽입 위치에 기호 ${ } 를 사용
let name = "홍길동";
let greet = `안녕하세요 ${name}입니다.`;
console.log(greet);

// var
// 재선언도 가능하고, 재할당도 가능
// 재선언이 가능한게 좋지 않은 이유 : 같은 이름으로 재선언을 해버리면 변수명이 중복 가능성
// 기존 변수에 저장된 데이터가 의도치않게 삭제
// 호이스팅 현상 : 변수를 선언하기 전에 사용이 가능
console.log(hoisting); // undefined 할당 -- 의도하지 않는 값이 할당
var hoisting = "hello hoisting";
