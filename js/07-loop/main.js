//for (초기화문; 조건식; 증감문)
for (let number2 = 0; number2 < 3; number2 = number2 + 1) {
  console.log(number2);
}
// 숫자를 0번 5까지 출력
for (let i = 0; i > 6; i++) {
  console.log(i);
}

// break와 continue는 무조건 반복문 내 조건문과 함께 사용
// 특정 조건하에서 break와 continue를 실행시키게 코드를 작성
for (let i = 0; i < 5; i++) {
  if (i === 2) {
    break;
  }
  console.log(`i의 값: ${i}`);
}
for (let i = 0; i < 5; i++) {
  if (i === 2) {
    continue;
  }
  console.log(`i의 값: ${i}`);
}
