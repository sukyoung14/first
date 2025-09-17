// 형변환
// 명시적 형 변환 : 개발자가 한것
// 암시적 형 변환 : js 엔진(번역기)이 자동으로 한 것

// 문자열로의 명시적 변환
// String() 함수 : 문자열로 변환하는 도구
// 함수 : 프로그래밍 언어의 특정 기능을 수행하는 도구

// String(데이터) / String(변수)
console.log(String(123)); // 숫자형 -> 문자열
console.log(String(123) === "123");
// true, undefined, null을 문자열로 형변환 코드
console.log(String(true));
console.log(String(undefined));
console.log(String(null));

// 숫자형 명시적 형 변환
// Number() 함수 : 숫자형으로 변환하는 도구
// Number(데이터) / Number(변수)
// 문자열 "123"을 숫자형으로 변환해서 출력하는 코드
console.log(Number("123"));
console.log(Number("123") === 123);

// 불리언 명시적 형 변환
// 불리언 데이터 : 맞다(true) / 틀리다(false)
// Boolean() 함수 : 불리언으로 형변환하는 도구
// 불리언 형 변환 규칙
// 각 자료형마다 최소 1개는 틀리다(false)로 변환
// false가 아닌 데이터는 모두 맞다(true)로 변환
console.log(Boolean(0)); // false
console.log(Boolean(-0)); // false
console.log(Boolean("")); // false
console.log(Boolean(" ")); // true
console.log(Boolean(null)); // false
console.log(Boolean(undefined)); // false
console.log(Boolean(NaN)); // false

// 암시적 불리언 형 변환
// 불리언 데이터가 아닌 데이터에 대한 논리연산 (&&, ||, !)
// 0 -> 암시적 불리언형 변환 -> false -> not 연산 -> true
console.log(!0); // true
console.log(!""); // true
// 정확한 논리연산자 작동 방식
// AND(&&) : 2개의 데이터가 모두 true인 데이터라면 오른쪽 데이터를 생성
// true && true
console.log(1 && 2); // 2
// false && true
console.log(0 && 1); // 0

// OR(||) : 왼쪽 데이터가 true면 왼쪽 데이터 생성,
// 왼쪽 데이터가 false면, 오른쪽 데이터를 생성
// true || false
console.log(1 || 0); // 1
// false || true
console.log(0 || 10); // 10
// false || false
console.log("" || 0); // 0
