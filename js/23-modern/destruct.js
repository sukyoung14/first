// 구조 분해 할당
const object = {
  name: "홍길동",
  age: 20,
  name2: "홍길동",
  age: 20,
};

// 구조 분해 할당을 활용하지 않은 경우 속성을 개별 변수에 할당
let name = object["name"];
let age = object["age"];
// 변수명과 객체의 속성명(ket)가 동일해야 한다
let { name2, age2 } = object;
console.log(name);
console.log(name2);

const object2 = {
  id: 1,
  title: "갤럭시",
  description: "삼성 스마트폰",
  price: 9900,
};
let { title, price } = object2; // 객체에서 필요한 변수만 추출
console.log(title);

let objectArr = [{ name3: "철수", age: 20 }];
objectArr.push({ name3: "영희", age: 20 }); // --> 객체 추가시는 push보다 ...를 써야 한다
let newObjectArr = [...objectArr, { name3: "선영", age: 20 }];
console.log(objectArr);
let { name3 } = newObjectArr;
console.log(name3);

// fetch("https://dummyjson.com/comments")
//   .then((res) => res.json())
//   .then((data) => {
//     const comments = data["comments"];
//     console.log(comments);
//     newComments = comments.map((element) => {
//       // 구조 분해 할당 활용
//       // id, body 속성만 변수에 저장
//       const { id, body } = element;

//       // 단축 프로퍼티 활용
//       return { id, body };
//     });
//     console.log(newComments);
//   });

// 객체를 인자로 전달받는 함수
function func(object) {
  console.log(`Hello ${object["name"]}, I'm ${object["age"]}`);
  //구조분해 할당으로 변수에 속성값 (value) 출력
  const { name, age } = object;
  console.log(`Hello ${name}, I'm ${age}`);
}
// 매개변수에 구조분해 할당을 활용
function func2({ name, age }) {
  console.log(`Hello ${name}, I'm ${age}`);
}
const user = {
  name: "홍길동",
  age: 20,
};
func(user);
func2(user);

const object1 = {
  id: 11,
  user: {
    name: "name",
  },
};
//console.log(object["student"][id]); // 오류 발생
