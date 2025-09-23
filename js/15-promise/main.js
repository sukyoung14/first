// Promise 생성자 함수를 직접 사용하는 방법
// new Promise() : 생성자 함수
// (resolve, reject) => {} : 비동기 작업을 수행하고, 결과를 반환하는 함수

// resolve : 성공을 나타내는 함수
// reject : 실패를 나타내는 함수
const randomPromise = new Promise((resolve, reject) => {
  // 비동기 작업 흉내
  setTimeout(() => {
    const random = Math.random(); // 랜덤 숫자 생성

    if (random > 0.5) {
      resolve("숫자가 0.5 이상! 성공"); // 성공 시  반환
    } else {
      reject("숫자가 0.5 이하! 실패"); // 실패 시  반환
    }
  }, 1000);
});
// console.log(randomPromise);

// promise 두가지 상태
// 비동기 처리의 성공과 실패
// 예시) 네트워크 통신의 성공과 실패
// 성공 상태일 때 수행할 처리 메서드
// promise데이터.then(콜백함수)
// 실패 상태일 때 수행할 처리 메서드
// Promise데이터.then().catch(콜백함수)
// 콜백함수는 인자를 하나 받는다.
// randomPromise
//   .then((result) => {
//     //result는 resolve 함수의 인자 데이터
//     console.log(result);
//   })
//   .catch((error) => {
//     //error는 reject 함수의 인자 데이터
//     console.log(error);
//   });
// fetch : 네트워크 통신 함수
// 필수품 : 웹서비스의 주소
// fetch("https://example.com")
//   .then((response) => {
//     console.log(response);
//     return response.text();
//   })
//   .then((data) => {
//     console.log(data);
//   });

// async/await
// Promise 자료형을 쉽게 사용하게 도와주는 키워드
// async 키워드
// 함수앞에 붙는 키워드
// 해당 함수가 비동기를 처리 하는 함수란것을 표시
async function func() {
  // await 키워드
  // Promise의 완료(성공 or 실패)를 대기하는 키워드
  console.log("randomPromise 전");
  try {
    // promise 기반 비동기처리 수행
    // 수행결과 resolve() 함수 인자를 반환
    const result = await randomPromise;
    console.log(result);
  } catch (error) {
    console.log(error);
  }
  console.log("randomPromise 후");
}
func();
