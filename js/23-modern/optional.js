const user = {
  name: "홍길동",
  address: {
    city: "서울",
  },
};
// 옵셔널 체이닝 : ?.속성명 : 에러 대신 undefined
console.log(user?.name); // 홍길동
console.log(user.name); // 홍길동
console.log(user?.phone); // undefined
