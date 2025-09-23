// 예외처리
try {
  // 내가 실행할 코드
  const msg = "error";
  console.log(msg);
  msg = "error2";
  console.log(msg);
} catch (error) {
  // try 코드 블록이 오류가 발생할 때 실행할 코드
  // error 매개변수
  // 오류의 정보를 저장하고 있는 객체
  console.log(error.name);
  console.log(error.message);
} finally {
  // try ~ catch와 상관없이 무조건 실행되는 코드
}
