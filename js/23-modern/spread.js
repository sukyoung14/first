const obj1 = {
  name: "홍길동",
  age: 20,
  job: "개발자",
  location: "서울",
  country: "대한민국",
};
// 객체 복사
const obj2 = obj1;
console.log(obj1);
console.log(obj2);

obj2["location"] = "대구";
console.log(obj2);
console.log(obj1); // obj2만 수정했는데 obj1도 수정되어 버린다
// ... 스프레드 연산자를 활용한 복사
const obj3 = { ...obj1 }; // 객체 펼침연산자 사용해서 객체 복사 해야 함
console.log(obj3);
obj2["name"] = "고길동";
console.log(obj3);
console.log(obj1); // obj2만 수정했는데 obj1도 수정
// 객체의 속성을 수정하면서 새로운 객체를 생성
// age 속성을 수정한 새로운 객체를 생성
obj4 = { ...obj1 };
obj4["age"] = 21;
obj5 = { ...obj1, age: 23 };
obj6 = { ...obj1, planet: "지구" };
console.log(obj6);
let arr1 = [1, 2, 3, 4, 5];
let arr2 = arr1;
arr2[0] = 0;
console.log(arr1);
console.log(arr2);
let arr3 = [...arr1];
arr3[0] = 1;
arr3[0] = 2;
console.log(arr3);

let arr = [1, 2, 3, 4, 5];
arr[0] = 1;
arr[0] = 2;
console.log(arr);

let arr4 = [...arr1, 6, 7, 8];
console.log(arr4);

// 리액트에서는 스프레드 연산자를 어떻게 사용하는가?
let objectArr = [{ name: "철수", age: 20 }];
objectArr.push({ name: "영희", age: 20 }); // --> 객체 추가시는 push보다 ...를 써야 한다
console.log(objectArr);
// 새로운 객체를 추가한 "새로운 배열"을 생성
let newObjectArr = [...objectArr, { name: "영희", age: 20 }];
console.log(newObjectArr);
