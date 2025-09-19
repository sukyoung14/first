// 배열의 생성
// 대괄호 [] 사용

// 문자열의 생성 : ""
// "" 빈 문자열 데이터
[]; // 빈 배열 데이터
//빈 배열 데이터를 변수 emptyArray 할당
let emptyArray = [];

// 1을 저장한 배열 데이터를 변수 oneArray 할당
let oneArray = [1];
// 원소를 여러개 저장하기 위해서는 쉼표(,) 원소를 구분해서 작성
// 1, 2, 3, 4를 저장한 배열 데이터를 변수 manArray 할당
let manArray = [1, 2, 3, 4];

// 배열의 인덱스
// 배열 내부 원소의 위치 번호
// 시작 : 0
// 마지막 : 배열원소(길이) 수 -1

// 배열 원소 접근
// 대괄호 [] 사용
// 배열데이터[위치번호]

// 변수 array2에 [1, "2", 3]을 저장한 배열을 할당
let array2 = [1, "2", 3];
// 첫번째 위치의 원소에 접근한다
// array2[index]
array2[0];
array2[1];
array2[2];
//첫번째 원소를 -1로 재활당
console.log(array2[0]);
array2[0] = -1;
console.log(array2[0]);

// 원소의 추가와 제거
// 배열데이터.push(데이터)
// .push() 함수

// 변수 array3을 선언하고, 배열데이터[0]을 할당
let array3 = [0];
// 배열 array3에 1을 원소로 추가
array3.push(1);
console.log(array3);

// 배열 데이터 .pop()
// 배열의 마지막 원소를 제거
array3.pop();
console.log(array3);

// 배열의 반복
// 배열에 저장된 원소를 반복해서 접근하는 방법

// [1,2,3]
// for 반복문 활용
// 배열의 인덱스가 0부터 배열의 길이 -1 범위를 가진다는 특성 활용
// 0부터 배열 길이 -1까지 숫자를 출력하세요
// 배열의 길이 : 배열데이터.length
// 변수 array4를 선언하고, 배열 [1,2,3]을 할당
let array4 = [1, 2, 3];
// 배열 array4의 길이 출력
// 0부터 배열 길이 -1 까지 반복
console.log(array4.length);
for (let index = 0; index < array4.length; index++) {
  console.log(`${index} : ${array4[index]}`);
}
// for...of 반복문
// 인덱스(위치번호) 활용 X
// 배열에서 직접적으로 원소를 꺼내옴
for (let element of array4) {
  console.log(element);
}
