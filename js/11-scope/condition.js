let glovalVar = "전역변수";
console.log(glovalVar);

const conditionConst = "코드 블록 외부에서 선언한 상수";
if (true) {
  const conditionConst = "코드 블록 내부에서 선언한 상수";
  glovalVar = "";
  console.log(conditionConst); //코드 블록 내부에서 선언한 상수
}
console.log(conditionConst); //코드 블록 외부에서 선언한 상수
let conditionConst2 = "코드 블록 외부에서 선언한 상수";
if (true) {
  conditionConst2 = "코드 블록 내부에서 선언한 상수";
  glovalVar = "";
  console.log(conditionConst2); //코드 블록 내부에서 선언한 상수
}
console.log(conditionConst2); //코드 블록 내부에서 선언한 상수
