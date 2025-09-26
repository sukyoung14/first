// 자료형 null : 개발자가 의도한 빈 데이터
// 자료형 undefined : 개발자가 의도하지 않은 빈 데이터
let value1; //undefined
let value2 = null; //null

console.log(value1);
console.log(value2);
// Nullish  : null 또는 undefined일 때 기본값(default value)을 적용
let value3 = null ?? "기본값";
console.log(value3);
