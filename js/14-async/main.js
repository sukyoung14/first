// 비동기 처리 함수
// setTimeout, setInterval, fetch
// setTimeout(콜백, 밀리초) : 밀리초 뒤에 콜백함수를 실행하는 비동기처리 함수
console.log("5000ms 전 코드");

setTimeout(() => {
  console.log("5000ms 후 실행");
}, 5000);

setTimeout(() => {
  console.log("1000ms 후 실행");
}, 1000);

setTimeout(() => {
  console.log("2000ms 후 실행");
}, 2000);
// setTimeout() 실행과 상관없이 바로 실행된다
console.log("setTimeout 후 코드");
