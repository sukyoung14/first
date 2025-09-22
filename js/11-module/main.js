// 모듈을 불러오기
// imfport / from
// from : 어디서 불러올 것이냐
// import : 무엇을 불러올 것이냐
// 여러개 내보내기 / 불러오기는 일부만 불러오기가 가능
// 트리 셰이킹 - 사용하지 않는 코드를 제거함으로써 최적화
// 프로덕션 환경을 위한 파일을 생성(빌드)할 때 사용하지 않은 코드는 제거하는 기술
import { add, substract, multiply, devide, PI } from "./math.js";

console.log(add(1, 2));
console.log(substract(5, 2));
console.log(multiply(5, 2));
console.log(devide(8, 2));
console.log(PI);

// 하나만 불러오기 - 내가 불러온 함수의 이름을 결정(Default Export)
// 대표성을 띈다는 특징
// import plus from "./calculator.js";
// console.log(plus(1, 2));

import calculator from "./calculator.js";
console.log(calculator);
// {
//   add: [Function: add],
//   substract: [Function: substract],
//   multiply: [Function: multiply],
//   devide: [Function: devide],
//   multiplyArrow: [Function: multiplyArrow]
// }
console.log(calculator.add(1, 2));
console.log(calculator["add"](1, 2));

import dayjs from "dayjs";
const now = dayjs();
console.log(now.format("YYYY-MM-DD")); // 예시: 2024-01-15

//npm install //  package.json, package-lock.json 을 읽어서 자동으로 패키지 설치
