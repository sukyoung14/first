let name = "홍길동";
let age = 20;

const user = {
  name: name,
  age: age,
};

console.log(user);

// 단축 속성
// 변수명과 key가 동일할때
const user2 = {
  name,
  age,
};
console.log(user2);
let key = "name";
// key는 문자열, 변수가 아니다
// 템플릿 리터럴을 사용 X - 템플릿 리터럴 - `${}`
// 계산된 속성명 (key)
// 변수를 속성의 key로 사용하고 싶을 때 사용하는 문법
const user3 = {
  // 변수를 대괄호로 감싸서 key표현
  [key]: "홍길동", // { name : "홍길동"}
};
console.log(user3);
