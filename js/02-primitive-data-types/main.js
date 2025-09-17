console.log("Hello World");
// 주석

// 자료형 확인 키워드(예약어)
// typeof 확인하는 데이터
console.log(typeof "Hello World"); //string
// 데이터의 자료형을 자주 확인하는 습관 필요
// 원시 자료형 5개( 원래 7개)

// 문자열(string)
// 문자열의 나열 : 0개 이상의 문자를 나타내는 자료형
// 빈문자열("")도 문자열
console.log(typeof ""); //string

// 문자역 표현 방법 3개
// 큰 따옴표(""), 작은 따옴표(''), 백틱(``)
console.log(10);
console.log(0);
console.log(-1);
console.log(1.1);

// 숫자형(Number)
// 모든 종류의 숫자(정수, 0, 실수)
console.log(typeof 10);
console.log(typeof 0);
console.log(typeof -1);
console.log(typeof 1.1);

// 논리형, 블리언(Boolean)
// 맞다 / 틀리다 를 표현
// true, false, 2개의 데이터만 존재
console.log(true);
console.log(typeof true);

// undefined
// 없다, 비어있다를 표현
// 변수에 데이터가 없다
// 개발자가 의도하지 않은 비어있음을 표현
console.log(undefined);
console.log(typeof undefined);

// null
// 없다, 비어있다를 표현
// 개발자가 의도한 비어있음을 표현
console.log(null);
console.log(typeof null); //object -> javascript 초창기 버젼의 버그
