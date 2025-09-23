// 콜백 함수
const add = (x, y) => x + y;

// 콜백 함수
const multiply = (x, y) => x * y;

// 콜백 함수
const subtract = (x, y) => x - y;

// 고차 함수
function performAction(a, b, callback1) {
  const result = callback(a, b);
  console.log(` ${callback} 결과: ${result}`);
}

performAction(5, 3, add);
performAction(5, 3, multiply);
performAction(5, 3, subtract);
