// 배열 고차 메서드 : 배열 원소에 콜백 함수를 순차적으로 적용하는 메서드
function multiTwo(value) {
  return value * 2;
}
function higherOrderFunction(array, callbackFunction) {
  // 배열 내부 원소에 콜백 함수를 적용
  for (let element of array) {
    const result = callbackFunction(element);
  }
}
let numbers = [1, 2, 3, 4, 5];
higherOrderFunction(numbers, (value) => {
  return value * value;
});

// 배열 고차 메서드 forEach()
// 배열을 단순 반복
numbers = [10, 20, 30, 40, 50];

function 콜백함수(element) {
  console.log(element);
}

let todos = ["숙제하기", "운동하기", "독서하기"];

todos.forEach((todo, index) => {
  console.log(`${index + 1}. ${todo}`);
});

// 배열 고차 메서드는 배열의 반복문을 함수화
let numbers3 = [1, 2, 3, 4, 5];
// 인덱스 반복문의 문제 - for 문
// 1. 조건식 실수
// 2. 인덱스르르 통해서 원소에 접근
// for ...of
// 1. 조건식 X
// 2. 원소에 직접 접근
// 문제점 : 내부 로직 관리의 어려움, 유연함이 떨어진다

// 배열 고차 메서드
// 1. 문법이 간결
// 2. 콜백함수로 반복작업을 유연하게 제어

// 각 원소에 +1을 한 결과를 출력
let numbers4 = [1, 2, 3, 4, 5];
numbers4.forEach((element) => {
  // 배열의 원소에 반복적으로 수행할 로직 코드
  console.log(element + 1);
});

// 각 원소 중 2로 나눴을 때 나머지가 0인 원소만 출력
numbers4.forEach((element) => {
  if (element % 2 === 0) console.log(element);
});

// 각 원소에 +1을 한 결과를 모아서 새로운 배열
const newArray = [];
numbers4.forEach((element) => {
  newArray.push(element + 1);
});
console.log(newArray);
// map(활용)
const newArray2 = numbers4.map((element) => {
  return element + 1; // return 값이 없으면 undefined 출력
});
console.log(newArray2);

// map을 이용해서 *2 를 한 원소를 모아서 새 배열
const newArray3 = numbers4.map((element) => {
  return element * 2;
});

console.log(newArray3);
//reduce()

const newArray10 = [1, 2, 3, 4, 5];
const result = newArray10.reduce((accValue, currElement) => {
  // accValue : 이전 반복동안 반환된 값을 누적한 데이터
  // currElement : 현재 원소
  return accValue + currElement;
});

console.log(result);

const number11 = [2, 6, 1, 9, 7];
console.log(
  number11.sort((a, b) => {
    // 정렬기준
    // 반환값이 양수라면 a가 뒤로 배치
    // 반환값이 음수라면 a가 앞으로 배치
    // 반환값이 0이라면 같다
    // 오름차순
    return a - b;
    // 내림차순
    //return b - a;
  })
);
