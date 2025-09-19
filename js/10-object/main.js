// 객체
// 0개 이상의 속성을 저장하는 자료형
// 속성 = ket(이름) + value(값)
// {} 중괄호로 생성
// 변수 emptyObject를 선언하고 빈 객체를 할당
let emptyObject = {};
// key는 name
// value는 "홍길동"인
// 속성 -> key : value
// 변수 person1 할당
let person1 = {
  name: "홍길동",
};
// 객체 생성 기본구조
//let object = { key1: value1, key2: value2 };

// 객체 속성 접근
// 대괄호 사용 []
// 객체 데이터[key]
let person2 = { name: "홍길동", score: 99, pass: true };
console.log(person2["score"]);
// 객체의 ke(이름)에 사용가능한 자료형
// 문자열
console.log(person2.score);

// 객체 속성 수정
console.log(person2["name"]);
person2["name"] = "장영실";
console.log(person2["name"]);

// 객체 속성 추가
person2["주소"] = "한국";
console.log(person2["주소"]);

// 객체 속성 제거
delete person2["주소"];
console.log(person2);

// 모든 key를 배열로 반환
let keyArray = Object.keys(person2);
console.log(keyArray);

// 모든 value를 배열로 반환
let keyValue = Object.values(person2);
console.log(keyValue);

// 모든 key, value를 배열로 변환
let keyValueArray = Object.entries(person2);
console.log(keyValueArray);
